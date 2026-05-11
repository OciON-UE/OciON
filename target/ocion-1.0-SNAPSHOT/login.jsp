<%@ page language="java" 
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Iniciar sesión</title>
    <!-- CSS para la pantalla de login-->
    <style>
        /*Estilos generales */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        
        /*Contenedor del formulario*/
        .login-container{
            width: 300px;
            margin: 100px auto;
            padding: 25px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        label{
            display: block;
            margin-top: 12px;
            margin-bottom: 6px;
            font-weight: 600;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            box-sizing: border-box;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;

        }
        
        input[type="submit"] {
            width: 100%;
            margin-top: 18px;
            padding: 12px;
            border: none;
            border-radius: 6px;
            background: #2d6cdf;
        }

        input[type="submit"]:hover{
            background: #1f56b8;
        }

        .error {
            color: red;
            text-align: center;
            margin-top: 12px;
        }

    </style>

</head>
<body>

<div class="login-container">
    <h2>Iniciar sesión</h2>

    <form action="LoginServlet" method="post">
        <label for="email">Correo electrónico:</label>
        <input type="text" id="email" name="email" required>

        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required>

        <input type="submit" value="Iniciar sesión">

    </form>

    <%
        if (request.getParameter("error") != null){ %>
            <div class="error">
                <strong>Acceso denegado
                </strong><br>
                <span>Comprueba el email o la contraseña</span>  
            </div>       
    <% 
            } 
    %>


</body>
</html>