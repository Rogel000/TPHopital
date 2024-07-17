package org.example.tphopital.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.tphopital.entity.Patient;
import org.example.tphopital.service.PatientService;
import org.example.tphopital.util.HibernateSession;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

@WebServlet(name = "patientServlet", value = "/patient/*")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class PatientServlet extends HttpServlet {

    private PatientService patientService;

    @Override
    public void init() throws ServletException {
        patientService = new PatientService(HibernateSession.getSessionFactory());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getPathInfo() != null ? req.getPathInfo().substring(1) : "list";
        switch (action) {
            case "list":
                showAll(req, resp);
                break;
            case "addForm":
                showForm(req, resp);
                break;
            case "add":
                add(req, resp);
                break;
            case "detail":
                showDetails(req, resp);
                break;

        }
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            req.getRequestDispatcher("/WEB-INF/patients/login.jsp").forward(req, resp);

        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getPathInfo() != null ? req.getPathInfo().substring(1) : "search";
        switch (action) {
            case "search":
                search(req, resp);
                break;
            default:
                doGet(req, resp);
                break;
        }
    }


    protected void showAll(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        List<Patient> patients = patientService.getPatients(null);
        request.setAttribute("patients", patients);
        request.setAttribute("searchMode", false);
        request.getRequestDispatcher("/WEB-INF/patients/list.jsp").forward(request, response);
    }

    protected void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        Patient patientToAdd = new Patient();
        request.setAttribute("patient", patientToAdd);
        request.setAttribute("mode", "add");
        request.getRequestDispatcher("/WEB-INF/patients/patientForm.jsp").forward(request, response);
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = getServletContext().getRealPath("/") + "image";
        String name = request.getParameter("name");
        String tel = request.getParameter("tel");
        LocalDate birthDate = LocalDate.parse(request.getParameter("birthDate"));

        File file = new File(uploadPath);
        if (!file.exists()) {
            file.mkdir();
        }

        Part image = request.getPart("image");
        String fileName = image.getSubmittedFileName();

        image.write(uploadPath + File.separator + fileName);

        Patient patient = new Patient();
        patient.setName(name);
        patient.setTel(tel);
        patient.setBirthDate(birthDate);
        patient.setImage(fileName.getBytes());

        patientService.createPatient(patient.getName(), patient.getTel(), patient.getBirthDate(), patient.getImage());
        response.sendRedirect(request.getContextPath() + "/patient/list");
    }

    protected void showDetails(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String patientIdParam = request.getParameter("id");

        if (patientIdParam == null || patientIdParam.isEmpty()) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Patient ID is required");
            return;
        }

        long patientId;
        try {
            patientId = Long.parseLong(patientIdParam);
        } catch (NumberFormatException e) {

            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid Patient ID: " + patientIdParam);
            return;
        }

        Patient patient = patientService.getById(patientId);

        if (patient == null) {

            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Patient not found with ID: " + patientId);
            return;
        }


        request.setAttribute("patient", patient);
        request.setAttribute("mode", "view");
        request.getRequestDispatcher("/WEB-INF/patients/patientForm.jsp").forward(request, response);
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        List<Patient> patients = patientService.searchPatients(name);
        request.setAttribute("patients", patients);
        request.setAttribute("searchMode", true);
        request.getRequestDispatcher("/WEB-INF/patients/list.jsp").forward(request, response);
    }


}