/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tarea3d;

import java.io.StringReader;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import tarea6.AnalizadorLexico;
import tarea6.AnalizadorSintactico;

/**
 *
 * @author yeferal
 */
public class Tarea3D {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        
        Scanner s = new Scanner(System.in);
 
        System.out.println("Escriba el texto de entrada");
        String texto = s.nextLine();
        
        AnalizadorLexico lexico = new AnalizadorLexico(new StringReader(texto));
        AnalizadorSintactico sintactico = new AnalizadorSintactico(lexico);
        try {
            sintactico.parse();
        } catch (Exception ex) {
            
        }
        String salida = sintactico.salida;
        System.out.println("\nCodigo 3 Direcciones: \n"+salida);
    }

}
