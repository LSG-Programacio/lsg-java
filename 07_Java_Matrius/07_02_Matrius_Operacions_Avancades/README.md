# 07_02 - Matrius Operacions Avançades

## Introducció

Aquest exemple mostra operacions més complexes amb matrius en Java, incloent càlculs per files i columnes, diagonals i transposició. Aquestes operacions són útils en aplicacions matemàtiques, gràfics i processament de dades.

## Conceptes

### Operacions per Files
```java
// Suma d'elements d'una fila
int sumaFila(int[][] matriu, int fila) {
    int suma = 0;
    for (int j = 0; j < matriu[fila].length; j++) {
        suma += matriu[fila][j];
    }
    return suma;
}
```

### Operacions per Columnes
```java
// Suma d'elements d'una columna
int sumaColumna(int[][] matriu, int columna) {
    int suma = 0;
    for (int i = 0; i < matriu.length; i++) {
        suma += matriu[i][columna];
    }
    return suma;
}
```

### Diagonal Principal
Elements on `i == j`
```java
// Suma diagonal principal
int sumaDiagonalPrincipal(int[][] matriu) {
    int suma = 0;
    for (int i = 0; i < matriu.length; i++) {
        suma += matriu[i][i];
    }
    return suma;
}
```

### Diagonal Secundària
Elements on `i + j == n - 1`
```java
// Suma diagonal secundària
int sumaDiagonalSecundaria(int[][] matriu) {
    int suma = 0;
    int n = matriu.length;
    for (int i = 0; i < n; i++) {
        suma += matriu[i][n - 1 - i];
    }
    return suma;
}
```

### Transposició
Intercanviar files per columnes
```java
int[][] transposar(int[][] matriu) {
    int files = matriu.length;
    int columnes = matriu[0].length;
    int[][] transposada = new int[columnes][files];

    for (int i = 0; i < files; i++) {
        for (int j = 0; j < columnes; j++) {
            transposada[j][i] = matriu[i][j];
        }
    }
    return transposada;
}
```

## Exemples

Aquest exemple demostra:
- Calcular la suma d'elements de cada fila
- Calcular la suma d'elements de cada columna
- Identificar i sumar la diagonal principal
- Identificar i sumar la diagonal secundària
- Transposar una matriu (intercanviar files per columnes)
- Trobar el màxim/mínim de cada fila o columna

## Exemple de Codi

```java
int[][] matriu = {
    {1, 2, 3},
    {4, 5, 6},
    {7, 8, 9}
};

// Suma per files
for (int i = 0; i < matriu.length; i++) {
    int sumaFila = 0;
    for (int j = 0; j < matriu[i].length; j++) {
        sumaFila += matriu[i][j];
    }
    System.out.println("Suma fila " + i + ": " + sumaFila);
}

// Suma per columnes
for (int j = 0; j < matriu[0].length; j++) {
    int sumaColumna = 0;
    for (int i = 0; i < matriu.length; i++) {
        sumaColumna += matriu[i][j];
    }
    System.out.println("Suma columna " + j + ": " + sumaColumna);
}

// Diagonal principal
int sumaDiagPrinc = 0;
for (int i = 0; i < matriu.length; i++) {
    sumaDiagPrinc += matriu[i][i];
}
System.out.println("Suma diagonal principal: " + sumaDiagPrinc);

// Transposició
int[][] transposada = new int[3][3];
for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
        transposada[j][i] = matriu[i][j];
    }
}
```

## Aplicacions Pràctiques

- **Matemàtiques**: Operacions amb matrius
- **Gràfics**: Transformacions d'imatges
- **Estadística**: Anàlisi de dades tabulars
- **Jocs**: Taulers de joc (escacs, tres en ratlla)
- **Simulacions**: Graelles de valors

## Notes Importants

💡 **Consells**:
- Per matrius quadrades: nombre de files = nombre de columnes
- La diagonal principal va de dalt-esquerra a baix-dreta
- La diagonal secundària va de dalt-dreta a baix-esquerra
- En transposar: dimensions s'intercanvien (mxn → nxm)

⚠️ **Atenció**:
- Verificar que la matriu sigui quadrada per operacions de diagonals
- Al transposar, crear una nova matriu amb dimensions invertides
- Cuidar amb índexs en operacions per columnes
