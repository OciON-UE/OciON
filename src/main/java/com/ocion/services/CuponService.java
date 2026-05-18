package com.ocion.services;

import com.ocion.models.Cupon;
import com.ocion.utils.ConexionBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CuponService {

    
    // Crea un nuevo cupón asociado a una oferta específica.
    public boolean validarYProcesarCupon(String codigoCupon, int idUsuario) {
        String sql = "UPDATE cupon SET canjeado = 1, id_usuario = ? WHERE codigo = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, idUsuario);
            stmt.setString(2, codigoCupon);

           return stmt.executeUpdate() > 0; // Retorna true si se actualizó un registro
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }   

    // Aplica el descuento del cupón
    public double aplicarDescuento(Cupon cupon, double precioOriginal) {
        if (cupon == null) {
            return precioOriginal; // Sin cupón, sin descuento
        }
        return cupon.aplicarDescuento(precioOriginal);
    }
}

