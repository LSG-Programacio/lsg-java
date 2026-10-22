public class ProvesMetodes {
    public static void main(String[] args) {
        boolean assertionsEnabled = false;
        assert assertionsEnabled = true;
        if (!assertionsEnabled) throw new IllegalStateException("Run with java -ea");

        assert ConversioTemperatures.celsiusAFahrenheit(0) == 32;
        assert ConversioTemperatures.fahrenheitACelsius(212) == 100;
        assert ConversioTemperatures.celsiusAFahrenheit(-40) == -40;
        assert ConversioTemperatures.fahrenheitACelsius(-40) == -40;

        assert ValidadorDNI.validarFormatDNI("12345678Z");
        assert ValidadorDNI.validarFormatDNI("00000000T");
        assert !ValidadorDNI.validarFormatDNI("");
        assert !ValidadorDNI.validarFormatDNI("1234567Z");
        assert !ValidadorDNI.validarFormatDNI("1234567AZ");
        assert !ValidadorDNI.validarFormatDNI("123456789");
        assert ValidadorDNI.extreurePartNumerica("00000000T") == 0;
        assert ValidadorDNI.calcularLletraDNI(12345678) == 'Z';
        assert ValidadorDNI.calcularLletraDNI(0) == 'T';
        assert ValidadorDNI.extreureLletra("12345678A") != ValidadorDNI.calcularLletraDNI(12345678);

        double[] notes = {0, 5, 7, 9, 10};
        assert SistemaNotes.validarNota(0) && SistemaNotes.validarNota(10);
        assert !SistemaNotes.validarNota(-0.01) && !SistemaNotes.validarNota(10.01);
        assert !SistemaNotes.validarNota(Double.NaN);
        assert !SistemaNotes.validarNota(Double.POSITIVE_INFINITY);
        assert Math.abs(SistemaNotes.calcularMitjana(notes, 5) - 6.2) < 1e-10;
        assert SistemaNotes.calcularMitjana(new double[0], 0) == 0;
        assert SistemaNotes.trobarMaxim(notes, 5) == 10;
        assert SistemaNotes.trobarMinim(notes, 5) == 0;
        assert SistemaNotes.comptarAprovades(notes, 5) == 4;
        assert SistemaNotes.obtenirQualificacio(4.99).equals("Suspès");
        assert SistemaNotes.obtenirQualificacio(5).equals("Aprovat");
        assert SistemaNotes.obtenirQualificacio(7).equals("Notable");
        assert SistemaNotes.obtenirQualificacio(9).equals("Excel·lent");

        assert Factorial.calcularFactorial(0) == 1;
        assert Factorial.calcularFactorial(1) == 1;
        assert Factorial.calcularFactorial(5) == 120;
        assert Factorial.calcularFactorial(20) == 2432902008176640000L;
        assert Fibonacci.calcularFibonacci(0) == 0;
        assert Fibonacci.calcularFibonacci(1) == 1;
        assert Fibonacci.calcularFibonacci(10) == 55;

        Animal animal = new Gos("Max", 3, "Labrador");
        assert animal.getNom().equals("Max") && animal.getEdat() == 3;
        animal.setNom("Llamp");
        assert animal.getNom().equals("Llamp");
        FiguraGeometrica cercle = new Cercle("vermell", 2);
        assert Math.abs(cercle.calcularArea() - 4 * Math.PI) < 1e-10;
        assert Math.abs(cercle.calcularPerimetre() - 4 * Math.PI) < 1e-10;
        Rectangle rectangle = new Rectangle("blau", 4, 6);
        assert rectangle.calcularArea() == 24 && rectangle.calcularPerimetre() == 20;
        assert !rectangle.esQuadrat();
        assert new Rectangle("verd", 4, 4).esQuadrat();
        Triangle triangle = new Triangle("groc", 3, 4, 3, 4, 5);
        assert triangle.calcularArea() == 6 && triangle.calcularPerimetre() == 12;
        assert new Triangle("rosa", 4).esEquilater();
        Volador avio = new Avio("Boeing", "747", 2020, 416, 13000);
        Volador dron = new Dron("DJI", 4, 6000);
        Submergible submari = new Submari("Nautilus", "SSN-571", 1954, 140, 730);
        assert avio.obtenirAltitudMaxima() == 13000;
        assert dron.obtenirAltitudMaxima() == 6000;
        assert submari.obtenirProfunditatMaxima() == 730;
        System.out.println("OK method assertions");
    }
}
