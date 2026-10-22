# 13_04 - JavaAbstraccio

## Introducció

Aquest exemple mostra el concepte d'**abstracció** en Java, utilitzant classes abstractes i interfícies. L'abstracció permet ocultar els detalls d'implementació complexos i mostrar només la funcionalitat essencial als usuaris.

## Conceptes

### Classes Abstractes
Una classe abstracta és una classe que no es pot instanciar directament i pot contenir mètodes abstractes (sense implementació) i mètodes concrets (amb implementació).

```java
public abstract class Vehicle {
    protected String marca;

    // Mètode abstracte (sense implementació)
    public abstract void accelerar();

    // Mètode concret (amb implementació)
    public void aturar() {
        System.out.println("Vehicle aturat");
    }
}
```

### Interfícies
Una interfície és un contracte que defineix què ha de fer una classe, però no com ho fa. Tots els mètodes d'una interfície són abstractes per defecte (fins Java 8).

```java
public interface Volador {
    void volar();
    void aterrar();
}
```

### Diferències entre Classes Abstractes i Interfícies

| Classe Abstracta | Interfície |
|------------------|------------|
| Pot tenir mètodes abstractes i concrets | Tots els mètodes són abstractes (abans de Java 8) |
| Pot tenir atributs | Només constants (public static final) |
| Una classe només pot heretar d'una classe abstracta | Una classe pot implementar múltiples interfícies |
| Utilitza `extends` | Utilitza `implements` |

### Paraula Clau `abstract`
S'utilitza per declarar classes i mètodes abstractes que han de ser implementats per les subclasses.

### Paraula Clau `implements`
S'utilitza per indicar que una classe implementa una o més interfícies.

## Exemples

Aquest exemple demostra:
- Creació de classes abstractes amb mètodes abstractes i concrets
- Definició d'interfícies
- Implementació d'interfícies en classes concretes
- Herència de classes abstractes
- Utilització de múltiples interfícies en una mateixa classe
- Exemple pràctic amb vehicles (Cotxe, Avió, Dron)

## Notes Importants

💡 **Consells**:
- Utilitzar classes abstractes quan hi ha funcionalitat compartida entre subclasses
- Utilitzar interfícies per definir contractes que poden ser implementats per classes no relacionades
- Una classe pot implementar múltiples interfícies però només heretar d'una classe
- Els mètodes abstractes han de ser implementats obligatòriament per les subclasses concretes
- Les interfícies són ideals per aconseguir polimorfisme sense herència
