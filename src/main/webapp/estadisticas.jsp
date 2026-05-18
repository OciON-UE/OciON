<%@ page import="java.sql.*" %>     
<%@ page import ="com.ocion.utils.ConexionBD"  %>
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Estadísticas</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
        }
        .topbar {
            background: white;
            padding: 20px 40px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .logo {
            font-size: 26px;
            font-weight: bold;
            color: black;
            letter-spacing: 2px;
        }
        .menu{
            margin-left: auto;
            display: flex;
            gap: 50px;
        }
        .menu a {
            text-decoration: none;
            display: flex;
            gap: 30px;
        }
        .menu a:hover{
            color: #6a11cb
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
        h1 {
            margin-bottom: 30px;
        }
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }
        .card{
            background: white;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.08);
            text-align: center;
        }
        .card h2 {
            margin-bottom: 15px;
        }
        .numero {
            font-size: 24px;
            font-weight: bold;
            color: #6a11cb;
        }
        .icono {
            font-size: 40px;
            margin-bottom: 10px;
        }
         .empresas{
            border-top: 5px solid #6a11cb;
        }
        .consumidores{
            border-top: 5px solid #2575fc;
        }
        .ofertas{
            border-top: 5px solid #00b894;
        }
        .canjeados{
            border-top: 5px solid #fdcb6e;
        }
        .activos{
            border-top: 5px solid #e17055;
        }

    </style>
</head>
<body>
     <!-- BARRA SUPERIOR -->
    <div class="topbar">

        <div class="logo">OciON</div>

        <div class="menu">
            <a href="panelAdministrador.jsp">Panel de Administrador</a>
            <a href="LogoutServlet">Cerrar sesión</a>
        </div>
    </div>

    <div class="container">
    
    <h1>Estadísticas del sistema</h1>
    <div class="grid">

        <%
            try {
                Connection conn = ConexionBD.getConnection();
                Statement stmt = conn.createStatement();

                ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) AS total_empresas FROM usuario WHERE rol = 'empresa'");
                rs1.next();
                int empresas = rs1.getInt("total_empresas");

                ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) AS total_consumidores FROM usuario WHERE rol = 'consumidor'");
                rs2.next();
                int consumidores = rs2.getInt("total_consumidores");

                ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) AS total_ofertas FROM oferta");
                rs3.next();
                int ofertas = rs3.getInt("total_ofertas");

                ResultSet rs4 = stmt.executeQuery("SELECT COUNT(*) AS total_canjeos FROM cupon WHERE canjeado = 1");
                rs4.next();     
                int canjeos = rs4.getInt("total_canjeos");

                ResultSet rs5 = stmt.executeQuery("SELECT COUNT(*) AS total_canjeos_activos FROM cupon WHERE canjeado = 0");
                rs5.next();     
                int canjeosActivos = rs5.getInt("total_canjeos_activos");
        %>
            <div class="card empresas">
            <div class="icono">🏢</div>
                <h2>Empresa</h2>
                <div class="numero"><%= empresas %></div>
            </div>

            <div class="card consumidores">
            <div class="icono">👥</div>
                <h2>Consumidores</h2>
                <div class="numero"><%= consumidores %></div>
            </div>

            <div class="card ofertas">
            <div class="icono">🎟️</div>
                <h2>Ofertas</h2>
                <div class="numero"><%= ofertas %></div>
            </div>

           <div class = "card canjeados"> 
            <div class="icono">✅</div>
                <h2>Cupones canjeados</h2>
                <div class="numero"><%= canjeos%></div>
            </div>

            <div class="card activos">
            <div class="icono">⏳</div>
                <h2>Cupones activos</h2>
                <div class="numero"><%= canjeosActivos %></div>
            </div>

        <%                  
                rs1.close();
                rs2.close();
                rs3.close();
                rs4.close();
                rs5.close();
                stmt.close();
                conn.close();

            } catch (SQLException e) {
                e.printStackTrace();        
            }   
        %>
    </div>
    </div>
    </body> 
</html>


  

