<%@ page import="java.sql.*" %>     
<%@ page import ="com.ocion.utils.ConexionBD"  %>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Ofertas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
        .topbar {
            background: white;
            padding: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 30px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .topbar a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }
        container {
           width: 90%;
           max-width: 900px;
           margin: 40px auto;
        }
        .card{
            background: white;
            padding: 25px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            margin-bottom: 20px;
        }
        h1 {
            margin-bottom: 30px;
        }
        .acciones {
            margin-top: 15px;
            display: flex;
            gap: 15px;
        }
        .acciones a {
            text-decoration: none;
            font-weight: bold;
            color: white;
            background: #111;
            padding: 10px 15px;
            border-radius: 8px;
        }
        .mensaje {
            background: #d4edda;
            color: #155724;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 20px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="topbar">
        <a href="panelEmpresa.jsp">Panel de Empresa</a>
        <a href="crearOferta.jsp">Crear oferta</a>
        <a href="LogoutServlet">Cerrar sesión</a>
    </div>

    <div class="container">
    
    <%
    String editado = (String) request.getParameter("editado");

    if (editado != null) {
    %>
        <div class="mensaje">
            Cambios guardados correctamente
        </div>
    <%
    }
    %>

    <h1>Mis Ofertas</h1>

        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = "SELECT * FROM oferta";
                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {
        %>
            <div class="card">
                <h2><%= rs.getString("nombre") %></h2>
                <p><%= rs.getString("descripcion") %></p>
                <p>Precio: $<%= rs.getDouble("precio") %></p>
                <p>Duración activa: <%= rs.getInt("duracion_activa") %> días</p>
                <p>Cupo disponible: <%= rs.getInt("cupo_ofertas") %></p>

                <div class="acciones">
                    <a href="editarOferta.jsp?id=<%= rs.getInt("id_oferta") %>">Editar</a>
                    <a href="EliminarOfertaServlet?id=<%= rs.getInt("id_oferta") %>" onclick="return confirm('¿Estás seguro de eliminar esta oferta?');">Eliminar</a>
                </div>
            </div>
        <%
                }
                rs.close();
                stmt.close();
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();        
            }
        %>      
    </div>

    <script>
       setTimeout(function() {
            const mensaje = document.querySelector('.mensaje');
            if (mensaje) {
                mensaje.style.display = 'none';
            }
        }, 5000);
    </script>
</body>
</html>


  

