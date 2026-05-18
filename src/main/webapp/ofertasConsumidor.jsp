<%@ page import="java.sql.*" %>     
<%@ page import ="com.ocion.utils.ConexionBD"  %>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ofertas disponibles</title>
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
        .precio-final {
            font-size: 22px;
            font-weight: bold;
            color: green;
        }
        .canjear a{
            display: inline-block;
            margin-top: 15px;
            padding: 10px 20px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }
        .canjear a:hover {
           transform: translateY(-2px);

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
        <a href="panelConsumidor.jsp">Panel de Consumidor</a>
        <a href="misCupones.jsp">Mis Cupones</a>
        <a href="LogoutServlet">Cerrar sesión</a>
    </div>

    <div class="container">
    
    <%
    String canjeado = (String) request.getParameter("canjeado");

    if (canjeado != null) {
    %>
        <div class="mensaje">
            Oferta canjeada correctamente
        </div>
    <%
    }
    %>

    <h1>Ofertas disponibles</h1>

        <%
            try {
                Connection conn = ConexionBD.getConnection();
                String sql = 
                "SELECT o.*, c.tipo, p.porcentaje, cf.cantidad " +
                "FROM oferta o " +
                "LEFT JOIN cupon c ON o.id_oferta = c.id_oferta " +
                "LEFT JOIN porcentaje p ON c.id_cupon = p.id_cupon " +
                "LEFT JOIN cantidad_fija cf ON c.id_cupon = cf.id_cupon" + 
                " WHERE o.cupo_ofertas > 0 AND o.duracion_activa > 0";
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
                <p>Precio original: €<%= String.format("%.2f", precio) %></p>
                <p>Tipo de cupón: <%= tipo %></p>
                <p>Descuento: <%= descuentoTexto %></p>
                <p class="precio-final">Precio final: €<%= String.format("%.2f", precioFinal) %></p>

                <p>Duración activa: <%= rs.getInt("duracion_activa") %> días</p>
                <p>Cupo disponible: <%= rs.getInt("cupo_ofertas") %></p>

                <div class="canjear">
                    <a href="CanjearCuponServlet?id=<%= rs.getInt("id_oferta") %>"
                    onclick="return confirm('¿Estás seguro de que quieres canjear este cupón?');">
                    Canjear cupón
                    </a>
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


  

