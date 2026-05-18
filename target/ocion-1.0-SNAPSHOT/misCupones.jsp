<%@ page import="java.sql.*" %>     
<%@ page import ="com.ocion.utils.ConexionBD"  %>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Mis Cupones</title>
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
        .container {
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
        .card h2 {
            margin-bottom: 20px;
        }
        h1 {
            margin-bottom: 30px;
        }
        p {
            margin: 10px 0;
            line-height: 1.5;
        }
        .precio-final {
            font-size: 22px;
            font-weight: bold;
            color: green;
        }
        .estado {
            color: #155724;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="topbar">
        <a href="panelConsumidor.jsp">Panel de Consumidor</a>
        <a href="ofertasConsumidor.jsp">Ofertas Disponibles</a>
        <a href="LogoutServlet">Cerrar sesión</a>
    </div>

    <div class="container">
    
    <h1>Mis cupones canjeados</h1>

        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = 
                "SELECT o.*, c.id_cupon, c.codigo, c.tipo, c.canjeado, p.porcentaje, cf.cantidad " +
                "FROM cupon c " +
                "LEFT JOIN oferta o ON c.id_oferta = o.id_oferta " +
                "LEFT JOIN porcentaje p ON c.id_cupon = p.id_cupon " +
                "LEFT JOIN cantidad_fija cf ON c.id_cupon = cf.id_cupon " +
                "WHERE c.canjeado = 1";

                PreparedStatement stmt = conn.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()) {

                    double precio = rs.getDouble("precio");
                    String tipo = rs.getString("tipo");

                    double precioFinal = precio;
                    String descuentoTexto = "Sin descuento";

                    if ("DESCUENTO".equalsIgnoreCase(tipo)) {
                        double porcentaje = rs.getDouble("porcentaje");
                        precioFinal = precio * (1 - porcentaje / 100);
                        descuentoTexto = ((int) porcentaje) + "% de descuento";
                    } else if ("CANTIDAD_FIJA".equalsIgnoreCase(tipo)) {
                        double cantidad = rs.getDouble("cantidad");
                        precioFinal = Math.max(0, precio - cantidad);
                        descuentoTexto = "€" + String.format("%.2f", cantidad) + " de descuento";
                    }

        %>
            <div class="card">
                <h2><%= rs.getString("nombre") %></h2>
                <p><%= rs.getString("descripcion") %></p>
                <p>Código del cupón: <strong><%= rs.getString("codigo") %></strong></p>
                <p>Precio original: €<%= String.format("%.2f", precio) %></p>
                <p>Tipo de cupón: <%= tipo %></p>
                <p>Descuento: <%= descuentoTexto %></p>
                <p class="precio-final">Precio final: €<%= String.format("%.2f", precioFinal) %></p>
                <p class="estado">Estado: Canjeado</p>
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
</body>
</html>


  

