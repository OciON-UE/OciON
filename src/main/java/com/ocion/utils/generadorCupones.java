package com.ocion.utils;

import java.time.LocalDate;

import com.ocion.models.CantidadFija;
import com.ocion.models.Cupon;
import com.ocion.models.Descuento;

public class generadorCupones {


    public static Cupon generarCuponDescuento(String id, boolean canjeado, LocalDate fechaCreacion, LocalDate fechaExpiracion, double porcentaje) {
        Cupon cuponDescuento = new Descuento(id, canjeado, fechaCreacion, fechaExpiracion, porcentaje);
        return cuponDescuento;
    }

    public static Cupon generarCuponCantidadFija(String id, boolean canjeado, LocalDate fechaCreacion, LocalDate fechaExpiracion, double descCantidadFija) {
        Cupon cuponCantFija = new CantidadFija(id, canjeado, fechaCreacion, fechaExpiracion, descCantidadFija);
        return cuponCantFija;
    }

}
