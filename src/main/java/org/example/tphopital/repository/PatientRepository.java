package org.example.tphopital.repository;

import org.example.tphopital.entity.Patient;
import org.hibernate.Session;
import org.hibernate.query.Query;

import javax.swing.event.ListDataEvent;
import java.util.List;

public class PatientRepository extends GeneralRepository<Patient> {

    public PatientRepository(Session session) {
        super(session);
    }

    @Override
    public Patient getById(long id) {
        return (Patient) _session.get(Patient.class, id);
    }

    public List<Patient> findAllByName(String name) {
        Query<Patient> query = _session.createQuery("from Patient p where p.name like :name", Patient.class);
        query.setParameter("name", "%" + name + "%");
        List<Patient> patients=  query.list();
        return patients;
    }


    @Override
    public List<Patient> findAll() {
        return _session.createQuery("from Patient ").list();
    }
}
