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
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #eef2ff, #f5f7ff);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        /*Contenedor del formulario*/
        .login-container{
            width: 300px;
            padding: 40px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 38px;
            color: #111;
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
            font-size: 16px;
            transition: 0.3s;
        }
        
        input[type="submit"] {
            width: 100%;
            margin-top: 20px;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: white;   
            font-size: 18px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
        }

        input[type="submit"]:hover{
            transform: translateY(-2px);
        }

        input:focus{
            outline: none;
            border-color: #2575fc

        }

        .error {
            margin-top: 20px;
            padding: 12px;
            border-radius: 10px;
            background: #f8d7da;
            color: #842029;
            text-align: center;
            font-weight: bold;
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