<%@ page import="java.sql.*" %>
        
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ocion.utils.ConexionBD"  %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ofertas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 40px;
        }
        h1 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        th{
           background: #333;
              color: white; 
              padding: 15px;
            
        }
        td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
        .volver {
            display: block;
            width: 120px;
            margin: 30px auto;
            padding: 10px;
            text-align: center;
            background: black;
            color: white;
            text-decoration: none;
            border-radius: 8px;
        }
    </style>
</head>
<body>
    <h1>Lista de Ofertas</h1>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Descripción</th>
            <th>Duración_activa</th>
            <th>Precio</th>
            <th>Cupo_ofertas</th>
            <th>Empresa_id</th>
            <th>Administrador_id</th>
            <th>Categoria_id</th>

        </tr>
        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = "SELECT * FROM oferta";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    int id = rs.getInt("id_oferta") ;
                    String nombre = rs.getString("nombre");
                    String descripcion = rs.getString("descripcion");
                    String duracion_activa = rs.getString("duracion_activa");
                    double precio = rs.getDouble("precio");
                    int cupo_ofertas = rs.getInt("cupo_ofertas");
                    int empresa_id = rs.getInt("id_empresa");
                    int administrador_id = rs.getInt("id_administrador");
                    int categoria_id = rs.getInt("id_categoria");

        %>
        <tr>
            <td><%= id %></td>
            <td><%= nombre %></td>
            <td><%= descripcion %></td>
            <td><%= duracion_activa %></td>
            <td><%= precio %></td>
            <td><%= cupo_ofertas %></td>
            <td><%= empresa_id %></td>
            <td><%= administrador_id %></td>
            <td><%= categoria_id %></td>

        </tr>
        <%      }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
        %>

        <tr><td colspan="4">Error al cargar usuarios</td></tr>
        <%  } %>
    </table>

    <a href="panelAdministrador.jsp" class="volver">Volver al Panel</a>

