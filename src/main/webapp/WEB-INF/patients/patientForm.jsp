<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="mode" type="java.lang.String" scope="request" />
<jsp:useBean id="patient" type="org.example.tphopital.entity.Patient" scope="request" />
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title><%= mode.substring(0, 1).toUpperCase() + mode.substring(1).toLowerCase() %> un Patient</title>
    <%@ include file="/WEB-INF/bootstrapimports.html" %>
    <style>
        .navbar-custom {
            background-color: #28a745;
        }
        .navbar-custom .navbar-brand,
        .navbar-custom .nav-link {
            color: white;
        }
        footer {
            background-color: #f8f9fa;
            padding: 10px 0;
            text-align: center;
        }
    </style>
</head>
<body>
<header class="navbar navbar-expand-lg navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="#">Princeton-Plainsboro</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">Accueil</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/patient/list">Liste des Patients</a>
                </li>
            </ul>
        </div>
    </div>
</header>

<main class="container">
    <div class="my-3 row">
        <div class="col-8 offset-2 p-3 rounded bg-dark text-light">
            <h1 class="fw-light"><%= mode.substring(0, 1).toUpperCase() + mode.substring(1).toLowerCase() %> un Patient</h1>
            <hr class="text-light">
            <%
                String username = (String) session.getAttribute("username");
                if ((username == null || username.isEmpty()) && !"view".equals(mode)) {
            %>
            <a href="${pageContext.request.contextPath}/patient/auth" class="btn btn-primary">
                <i class="bi bi-box-arrow-in-right"></i> Se connecter
            </a>
            <%
            } else {
            %>
            <form action="<%= mode.equals("add") ? "add" : "" %>" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="name" class="form-label">Nom:</label>
                    <input type="text" id="name" name="name" class="form-control"  <% if (!mode.equals("add") )  { %> value="<%= patient.getName() %>" readonly <% } %>>
                </div>
                <div class="mb-3">
                    <label for="tel" class="form-label">Tel:</label>
                    <input type="text" id="tel" name="tel" class="form-control"  <% if (!mode.equals("add")) { %> value="<%= patient.getTel() %>" readonly <% } %>>
                </div>
                <div class="mb-3">
                    <label for="birthDate" class="form-label">Date de Naissance:</label>
                    <input type="date" id="birthDate" name="birthDate" class="form-control"  <% if (!mode.equals("add")) { %> value="<%= patient.getBirthDate() %>" readonly <% } %>>
                </div>
                <% if (!mode.equals("add")) { %>
                <div class="mb-3">
                    <label for="image" class="form-label">Photo:</label>
                    <br>
                    <img src="${pageContext.request.contextPath}/<%= patient.getImage() %>" class="img-thumbnail" alt="Photo du patient" width="200">
                </div>
                <% } else { %>
                <div class="mb-3">
                    <label for="image" class="form-label">Photo:</label>
                    <input type="file" id="image" name="image" class="form-control">
                </div>
                <% } %>
                <% if (mode.equals("add")) { %>
                <button type="submit" class="btn btn-success"><i class="bi bi-plus-circle"></i> Ajouter Patient</button>
                <% } %>
            </form>
            <%
                }
            %>
            <div class="text-end mt-3">
                <a href="${pageContext.request.contextPath}/patient/list" class="btn btn-secondary"><i class="bi bi-arrow-counterclockwise"></i> Retour à la liste</a>
            </div>
        </div>
    </div>
</main>
<footer>
    <p>&copy; 2024 Princeton-Plainsboro. Tous droits reserves.</p>
</footer>
</body>
</html>
