<%@ page import="java.sql.*" %>
        
<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="com.ocion.utils.ConexionBD"  %>
        
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Oferta</title>

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
            padding: 15px;
            background: #111;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background: #333;
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
    <div class="container">

    <h1>Editar Oferta</h1>  

    <%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection conn = ConexionBD.getConnection();
    String sql = "SELECT * FROM oferta WHERE id_oferta = ?";
    PreparedStatement stmt = conn.prepareStatement(sql);
    stmt.setInt(1, id);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
    %>
    <form action="EditarOfertaServlet" method="post">
        <input type="hidden" name="id" value="<%= rs.getInt("id_oferta") %>">

        <label>Nombre:</label>
        <input type="text" name="nombre" value="<%= rs.getString("nombre") %>" required><br>

        <label>Descripción:</label>
        <textarea name="descripcion" required><%= rs.getString("descripcion") %></textarea><br>

        <label>Duración activa (días):</label>
        <input type="number" name="duracion" value="<%= rs.getInt("duracion_activa") %>" min="1" required><br>

        <label>Precio:</label>
        <input type="number" name="precio" value="<%= rs.getDouble("precio") %>" step="0.01" min="0" required><br>

        <label>Cupo disponible:</label>
        <input type="number" name="cupo" value="<%= rs.getInt("cupo_ofertas") %>" min="1" required><br>

        <label>Categoria:</label>
        <select name="categoria" required>
            <option value="">Selecciona una categoría</option>
            <option value="4" <%= rs.getInt("id_categoria") == 4 ? "selected" : "" %>>Restaurantes</option>
            <option value="5" <%= rs.getInt("id_categoria") == 5 ? "selected" : "" %>>Cine</option>
            <option value="6" <%= rs.getInt("id_categoria") == 6 ? "selected" : "" %>>Conciertos</option>
            <option value="7" <%= rs.getInt("id_categoria") == 7 ? "selected" : "" %>>Viajes</option>
            <option value="8" <%= rs.getInt("id_categoria") == 8 ? "selected" : "" %>>Deportes</option>
        </select><br>   

        <button type="submit">Guardar cambios</button>
    </form>
    
    <%
}
    rs.close();
    stmt.close();
    conn.close();
    %>
</body>
</html>
  
        
    