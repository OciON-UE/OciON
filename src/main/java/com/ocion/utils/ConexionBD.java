package com.ocion.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {

    private static final String URL =
            "jdbc:mysql://127.0.0.1:3306/ocion_db?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    public static Connection getConnection() throws SQLException {
        try {
            DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            System.out.println(">>> Driver MySQL REGISTRADO correctamente");
        } catch (SQLException e) {
            System.out.println(">>> ERROR registrando driver MySQL: " + e.getMessage());
            throw e;
        }

        System.out.println(">>> Intentando conectar a: " + URL);
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        System.out.println(">>> Conexión OK");
        return conn;
    }
}