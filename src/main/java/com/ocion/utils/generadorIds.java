package com.ocion.utils;

import java.util.Random;

public class generadorIds {

    public static String generadorIdCupones () {
        Random random = new Random();
        StringBuilder idCupon = new StringBuilder();

        for (int i = 0; i < 5; i++) {
            int numeroAleatorio = random.nextInt(10);
            idCupon.append(numeroAleatorio);
        }

        String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 5; i++) {
            int indiceAleatorio = random.nextInt(letras.length());
            char letraAleatoria = letras.charAt(indiceAleatorio);
            idCupon.append(letraAleatoria);
        }

        return idCupon.toString();

    }


    public static String generadorIdUsuario () {

        Random random = new Random();
        StringBuilder idUsuario = new StringBuilder();

    
        String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 3; i++) {
            int indiceAleatorio = random.nextInt(letras.length());
            char letraAleatoria = letras.charAt(indiceAleatorio);
            idUsuario.append(letraAleatoria);
        }

        for (int i = 0; i < 7; i++) {
            int numeroAleatorio = random.nextInt(10);
            idUsuario.append(numeroAleatorio);
        }

        return idUsuario.toString();
    }

    public static String generadorIdOfertas () {
        Random random = new Random();
        StringBuilder idOferta = new StringBuilder();

        for (int i = 0; i < 3; i++) {
            int numeroAleatorio = random.nextInt(10);
            idOferta.append(numeroAleatorio);
        }

        String letras = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        for (int i = 0; i < 4; i++) {
            int indiceAleatorio = random.nextInt(letras.length());
            char letraAleatoria = letras.charAt(indiceAleatorio);
            idOferta.append(letraAleatoria);
        }

        for (int i = 0; i < 3; i++) {
            int numeroAleatorio = random.nextInt(10);
            idOferta.append(numeroAleatorio);
        }

        return idOferta.toString();

    }
    
}
