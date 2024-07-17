package org.example.tphopital.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDate;
import java.util.List;


@Entity
@Data
@NoArgsConstructor

public class Patient {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private  String tel;
    @Temporal(TemporalType.DATE)
    private LocalDate birthDate;
    private byte[] image;

    @OneToMany(mappedBy = "patient")
    private List<Appointment> appointments;



    public Patient(String name, String tel, LocalDate birthDate, byte[] image) {
        this.name = name;
        this.tel = tel;
        this.birthDate = birthDate;
        this.image = new byte[0];
    }
}
