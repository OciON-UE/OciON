package com.ocion.models;

import java.time.LocalDate;

/*import java.lang.*;
import java.time.*;
import java.io.*;*/

public abstract class Cupon {
    private String id;
    private boolean canjeado;
    private LocalDate fechaCreacion;
    private LocalDate fechaExpiracion;
    private String tipo;
    
    
    public Cupon(String id, boolean canjeado, LocalDate fechaCreacion, LocalDate fechaExpiracion, String tipo) {
        this.id = id;
        this.canjeado = canjeado;
        this.fechaCreacion = fechaCreacion;
        this.fechaExpiracion = fechaExpiracion;
        this.tipo = tipo;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public boolean isCanjeado() {
        return canjeado;
    }

    public void setCanjeado(boolean canjeado) {
        this.canjeado = canjeado;
    }

    public LocalDate getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(LocalDate fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public LocalDate getFechaExpiracion() {
        return fechaExpiracion;
    }

    public void setFechaExpiracion(LocalDate fechaExpiracion) {
        this.fechaExpiracion = fechaExpiracion;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public abstract double calcularDescuento(double precio);

    public double aplicarDescuento(double precioOriginal) {
            return precioOriginal; // Sin descuento si ya fue canjeado o expiró
    }

}
