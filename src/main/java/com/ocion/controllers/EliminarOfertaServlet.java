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



@WebServlet("/EliminarOfertaServlet")
public class EliminarOfertaServlet extends HttpServlet {

    // Controlador para eliminar ofertas existentes y los cupones asociados

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try{
        int id = Integer.parseInt(request.getParameter("id"));
        Connection conn = ConexionBD.getConnection();
        
        String sqlCupones = "DELETE FROM cupon WHERE id_oferta = ?";
        PreparedStatement stmtcupones = conn.prepareStatement(sqlCupones);
        stmtcupones.setInt(1, id);
        stmtcupones.executeUpdate();
        stmtcupones.close();

        String sqlOferta = "DELETE FROM oferta WHERE id_oferta = ?";
        PreparedStatement stmtOferta = conn.prepareStatement(sqlOferta);
        stmtOferta.setInt(1, id);
        stmtOferta.executeUpdate();
        stmtOferta.close();

        conn.close();

        response.sendRedirect("misOfertas.jsp");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("misOfertas.jsp?error=eliminar");
    }
    }
}


