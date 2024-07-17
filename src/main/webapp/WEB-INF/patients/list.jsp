<%@ page import="org.example.tphopital.entity.Patient" %>
<jsp:useBean id="patients" type="java.util.ArrayList<org.example.tphopital.entity.Patient>" scope="request" />
<jsp:useBean id="patient" class="org.example.tphopital.entity.Patient" scope="request" /><!DOCTYPE html>
<!DOCTYPE html>
<html lang="fr">
<head>
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
    <title>Liste des Patients</title>
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
    <div class="row my-3">
        <div class="col-8 offset-2 rounded text-bg-dark p-3">
            <h1 class="fw-light">- Patient List -</h1>
            <hr>
            <% if (!patients.isEmpty()) { %>
            <table class="table table-dark align-middle table-striped text-center">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>tel</th>
                    <th>Birth date</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <% for (Patient p : patients) {%>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getName() %></td>
                    <td><%= p.getTel() %></td>
                    <td><%= p.getBirthDate().toString() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/patient/detail?id=<%= p.getId() %>"
                           class="btn btn-outline-info"><i class="bi bi-eye"></i> Details</a>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <%  } else { %>
            <p>There is no patient in the database yet!</p>
            <%  }  %>
            <hr>
            <div class="text-end">
                <a href="${pageContext.request.contextPath}/patient/addForm" class="btn btn-outline-success"><i
                        class="bi bi-plus-circle"></i> Add a patient</a>
            </div>
        </div>
    </div>
</main>
<footer>
    <p>&copy; 2024 Princeton-Plainsboro. Tous droits réservés.</p>
</footer>
</body>
</html>
