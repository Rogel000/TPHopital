package org.example.tphopital.repository;
import org.hibernate.Session;
import java.util.List;



public abstract class GeneralRepository<T> {
    protected Session _session;
    public GeneralRepository(Session session){
        _session = session;
    }

    public void create(T o){
        _session.save(o);
    }

    public void update(T o){
        _session.update(o);
    }

    public void delate(T o){
        _session.delete(o);
    }

    abstract T getById(long id);


    abstract List<T> findAll();



}
