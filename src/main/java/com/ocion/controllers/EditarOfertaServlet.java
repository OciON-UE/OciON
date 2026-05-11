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

        stmt.close();
        conn.close();

        response.sendRedirect("misOfertas.jsp?editado=true");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("misOfertas.jsp?error=editar");
    }
    }
}


