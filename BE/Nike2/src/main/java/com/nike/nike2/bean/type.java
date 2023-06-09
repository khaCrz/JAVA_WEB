package com.nike.nike2.bean;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "type")
public class Type {
    @Id
    @Column(name = "type_id")
    int type_id;

    @Column(name = "type_name")
    String type_name;

    @Override
    public String toString() {
        return "type{" +
                "type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                '}';
    }
}
