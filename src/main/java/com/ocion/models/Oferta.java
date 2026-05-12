package com.ocion.models;

import java.time.LocalDate;
import java.util.Arrays;

/*import java.lang.*;
import java.time.*;
import java.io.*;*/

public class Oferta {
    private int id;
    private Empresa empresa;
    private String nombre;
    private String descripcion;
    private float precio;
    private LocalDate duracionActivo;
    private int cupoOferta;
    private Cupon cupon;
    private Suscripcion suscripcion;
    private Categoria categoria;
    private int cantidad;
    private String[] opciones;

    
    public Oferta(int id, String nombre, Empresa empresa, String descripcion, float precio, int cupoOferta, Cupon cupon, 
        LocalDate duracionActivo, Suscripcion suscripcion, Categoria categoria, int cantidad, String[] opciones) {
        this.id = id;
        this.empresa = empresa;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
        this.cupoOferta = cupoOferta;
        this.cupon = cupon;
        this.duracionActivo = duracionActivo;
        this.suscripcion = suscripcion;
        this.categoria = categoria;
        this.cantidad = cantidad;
        this.opciones = opciones;
    }
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public Empresa getEmpresa() {
        return empresa;
    }
    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
    public String getNombre() {
        return nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public float getPrecio() {
        return precio;
    }
    public void setPrecio(float precio) {
        this.precio = precio;
    }
    public int getCupoOferta() {
        return cupoOferta;
    }
    public void setCupoOferta(int cupoOferta) {
        this.cupoOferta = cupoOferta;
    }
    public Cupon getCupon() {
        return cupon;
    }
    public void setCupon(Cupon cupon) {
        this.cupon = cupon;
    }

    public LocalDate getDuracionActivo() {
        return duracionActivo;
    }

    public void setDuracionActivo(LocalDate duracionActivo) {
        this.duracionActivo = duracionActivo;
    }

    public Suscripcion getSuscripcion() {
        return suscripcion;
    }

    public void setSuscripcion(Suscripcion suscripcion) {
        this.suscripcion = suscripcion;
    }
    
    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public int getCantidad()  {
        return cantidad;
    }

    public void setCantidad (int cantidad) {
        this.cantidad = cantidad;
    }

    public String[] getOpciones() {
        return opciones;
    }

    public void setOpciones(String[] opciones) {
        this.opciones = opciones;
    }
    
    public boolean ofertasActivas() {
        LocalDate hoy = LocalDate.now();
        return duracionActivo.isAfter(hoy);
    }


    @Override
    public String toString() {
        return "Oferta [id=" + id + ", empresa=" + empresa + ", nombre=" + nombre + ", descripcion=" + descripcion
                + ", precio=" + precio + ", duracionActivo=" + duracionActivo + ", cupoOferta=" + cupoOferta
                + ", cupon=" + cupon + ", suscripcion=" + suscripcion + ", categoria=" + categoria + ", cantidad="
                + cantidad + ", opciones=" + Arrays.toString(opciones) + ", getId()=" + getId() + ", getEmpresa()="
                + getEmpresa() + ", getNombre()=" + getNombre() + ", getDescripcion()=" + getDescripcion()
                + ", getPrecio()=" + getPrecio() + ", getCupoOferta()=" + getCupoOferta() + ", getCupon()=" + getCupon()
                + ", getDuracionActivo()=" + getDuracionActivo() + ", getSuscripcion()=" + getSuscripcion()
                + ", getCategoria()=" + getCategoria() + ", getCantidad()=" + getCantidad() + ", getOpciones()="
                + Arrays.toString(getOpciones()) + ", ofertasActivas()=" + ofertasActivas() + ", getClass()="
                + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
    }
    

     public double getPrecioFinal(){
        double precioFinal = this.cupon.calcularDescuento(this.precio);
        return precioFinal;
    }
    
    
  
}
