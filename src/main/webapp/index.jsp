<%@ page import="org.example.tphopital.entity.Patient" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Bienvenue à l'hôpital Princeton-Plainsboro</title>

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


<main class="container mt-4">
    <h2>A propos de nous</h2>
    <p>
        Bienvenue à l'hôpital Princeton-Plainsboro, où nous nous engageons à fournir les meilleurs soins de santé. Notre équipe de professionnels de la santé est dédiée à votre bien-être.
    </p>

    <form method="post" action="${pageContext.request.contextPath}/patient/search">
        <div class="mb-3">
            <label for="name" class="form-label">Rechercher par Nom:</label>
            <input type="text" id="name" name="name" class="form-control">
        </div>
        <button type="submit" class="btn btn-primary"><i class="bi bi-search"></i> Rechercher</button>
    </form>


</main>




<footer>
    <p>&copy; 2024 Princeton-Plainsboro. Tous droits réservés.</p>
</footer>


</body>
</html>
