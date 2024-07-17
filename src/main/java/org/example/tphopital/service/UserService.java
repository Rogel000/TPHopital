package org.example.tphopital.service;


import org.example.tphopital.entity.User;
import org.example.tphopital.repository.UserRepository;
import org.hibernate.SessionFactory;

public class UserService {

    private final UserRepository userRepository;

    public UserService(SessionFactory sessionFactory) {
        this.userRepository = new UserRepository(sessionFactory);
    }

    public User authenticate(String username, String password) {
        User user = userRepository.findByUsername(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
}
