package com.ocion.models;

import java.time.LocalDate;

public class Administrador extends Usuario{
  
    public Administrador(int id, String email, String password) {
        super(id, email, password, "administrador");
    }


    public void modificarEmailUsuario(Usuario usuario, String nuevoEmail) {
        
        usuario.setEmail(nuevoEmail);  
    }


    public void modificarNombreConsumidor ( Consumidor consumidor, String nuevoNombre) {
        consumidor.setNombre(nuevoNombre);
    }


    public void modificarCalleConsumidor ( Consumidor consumidor, String nuevaCalle) {
        consumidor.setCalle(nuevaCalle);
    }


    public void modificarNumeroCasaConsumidor ( Consumidor consumidor, String nuevoNumeroCasa) {
        consumidor.setNumeroCasa(nuevoNumeroCasa);
    }


    public void modificarCiudadConsumidor ( Consumidor consumidor, String nuevaCiudad) {
        consumidor.setCiudad(nuevaCiudad);
    }


    public void modificarProvinciaConsumidor ( Consumidor consumidor, String nuevaProvincia) {
        consumidor.setProvincia(nuevaProvincia);
    }


    public void modificarCPConsumidor ( Consumidor consumidor, int nuevoCP) {
        consumidor.setCP(nuevoCP);
    }


    public void modificarTelefonoConsumidor ( Consumidor consumidor, int nuevoTelefono) {
        consumidor.setTelefono(nuevoTelefono);
    }


    public void modificarSuscripcionConsumidor ( Consumidor consumidor, Suscripcion nuevaSuscripcion) {
        consumidor.setSuscripcion(nuevaSuscripcion);
    }


    public void modificarNombreEmpresa ( Empresa empresa, String nuevoNombre) {
        empresa.setNombreEmpresa(nuevoNombre);
    }


    public void modificarCIFEmpresa ( Empresa empresa, String nuevoCIF) {
        empresa.setCIF(nuevoCIF);
    }


    public void modificarCalleEmpresa ( Empresa empresa, String nuevaCalle) {
        empresa.setCalle(nuevaCalle);
    }


    public void modificarCiudadEmpresa ( Empresa empresa, String nuevaCiudad) {
        empresa.setCiudad(nuevaCiudad);
    }


    public void modificarProvinciaEmpresa ( Empresa empresa, String nuevaProvincia) {
        empresa.setProvincia(nuevaProvincia);
    }


    public void modificarTelefonoEmpresa ( Empresa empresa, int nuevoTelefono) {
        empresa.setTelefono(nuevoTelefono);
    }


    public void eliminarOfertaActivaEmpresa ( Empresa empresa, int numeroOferta) {
        Oferta [] nuevoOfertasActivas = new Oferta[empresa.getOfertasActivas().length - 1];
        int j = 0;
        
        for ( int i = 0 ; i < empresa.getOfertasActivas().length; i++) {
            Oferta [] antiguasOfertasActivas = empresa.getOfertasActivas();
            if (antiguasOfertasActivas[i].getId() != numeroOferta){
                    nuevoOfertasActivas[j] = antiguasOfertasActivas[i];
                    j++;
                } else {
                System.out.println("Oferta eliminada");
                continue;
            }
        }
        empresa.setOfertasActivas(nuevoOfertasActivas);
    }


    public void modificarEmpresaOferta ( Oferta oferta, Empresa nuevaEmpresa) {
        oferta.setEmpresa(nuevaEmpresa);
    }


    public void modificarNombreOferta ( Oferta oferta, String nuevoNombre) {
        oferta.setNombre(nuevoNombre);
    }


    public void modificarDescripcionOferta ( Oferta oferta, String nuevaDescripcion) {
        oferta.setDescripcion(nuevaDescripcion);
    }


    public void modificarFechaDuracionOferta ( Oferta oferta, LocalDate nuevaFechaDuracion) {
        oferta.setDuracionActivo(nuevaFechaDuracion);
    }


    public void modificarCupoOferta ( Oferta oferta, int nuevoCupo) {
        oferta.setCupoOferta(nuevoCupo);
    }


    public void modificarCuponOferta ( Oferta oferta, Cupon nuevoCupon) {
        oferta.setCupon(nuevoCupon);
    }


    public void modificarSuscripcionOferta ( Oferta oferta, Suscripcion nuevaSuscripcion) {
        oferta.setSuscripcion(nuevaSuscripcion);
    }


    public void modificarCategoriaOferta ( Oferta oferta, Categoria nuevaCategoria) {
        oferta.setCategoria(nuevaCategoria);
    }


    public void modificarCantidadOferta ( Oferta oferta, int nuevaCantidad) {
        oferta.setCantidad(nuevaCantidad);
    }


    public void modificarOpcionesOferta ( Oferta oferta, String[] nuevasOpciones) {
        oferta.setOpciones(nuevasOpciones);
    }



}
