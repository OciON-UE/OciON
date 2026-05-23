<%@ page import="java.sql.*" %>
        
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ocion.utils.ConexionBD"  %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Cupones</title>
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
    <h1>Lista de Cupones</h1>
    <table>
        <tr>
            <th>ID cupón</th>
            <th>Código</th>
            <th>Tipo</th>
            <th>Canjeado</th>
            <th>ID oferta</th>
            <th>ID consumidor</th>
            <th>Fecha creación</th>
            <th>Fecha expiración</th>
        </tr>
        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = "SELECT id_cupon, codigo, canjeado, id_oferta, usuario_id_consumidor, fechaCreacion, fechaExpiracion, tipo FROM cupon";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    int id = rs.getInt("id_cupon") ;
                    String codigo = rs.getString("codigo");
                    String tipo = rs.getString("tipo");
                    String fechaCreacion = rs.getString("fechaCreacion");
                    String fechaExpiracion = rs.getString("fechaExpiracion");
                    int canjeado = rs.getInt("canjeado");
                    int id_oferta = rs.getInt("id_oferta");
                    int id_consumidor = rs.getInt("usuario_id_consumidor");

        %>
        <tr>
            <td><%= id %></td>
            <td><%= codigo %></td> 
            <td><%= tipo %></td>                                                                                                                                                
            <td><%= canjeado %></td>
            <td><%= id_oferta %></td>
            <td><%= id_consumidor %></td>
            <td><%= fechaCreacion %></td>
            <td><%= fechaExpiracion %></td>    

        </tr>
        <%      }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
        %>

        <tr><td colspan="4">Error al cargar cupones</td></tr>
        <%  } %>
    </table>

    <a href="panelAdministrador.jsp" class="volver">Volver al Panel</a>

