package com.ocion.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ocion.models.Usuario;
import com.ocion.utils.ConexionBD;

public class RepositorioUsuarios {

    public static Usuario validar(String email, String password) {
        String sql = "SELECT * FROM usuario WHERE email = ? AND password = ?";

        System.out.println(">>> DAO validar()");
        System.out.println(">>> Email DAO: [" + email + "]");
        System.out.println(">>> Password DAO: [" + password + "]");

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, email.trim());
            stmt.setString(2, password.trim());

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                System.out.println(">>> Usuario encontrado en BD: " + rs.getString("email"));
                return new Usuario(
                        rs.getInt("id"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("rol")
                );
            } else {
                System.out.println(">>> No se encontró usuario en BD");
            }

        } catch (SQLException e) {
            System.out.println(">>> ERROR SQL EN DAO: " + e.getClass().getName());
            System.out.println(">>> MENSAJE: " + e.getMessage());
        }

        return null;
    }
}