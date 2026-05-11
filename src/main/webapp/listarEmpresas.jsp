<%@ page import="java.sql.*" %>
        
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ocion.utils.ConexionBD"  %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Empresas</title>
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
    <h1>Lista de Empresas</h1>
    <table>
        <tr>
            <th>ID usuario</th>
            <th>Nombre empresa</th>
            <th>CIF</th>
            <th>Teléfono</th>
            <th>Ciudad</th>
            <th>Provincia</th>
        </tr>
        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = "SELECT * FROM empresa";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
                    int id = rs.getInt("usuario_id") ;
                    String nombreEmpresa = rs.getString("nombre_empresa");
                    String CIF = rs.getString("CIF");
                    String telefono = rs.getString("telefono");
                    String ciudad = rs.getString("ciudad");
                    String provincia = rs.getString("provincia");
        %>
        <tr>
            <td><%= id %></td>
            <td><%= nombreEmpresa %></td>
            <td><%= CIF %></td>
            <td><%= telefono %></td>
            <td><%= ciudad %></td>
            <td><%= provincia %></td>
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

