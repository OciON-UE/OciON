package com.ocion.services;

import com.ocion.models.Oferta;
import com.ocion.utils.ConexionBD;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


// Gestion de la relación de las ofertas y cálculo de descuentos
// Servicio encargado de la lógica de negocio de las ofertas.
// Separa la complejidad del controlador para facilitar el mantenimiento.
 
public class OfertaService {

    // Obtiene todas las ofertas
    public List<Oferta> obtenerOfertas() {
        List<Oferta> lista = new ArrayList<>();
        String sql = "SELECT * FROM oferta";

        try (Connection conn = ConexionBD.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            // Mapea cada fila del resultado a un objeto Oferta
            while (rs.next()) {
                Oferta oferta = new Oferta(
                rs.getInt("id_oferta"),
                rs.getString("nombre"),
                null,
                rs.getString("descripcion"),
                rs.getInt("precio"),
                rs.getInt("cupo_ofertas"), 
                null,
                rs.getDate("duracion_activa").toLocalDate(),
                null,
                null,
                0,
                new String[0]
                );

                lista.add(oferta);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;  
    }
}







