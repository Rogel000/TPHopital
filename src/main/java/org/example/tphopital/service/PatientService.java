package org.example.tphopital.service;

import org.example.tphopital.entity.Patient;
import org.example.tphopital.repository.PatientRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.time.LocalDate;
import java.util.List;


public class PatientService {
    private PatientRepository patientRepository;
    private SessionFactory _sessionFactory;
    private Session session;

    public PatientService(SessionFactory sessionFactory) {_sessionFactory = sessionFactory;}

    public boolean createPatient(String name, String tel, LocalDate birthDate, String image) {
        boolean result = false;
        session = _sessionFactory.openSession();
        session.beginTransaction();
        patientRepository = new PatientRepository(session);
        Patient patient = new Patient(name, tel, birthDate, image);
        try {
            patientRepository.create(patient);
            session.getTransaction().commit();
            result = true;
        } catch (Exception except) {
            try {
                session.getTransaction().rollback();
            }catch (Exception e) {
                System.out.println("Error: " + e.getMessage());
            }
        } finally {
            session.close();
        }
        return result;
    }

    public Patient getById(long id) {
        Patient patient = null;
        session = _sessionFactory.openSession();
        patientRepository = new PatientRepository(session);
        try {
            patient = patientRepository.getById(id);
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            session.close();
        }
        return patient;
    }

    public List<Patient> getPatients(String name){
        List<Patient> patients = null;
        session = _sessionFactory.openSession();
        patientRepository = new PatientRepository(session);
        try{
            if(name == null){
                patients = patientRepository.findAll();
            }else{
                patients = patientRepository.findAllByName(name);
            }
        }catch (Exception e){

        }finally {
            session.close();
        }
        return patients;
    }

    public List<Patient> searchPatients(String name) {
        List<Patient> patients = null;
        try (Session session = _sessionFactory.openSession()) {
            patientRepository = new PatientRepository(session);
            patients = patientRepository.findAllByName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return patients;
    }




}
