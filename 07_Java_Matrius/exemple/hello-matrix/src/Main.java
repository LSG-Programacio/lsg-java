import java.sql.SQLOutput;
import java.util.Scanner;

public class Main {
    public static void main(String []args){

        int n = 2;
        int m = 3;

        int[][] valores = new int[n][m];

        Scanner input = new Scanner(System.in);

        for (int i = 0; i < valores.length; i++) {
            for (int j = 0; j < valores[i].length; j++) {
                System.out.print("valor (" + i + "," + j + "):");
                valores[i][j] = input.nextInt();
            }

        }

        String LINEAS = "--------";

        // mostrar los valores
        System.out.println(LINEAS);
        for (int i = 0; i < valores.length; i++){
            System.out.print("|");
            for (int j = 0; j < valores[i].length; j++) {
                System.out.print(valores[i][j] + "|");
            }
            System.out.println();
            System.out.println(LINEAS);
        }

        // mostrar la suma de todos
        int suma = 0;
        for (int i = 0; i < valores.length; i++) {
            for (int j = 0; j < valores[i].length; j++) {
                // suma += valores[i][j];
                suma = suma + valores[i][j];

                // esto suma 1.
                // suma++;
                // esto suma 2.
                // suma+=2;
            }
        }

        System.out.println(suma);


    }
}
