$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
$tempRoot = [IO.Path]::GetFullPath([IO.Path]::GetTempPath())
$buildRoot = Join-Path $tempRoot ('lsg-java-' + [Guid]::NewGuid().ToString('N'))
$cases = @(
    @{ Dir = '03_Java_Input_Output/03_01_Java_Scanner'; Main = 'ScannerExample'; Input = "Ada`n20`n1.75"; Patterns = @('Name: Ada', 'Age: 20', 'Height: 1.75m') }
    @{ Dir = '03_Java_Input_Output/03_02_Java_Print'; Main = 'PrintExample'; Input = ''; Patterns = @('on the same line\.', 'Total Cost: 7\.50') }
    @{ Dir = '06_Java_Arrays/06_01_Arrays_Operacions_Basiques'; Main = 'Main'; Input = "1`n2`n3`n4`n5"; Patterns = @('suma.*15', 'Posici.*4: 10') }
    @{ Dir = '06_Java_Arrays/06_02_Arrays_Cerca_Operacions'; Main = 'Main'; Input = "5`n-2`n7`n7`n0`n3`n7`n7"; Patterns = @('Valor m.xim: 7', 'Valor m.nim: -2', 'Mitjana: 3.0', 'posici.*1', 'apareix 2 vegades') }
    @{ Dir = '07_Java_Matrius/07_01_Matrius_Operacions_Basiques'; Main = 'Main'; Input = "2`n2`n1`n2`n3`n4"; Patterns = @('suma.*10', '6\s+8') }
    @{ Dir = '07_Java_Matrius/07_02_Matrius_Operacions_Avancades'; Main = 'Main'; Input = "2`n1`n2`n3`n4"; Patterns = @('Suma fila 0: 3', 'Suma columna 0: 4', 'diagonal principal: 5', 'diagonal secund.ria: 5', '1\s+3\s+2\s+4') }
    @{ Dir = '08_Java_Strings_Arraylist/08_02_String_Manipulacio'; Main = 'Main'; Input = "Hola Java`n  text  "; Patterns = @('Nombre de paraules: 2', 'Hola_Java', 'Text netejat:  "text"') }
    @{ Dir = '08_Java_Strings_Arraylist/08_03_ArrayList_Operacions_Basiques'; Main = 'Main'; Input = "2`nAnna`nJoan`n1`nPau`n1`nMaria`n0`nn"; Patterns = @('Mida: 2 elements', '0: Maria', '1: Pau') }
    @{ Dir = '08_Java_Strings_Arraylist/08_04_ArrayList_Cerca_Operacions'; Main = 'Main'; Input = "4`n3`n1`n3`n2`n3`n3"; Patterns = @('Suma total: 9', 'Mitjana: 2.25', 'apareix 2 vegades', 'descendent.*\[3, 3, 2, 1\]', 'sense duplicats: \[1, 2, 3\]') }
    @{ Dir = '08_Java_Strings_Arraylist/08_05_String_ArrayList_Combinat'; Main = 'Main'; Input = "3`nAnna`nPau`nAlba`nan`nA`nJava es divertit"; Patterns = @('Total: 2 alumnes', 'Paraules trobades: 3', 'Amb guions: "Java-es-divertit"') }
    @{ Dir = '09_Java_Metodes/09_03_Conversio_Temperatures'; Main = 'ConversioTemperatures'; Input = "1`n0`n2`n212`n3"; Patterns = @('0.00.C = 32.00.F', '212.00.F = 100.00.C') }
    @{ Dir = '09_Java_Metodes/09_04_Validador_DNI'; Main = 'ValidadorDNI'; Input = "12345678Z`n12345678A`nabc`nsortir"; Patterns = @('DNI: 12345678Z', 'lletra incorrecta', 'format inv') }
    @{ Dir = '09_Java_Metodes/09_05_Taules_Multiplicar'; Main = 'TaulesMultiplicar'; Input = "1`n7`n`n3"; Patterns = @('TAULA DEL 7', '7 . 10 =  70') }
    @{ Dir = '09_Java_Metodes/09_06_Sistema_Notes'; Main = 'SistemaNotes'; Input = "1`n4`n1`n8`n6`n7"; Patterns = @('Mitjana: 6.00', 'Notes aprovades: 1', 'Notes suspeses: 1', '50.00%') }
    @{ Dir = '10_Java_Recursivitat/10_01_Factorial'; Main = 'Factorial'; Input = '5'; Patterns = @('5 .*120') }
    @{ Dir = '10_Java_Recursivitat/10_02_Fibonacci'; Main = 'Fibonacci'; Input = '10'; Patterns = @('10 .*55', '0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55') }
    @{ Dir = '11_Java_Files/11_01_Rutes'; Main = 'ObtenirRuta'; Input = ''; Patterns = @('Directori actual', 'exemple_io.txt', 'exemple_nio.txt', 'arxiu.doc') }
    @{ Dir = '13_Java_OPP/13_02_JavaHerencia'; Main = 'JavaHerencia'; Input = ''; Patterns = @('Max', 'pinso per a gossos', 'Misi', 'pinso per a gats', 'FI DE L.EXEMPLE') }
    @{ Dir = '13_Java_OPP/13_03_JavaPolimorfisme'; Main = 'JavaPolimorfisme'; Input = ''; Patterns = @('Triangle', 'Resultats Finals', 'FI DE L.EXEMPLE') }
    @{ Dir = '13_Java_OPP/13_04_JavaAbstraccio'; Main = 'JavaAbstraccio'; Input = ''; Patterns = @('Nautilus', 'DJI Phantom 4', '13000.0', '730.0', 'FI DE L.EXEMPLE') }
)

