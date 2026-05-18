package com.ocion.controllers;

import com.ocion.utils.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/EditarOfertaServlet")
public class EditarOfertaServlet extends HttpServlet {

    // Controlador para editar ofertas existentes y actualizar cupones asociados
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cupo = Integer.parseInt(request.getParameter("cupo"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        String tipoCupon = request.getParameter("tipoCupon");
        double valorDescuento = Double.parseDouble(request.getParameter("valor_descuento"));

        Connection conn = ConexionBD.getConnection();
        String sql = "UPDATE oferta SET nombre = ?, descripcion = ?, duracion_activa = ?, precio = ?, cupo_ofertas = ?, id_categoria = ? WHERE id_oferta = ?";

        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, nombre);
        stmt.setString(2, descripcion);
        stmt.setInt(3, duracion);
        stmt.setDouble(4, precio);
        stmt.setInt(5, cupo);
        stmt.setInt(6, categoria);
        stmt.setInt(7, id);

        stmt.executeUpdate();

        PreparedStatement stmtCupon = conn.prepareStatement("UPDATE cupon SET tipo = ? WHERE id_oferta = ?");
        stmtCupon.setString(1, tipoCupon);
        stmtCupon.setInt(2, id);
        stmtCupon.executeUpdate();
        stmtCupon.close();

        // Actualizar el valor del descuento según el tipo de cupón

        if ("DESCUENTO".equalsIgnoreCase(tipoCupon)) {
            PreparedStatement stmtDescuento = conn.prepareStatement("UPDATE porcentaje p " + 
                "JOIN cupon c ON p.id_cupon = c.id_cupon " +
                "SET p.porcentaje = ? " +
                "WHERE c.id_oferta = ?");
            stmtDescuento.setDouble(1, valorDescuento);
            stmtDescuento.setInt(2, id);
            stmtDescuento.executeUpdate();
            stmtDescuento.close();
        } else if ("CANTIDAD_FIJA".equalsIgnoreCase(tipoCupon)) {
            PreparedStatement stmtCantidad = conn.prepareStatement("UPDATE cantidad_fija cf " + 
                "JOIN cupon c ON cf.id_cupon = c.id_cupon " +
                "SET cf.cantidad = ? " +
                "WHERE c.id_oferta = ?");  
                 
            stmtCantidad.setDouble(1, valorDescuento);
            stmtCantidad.setInt(2, id);
            stmtCantidad.executeUpdate();
            stmtCantidad.close();
        }

        stmt.close();
        conn.close();

        response.sendRedirect("misOfertas.jsp?editado=true");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("misOfertas.jsp?error=editar");
    }
    }
}


