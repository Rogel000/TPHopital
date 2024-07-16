package org.example.tphopital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.tphopital.entity.User;

import java.io.IOException;


@WebServlet("/auth")
public class AuthenticationServlet extends HttpServlet {


    private static final User validUser = new User("admin", "password");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("j_username");
        String password = request.getParameter("j_password");

        // Vérification des informations d'identification
        if (validUser.getUsername().equals(username) && validUser.getPassword().equals(password)) {
            HttpSession session = request.getSession(true); // Crée une nouvelle session si elle n'existe pas
            session.setAttribute("username", username);
            response.sendRedirect(request.getContextPath() + "/patient/form?mode=add"); // Redirige vers la page d'ajout de patient
        } else {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=true"); // Redirige vers la page de login avec une erreur
        }
    }
}
