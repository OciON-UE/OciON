package com.ocion.controllers;

import com.ocion.dao.RepositorioUsuarios;
import com.ocion.models.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email != null) email = email.trim();
        if (password != null) password = password.trim();

        
        System.out.println(">>> LoginServlet recibido POST");

        Usuario usuario = RepositorioUsuarios.validar(email, password);

        System.out.println(">>> Usuario encontrado: " + usuario);

        if (usuario != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", usuario);

            if (usuario.getRol().equalsIgnoreCase("interno")) {
                response.sendRedirect("panelGestion.jsp");
            } else if (usuario.getRol().equalsIgnoreCase("empresa")) {
                response.sendRedirect("panelEmpresa.jsp");
            } else if (usuario.getRol().equalsIgnoreCase("consumidor")) {
                response.sendRedirect("panelConsumidor.jsp");
            } else {
                response.sendRedirect("login.jsp?error=rol");
            }
        } else {
            response.sendRedirect("login.jsp?error=1");
        }
    }
}