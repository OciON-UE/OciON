package com.ocion.controllers;

import com.ocion.utils.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.ocion.models.Usuario;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CrearOfertaServlet")
public class CrearOfertaServlet extends HttpServlet {

    // Controlador para crear nuevas ofertas y cupones asociados
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    try{
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        int duracion = Integer.parseInt(request.getParameter("duracion"));
        double precio = Double.parseDouble(request.getParameter("precio"));
        int cupo = Integer.parseInt(request.getParameter("cupo"));
        int categoria = Integer.parseInt(request.getParameter("categoria"));
        
        // Obtener el ID de la empresa desde la sesión
        HttpSession session = request.getSession();
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        int idEmpresa = usuario.getId();

        String tipoCupon = request.getParameter("tipoCupon");
        double valorDescuento = Double.parseDouble(request.getParameter("valor_descuento"));

        Connection conn = ConexionBD.getConnection();
        String sqlOferta = "INSERT INTO oferta (nombre, descripcion, duracion_activa, precio, cupo_ofertas, id_categoria, id_empresa) VALUES (?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement stmtOferta = conn.prepareStatement(sqlOferta, PreparedStatement.RETURN_GENERATED_KEYS);

        stmtOferta.setString(1, nombre);
        stmtOferta.setString(2, descripcion);
        stmtOferta.setInt(3, duracion);
        stmtOferta.setDouble(4, precio);
        stmtOferta.setInt(5, cupo);
        stmtOferta.setInt(6, categoria);
        stmtOferta.setInt(7, idEmpresa); // Reemplaza con el ID de la empresa actual

        stmtOferta.executeUpdate();

        // Obtener el ID de la oferta recién creada
        ResultSet generatedKeys = stmtOferta.getGeneratedKeys();

        int idOferta = 0;

        if (generatedKeys.next()) {
            idOferta = generatedKeys.getInt(1);
        }

        String codigo = "CUPON" + System.currentTimeMillis();

        String sqlCupon = "INSERT INTO cupon (codigo, tipo, canjeado, id_oferta, usuario_id_consumidor) VALUES (?, ?, 0, ?, NULL)";
        PreparedStatement stmtCupon = conn.prepareStatement(sqlCupon, PreparedStatement.RETURN_GENERATED_KEYS);

        stmtCupon.setString(1, codigo);
        stmtCupon.setString(2, tipoCupon);
        stmtCupon.setInt(3, idOferta);

        stmtCupon.executeUpdate();

        // Obtener el ID del cupón recién creado
        ResultSet cuponKeys = stmtCupon.getGeneratedKeys();

        int idCupon = 0;

        if (cuponKeys.next()) {
            idCupon = cuponKeys.getInt(1);
        }   

        // Insertar en la tabla correspondiente según el tipo de cupón

        if ("DESCUENTO".equalsIgnoreCase(tipoCupon)) {
            PreparedStatement stmtPorcentaje = conn.prepareStatement("INSERT INTO porcentaje (porcentaje, id_cupon)" + "SELECT ?, id_cupon FROM cupon WHERE id_oferta = ?");
            
            stmtPorcentaje.setInt(1, idCupon);
            stmtPorcentaje.setDouble(2, valorDescuento);

            stmtPorcentaje.executeUpdate();
            stmtPorcentaje.close();

        } else if ("CANTIDAD_FIJA".equalsIgnoreCase(tipoCupon)) {

            String sqlCantidad = "INSERT INTO cantidad_fija (id_cupon, cantidad) VALUES (?, ?)";
            PreparedStatement stmtCantidad = conn.prepareStatement(sqlCantidad);
            
            stmtCantidad.setInt(1, idCupon);
            stmtCantidad.setDouble(2, valorDescuento);

            stmtCantidad.executeUpdate();
            stmtCantidad.close();
        }

        generatedKeys.close();
        cuponKeys.close();
        stmtOferta.close();
        stmtCupon.close();
        if (conn != null) {
            conn.close();
        }
        response.sendRedirect("misOfertas.jsp?editado=true");

    } catch (SQLException e) {
        e.printStackTrace();
        response.setContentType("text/html,charset=UTF-8");
        response.getWriter().println("<h2>Error al crear la oferta: " + e.getMessage() + "</h2>");
    }   
    }
}

