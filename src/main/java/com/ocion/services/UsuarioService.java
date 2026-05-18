package com.ocion.services;

import com.ocion.utils.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UsuarioService {

    // Cuenta usuarios por rol: administradores, empresas, consumidores
    public int contarUsuariosPorRol(String rol) {

        int total = 0;

        String sql = "SELECT COUNT(*) AS total FROM usuario WHERE rol = ?";
        
        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, rol);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                total = rs.getInt("total");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total; // Retorna 0 si ocurre un error o no hay usuarios
    }
    
    // Comrueba si existe un usuario con ese email
    public boolean existeUsuario(String email) {

        boolean existe = false;

        String sql = "SELECT COUNT(*) AS total FROM usuario WHERE email = ?";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                existe = rs.getInt("total") > 0;
            }

            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existe; // Retorna false si ocurre un error o no existe el usuario
    }
}