try {
    New-Item -ItemType Directory -Path $buildRoot | Out-Null
    $assertionSources = @()
    $sourceCount = 0
    foreach ($case in $cases) {
        $sourceDir = Join-Path $projectRoot $case.Dir
        $target = Join-Path $buildRoot $case.Main
        # Several independent exercises use Main, so give each its own classpath.
        $target = Join-Path $target (Split-Path -Leaf $sourceDir)
        New-Item -ItemType Directory -Path $target -Force | Out-Null
        $sources = @(Get-ChildItem -LiteralPath $sourceDir -Filter '*.java' | ForEach-Object FullName)
        $compileOutput = & javac -encoding UTF-8 -d $target $sources 2>&1
        if ($LASTEXITCODE -ne 0) { throw "Compilation failed: $($case.Dir)\n$compileOutput" }
        $sourceCount += $sources.Count
        $assertionSources += @($sources | Where-Object { [IO.Path]::GetFileName($_) -ne 'Main.java' })
        $output = ($case.Input | & java '-Dfile.encoding=UTF-8' '-Duser.language=en' '-Duser.country=US' -cp $target $case.Main 2>&1) -join "`n"
        if ($LASTEXITCODE -ne 0) { throw "Execution failed: $($case.Dir)\n$output" }
        foreach ($pattern in $case.Patterns) {
            if ($output -notmatch $pattern) { throw "Missing output '$pattern' in $($case.Dir):\n$output" }
        }
        Write-Output "OK $($case.Dir)"
    }

    $assertions = Join-Path $PSScriptRoot 'ProvesMetodes.java'
    & javac -encoding UTF-8 -d $buildRoot $assertions $assertionSources
    if ($LASTEXITCODE -ne 0) { throw 'Could not compile method checks.' }
    & java -ea -cp $buildRoot ProvesMetodes
    if ($LASTEXITCODE -ne 0) { throw 'Method assertions failed.' }
    Write-Output "OK $sourceCount Java sources, $($cases.Count) programs and method assertions."
} finally {
    $resolvedBuild = [IO.Path]::GetFullPath($buildRoot)
    if (-not $resolvedBuild.StartsWith($tempRoot, [StringComparison]::OrdinalIgnoreCase) -or
        (Split-Path -Leaf $resolvedBuild) -notlike 'lsg-java-*') {
        throw "Unexpected cleanup path: $resolvedBuild"
    }
    if (Test-Path -LiteralPath $resolvedBuild) { Remove-Item -LiteralPath $resolvedBuild -Recurse -Force }
}
