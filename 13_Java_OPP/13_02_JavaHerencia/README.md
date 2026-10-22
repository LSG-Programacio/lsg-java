# 13_02 - JavaHerencia

## Introducció

Aquest exemple mostra el concepte d'**herència** en Java, un dels pilars fonamentals de la Programació Orientada a Objectes. La herència permet crear noves classes basades en classes existents, reutilitzant i estenent el seu codi.

## Conceptes

### Herència
La herència és un mecanisme que permet crear una nova classe (classe filla o subclasse) a partir d'una classe existent (classe pare o superclasse). La classe filla hereta tots els atributs i mètodes de la classe pare.

```java
public class Animal {
    protected String nom;

    public void menjar() {
        System.out.println(nom + " està menjant");
    }
}

public class Gos extends Animal {
    public void bordar() {
        System.out.println(nom + " està bordant: Bup bup!");
    }
}
```

### Paraula Clau `extends`
S'utilitza per indicar que una classe hereta d'una altra.

### Modificador `protected`
Permet que els atributs siguin accessibles des de les subclasses però no des de fora de la jerarquia de classes.

### Sobreescriptura de Mètodes
Les subclasses poden sobreescriure mètodes de la superclasse per proporcionar una implementació específica.

```java
@Override
public void menjar() {
    System.out.println(nom + " està menjant pinso per a gossos");
}
```

### Paraula Clau `super`
Permet accedir a mètodes i constructors de la classe pare.

## Exemples

Aquest exemple demostra:
- Creació d'una jerarquia de classes (Animal -> Gos, Gat)
- Herència d'atributs i mètodes
- Sobreescriptura de mètodes amb `@Override`
- Utilització de `super` per cridar constructors de la classe pare
- Relació "és un" (is-a): Un Gos és un Animal

## Notes Importants

💡 **Consells**:
- Utilitzar herència quan hi ha una relació clara "és un"
- No abusar de la herència; preferir composició quan sigui més adequat
- Utilitzar `@Override` per evitar errors en la sobreescriptura
- Els atributs `private` de la classe pare no són accessibles directament des de la subclasse
- Java només permet herència simple (una classe només pot heretar d'una altra classe)
