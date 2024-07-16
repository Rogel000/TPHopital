package org.example.tphopital.entity;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
public class Prescription {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Lob
    private String description;

    @ManyToOne
    @JoinColumn(name = "appointment_id")
   private  Appointment appointment;

}
