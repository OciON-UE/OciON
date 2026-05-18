<%@ page import="java.sql.*" %>
        
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Crear Oferta - OciON</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #f5f5f5, #e8e8e8);
        }
        .topbar {
            background: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        .logo {
            font-size: 24px;
            font-weight: bold;
        }
        .menu a {
            margin-left: 20px;
            text-decoration: none;
            color: #333;
            font-weight: bold;
         
        }
        .container{
            max-width: 700px;
            margin: 50px auto;
            background: white;
            padding: 35px;
            border-radius: 16px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }
        h1 {
            text-align: center;
            margin-bottom: 10px;
        }
        .subtitle {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }
        label {
            font-weight: bold;
            display: block; 
            margin-bottom: 8px;
        }
        input, textarea, select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            margin-top: 8px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
            height: 110px;
        }
        .row {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
        .row > div {
            flex: 1;
            display: flex;
            flex-direction: column;
        }
        button {
            width: 100%;
            padding: 14px;
            background-color: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
            transition: 0.3s;
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
        }
        button:hover {
            transform: translateY(-2px);
        }
        button[type="submit"] {
            background-color: #1d4ed8;
        }
         .volver {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #333;
            text-decoration: none;
            font-weight: bold;
        }

    </style>
</head>
<body>

    <div class="topbar">
        <div class="logo">OciON Empresa</div>
        <div class="menu">
            <a href="panelEmpresa.jsp">Panel de empresa</a>
            <a href="misOfertas.jsp">Mis ofertas</a>
            <a href="LogoutServlet">Cerrar sesión</a>
        </div>
    </div>

    <div class="container">
        <h1>Crear nueva oferta</h1>
        <p class="subtitle">Publica una oferta para que los usuarios puedan verla y canjearla</p>
        <form action="CrearOfertaServlet" method="post">
            <label>Nombre de la oferta</label>
            <input type="text" name="nombre" placeholder="Describe los detalles de la oferta" required>
            <label>Descripción</label>
            <textarea name="descripcion" placeholder="Describe los detalles de la oferta" required></textarea>

            <div class="row">
                <div>
                    <label>Duración activa (días)</label>
                    <input type="text" name="duracion" min="1" required placeholder="Cuántos días estará activa la oferta">
                </div>
                <div>
                    <label>Precio</label>
                    <input type="number" name="precio" placeholder="Ej: 19.99" step="0.01" min="0" required>
                </div>
            </div>

                        <div class="row">
                <div>
                    <label>Tipo de cupón</label>
                    <select name="tipo_cupon" required>
                        <option value="">Selecciona un tipo de cupón</option>
                        <option value="DESCUENTO">Descuento</option>
                        <option value="CANTIDAD_FIJA">Cantidad Fija</option>
                    </select>
                </div>
                <div>
                    <label>Valor del cupón</label>
                    <input type="number" name="valor_descuento" placeholder="Ej: 19.99" step="0.01" min="0" required>
                </div>
            </div>

            <div class="row">
                <div>
                    <label>Cupo disponible</label>
                    <input type="number" name="cupo" placeholder="Ej:100" min="1" required>
                </div>
                <div>
                    <label>Categoria</label>
                    <select name="categoria" required>
                        <option value="">Selecciona una categoría</option>
                        <option value="4">Restaurantes</option>
                        <option value="5">Cine</option>
                        <option value="6">Conciertos</option>
                        <option value="7">Viajes</option>
                        <option value="8">Deportes</option>
                    </select>
                </div>
            </div>

            <button type="submit">Publicar oferta</button>
        </form>

    <a href="panelEmpresa.jsp" class="volver">Volver al Panel</a>
    </div>  
</body>
</html>

