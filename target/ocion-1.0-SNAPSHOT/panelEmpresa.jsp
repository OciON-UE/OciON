<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Panel Administrador</title>

    <style>
        /*Estilos generales */
        body {
            margin:0;
            font-family: Arial, sans-serif;
            background: url("img/ocion.jpg") no-repeat center center fixed;
            background-size: contain; /* Ajusta la imagen al formulario*/
            background-color: #f5f5f5; /* Rellena si sobra espacio al ajustar la imagen*/ 
        }

        /*BARRA SUPERIOR*/
        .topbar {
            background: rgba(255,255,255,0.9);
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .logo {
            font-size: 22px;
            font-weight: bold;
        }

        .menu a {
            margin-left: 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
        }
        /*CONTENEDOR PRINCIPAL*/
        .container {
            max-width: 1000px;
            margin: 60px auto;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }
        
        /*TARJETAS*/
        .card {
            background: rgba(255,255,255, 0.9);
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            min-height: 160px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            text-decoration: none;
            color: #000;
            width: 100%;
            box-sizing: border-box;
        }
        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.3);
        }

         .card p {
            font-size: 14px;
            color: #555;
        }
      
    </style>

</head>
<body>
    <!-- BARRA SUPERIOR -->
    <div class="topbar">
        <div class="logo">OciON</div>
        <div class="menu">
            <a href="crearOferta.jsp">Crear oferta</a>
            <a href="misOfertas.jsp">Administrar ofertas</a>
            <a href="LogoutServlet">Cerrar sesión</a>
        </div>
    </div>
      <!-- PANEL Empresa -->
        <div class="container">

      <a href="crearOferta.jsp" class="card">
         <h3>Crear oferta</h3>
          <p>Añadir una nueva oferta</p>
          </a>
      
      <a href="misOfertas.jsp" class="card">
         <h3>Mis ofertas</h3>
          <p>Ver, modificar o eliminar ofertas</p>
          </a>
      
      <a href="LogoutServlet" class="card">
         <h3>Cerrar sesión</h3>
          <p>Salir del panel de empresa</p>
          </a>

    </div>
</body>
</html>