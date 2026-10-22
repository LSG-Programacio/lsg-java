# 09_04 - Validador DNI

## Introducció

Aquest exemple mostra com validar un DNI (Document Nacional d'Identitat) espanyol utilitzant mètodes. Inclou validació de format i càlcul de la lletra del DNI.

## Conceptes

### Estructura del DNI
- 8 dígits seguits d'una lletra
- La lletra es calcula a partir dels números
- Format: 12345678Z

### Càlcul de la Lletra
```java
public char calcularLletraDNI(int numeros) {
    String lletres = "TRWAGMYFPDXBNJZSQVHLCKE";
    int residu = numeros % 23;
    return lletres.charAt(residu);
}
```

### Validació de Format
```java
public boolean validarFormat(String dni) {
    // Comprovar longitud
    if (dni.length() != 9) return false;

    // Comprovar que els primers 8 són dígits
    for (int i = 0; i < 8; i++) {
        if (!Character.isDigit(dni.charAt(i))) {
            return false;
        }
    }

    // Comprovar que l'últim és una lletra
    return Character.isLetter(dni.charAt(8));
}
```

## Exemples

Aquest exemple demostra:
- Validació de format amb mètodes
- Manipulació de Strings
- Càlcul matemàtic (mòdul)
- Mètodes de validació boolearis
- Extracció de parts d'un String

## Algoritme de Validació

1. **Comprovar longitud**: Ha de ser 9 caràcters
2. **Validar números**: Primers 8 caràcters han de ser dígits
3. **Validar lletra**: Últim caràcter ha de ser una lletra
4. **Calcular lletra correcta**: Aplicar l'algoritme
5. **Comparar**: La lletra ha de coincidir amb la calculada

## Notes Importants

💡 **Consells**:
- Separar validació de format del càlcul de lletra
- Convertir a majúscules per comparar
- Retornar missatges d'error clars

⚠️ **Atenció**:
- La lletra és sensible a majúscules (normalitzar)
- Validar abans de processar
- Gestionar errors d'entrada
