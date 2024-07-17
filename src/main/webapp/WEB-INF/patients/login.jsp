<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
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
    <title>Login</title>
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
<main class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header bg-success text-white text-center">
                    <h2>Login</h2>
                </div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/auth" method="post">
                        <div class="form-group mb-3">
                            <label for="j_username">Username:</label>
                            <input type="text" id="j_username" name="j_username" class="form-control">
                        </div>
                        <div class="form-group mb-3">
                            <label for="j_password">Password:</label>
                            <input type="password" id="j_password" name="j_password" class="form-control">
                        </div>
                        <div class="text-center">
                            <input type="submit" value="Login" class="btn btn-success">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class="mt-5">
    <p>&copy; 2024 Princeton-Plainsboro. Tous droits réservés.</p>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
