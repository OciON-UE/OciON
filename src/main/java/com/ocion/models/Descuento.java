package com.ocion.models;

import java.time.LocalDate;

public class Descuento extends Cupon {

private double porcentajeDescuento;

public Descuento (String id, boolean canjeado, LocalDate fechaCreacion, LocalDate fechaExpiracion, double porcentajeDescuento) {
    super(id, canjeado, fechaCreacion, fechaExpiracion, "descuento");
    this.porcentajeDescuento = porcentajeDescuento;
}


public double calcularDescuento(double precio) {
    double precioFinal = precio - (precio * (porcentajeDescuento / 100));
    return precioFinal;
}

}
