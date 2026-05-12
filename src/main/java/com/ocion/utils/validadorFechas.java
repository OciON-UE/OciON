package com.ocion.utils;

import java.time.LocalDate;

public class validadorFechas {

    public static boolean estaCaducado (LocalDate fechaExpiracion) {
        LocalDate fechaActual = LocalDate.now();
        if (fechaActual.isAfter(fechaExpiracion) == true) {
            System.out.println("La suscripción ha caducado.");
            return true;
        } else {
            System.out.println("La suscripción sigue activa.");
            return false;
        }
    }

}
