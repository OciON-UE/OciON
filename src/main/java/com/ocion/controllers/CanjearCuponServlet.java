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



@WebServlet("/CanjearCuponServlet")
public class CanjearCuponServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try{
        int idOferta = Integer.parseInt(request.getParameter("id"));
        Connection conn = ConexionBD.getConnection();
        
        // Marcar el cupón como canjeado
        String sqlCupon = "UPDATE cupon SET canjeado = 1 WHERE id_oferta = ? AND canjeado = 0 LIMIT 1";

        PreparedStatement stmtCupon = conn.prepareStatement(sqlCupon);

        stmtCupon.setInt(1, idOferta);
        stmtCupon.executeUpdate();
        stmtCupon.close();

        String sqlOferta = 
                "UPDATE oferta " +
                "SET cupo_ofertas = cupo_ofertas - 1 " +
                "WHERE id_oferta = ? AND cupo_ofertas > 0 AND duracion_activa > 0";

        PreparedStatement stmtOferta = conn.prepareStatement(sqlOferta);

        stmtOferta.setInt(1, idOferta);
        stmtOferta.executeUpdate();
        stmtOferta.close();

        conn.close();

        response.sendRedirect("ofertasConsumidor.jsp?canjeado=true");

    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("ofertasConsumidor.jsp?canjeado=false");
    }
    }
}
