# Java — La Salle Gràcia

Apunts i exemples de Java del cicle de grau superior d'informàtica. El material es manté en català, seguint els projectes originals.

## Temari

| Tema | Contingut |
| --- | --- |
| [Introducció](01_Java_Introduccio/readme.md) | JDK, IDE, Hello World i variables primitives |
| [Operadors](02_Java_Operadors_Logics_Aritmetics/readme.md) | Aritmètica, comparacions, taules de veritat i curtcircuit |
| [Entrada i sortida](03_Java_Input_Output/readme.md) | Scanner, print, println i printf |
| [Condicionals](04_Java_Condicionals/readme.md) | if, else-if, switch, ternari i condicionals niats |
| [Iteracions](05_Java_Interacions/README.md) | Bucles i combat Topuria vs Holloway |
| [Arrays](06_Java_Arrays/read.md) | Inicialització, recorregut, cerca, màxim, mínim i mitjana |
| [Matrius](07_Java_Matrius/read.md) | Operacions bàsiques, diagonals, sumes i transposició |
| [Strings i ArrayList](08_Java_Strings_Arraylist/read.md) | Manipulació de text, llistes, cerques, ordenació i filtres |
| [Mètodes](09_Java_Metodes/read.md) | Calculadora, bitllets, temperatures, DNI, taules i notes |
| [Recursivitat](10_Java_Recursivitat/read.md) | Factorial, Fibonacci i casos base |
| [Fitxers](11_Java_Files/README.md) | Rutes, lectura de text, fitxers binaris i exercicis |
| [Excepcions](12_Java_Exceptions/README.md) | try/catch/finally i excepcions pròpies del caixer |
| [Programació orientada a objectes](13_Java_OPP/README.md) | Classes, herència, polimorfisme, abstracció i interfícies |
| [Swing](14_Java_X/README.md) | Calculadora Dora Exploradora |
| [JavaFX](15_Java_FX/README.md) | Stage, Scene, FXML, controladors i projectes Maven |

## Executar els exemples

Cada carpeta d'exemple és independent. Diversos programes es diuen `Main`; compila cada exemple per separat. Els exemples de consola incorporats segueixen l'estructura local sense declaració de paquet.

Amb un JDK 17 o superior disponible a `PATH`, des de l'arrel del projecte (PowerShell):

```powershell
Set-Location '06_Java_Arrays/06_01_Arrays_Operacions_Basiques'
javac -encoding UTF-8 Main.java
java Main
```

Per a un exemple amb diverses classes:

```powershell
Set-Location '13_Java_OPP/13_02_JavaHerencia'
javac -encoding UTF-8 *.java
java JavaHerencia
```

Les carpetes introductòries Hello World i variables contenen fragments als apunts. `13_01_JavaClasses` també aporta fragments; `12_Java_Exceptions/11_02_DemoExceptions/main.java` continua buit com a l'origen.

Els projectes JavaFX es compilen per separat amb el seu `pom.xml`: `HelloWorld` i `demo` demanen Java 17, mentre que `JavaFX_Bobardino` demana Java 21. Des de la carpeta d'un d'aquests projectes, executa `.\mvnw.cmd javafx:run` (pot descarregar Maven i dependències).

## Comprovar els exemples incorporats

Des de l'arrel, amb PowerShell i el JDK a `PATH`:

```powershell
powershell -NoProfile -File tests/ComprovarExemples.ps1
```

La comprovació compila els 34 fitxers Java incorporats o completats en directoris temporals, executa 20 programes amb dades conegudes i comprova conversions, DNI, estadístiques, recursivitat i objectes amb asserts. No obre les aplicacions gràfiques.

Els exemples es mantenen didàctics: introdueix dades numèriques del tipus demanat i dimensions positives. El factorial amb `long` només és exacte fins a 20; Fibonacci recursiu es recomana per a posicions petites (fins a 40). Els límits i l'abast de la revisió estan detallats a l'informe.

## Procedència i comparació

Material ampliat a partir de [fconstanslasalle/LSG_0485_Java](https://github.com/fconstanslasalle/LSG_0485_Java), revisió [a805dbd](https://github.com/fconstanslasalle/LSG_0485_Java/tree/a805dbd2b45050eb4f7ba328a67f5c7463b48ddc), consultada el 22 d'octubre de 2026. Es conserven els apunts, exercicis i programes propis que ja hi havia.

L'[informe de comparació](COMPARACIO.md) explica què faltava, on s'ha incorporat i quins fitxers s'han exclòs per ser duplicats o configuració local.
