package com.ocion.models;

import java.time.LocalDate;

public class CantidadFija extends Cupon{

    private double descCantidadFija;

    public CantidadFija (String id, boolean canjeado, LocalDate fechaCreacion, LocalDate fechaExpiracion, double descCantidadFija) {
        super(id, canjeado, fechaCreacion, fechaExpiracion, "cantidad_fija");
        this.descCantidadFija = descCantidadFija;
    }

    public double calcularDescuento (double precio){
        double precioFinal;
        precioFinal = precio - this.descCantidadFija;
        return precioFinal;
    }

}
