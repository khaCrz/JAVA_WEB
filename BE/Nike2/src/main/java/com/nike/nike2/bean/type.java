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
    int typeId;

    @Column(name = "type_name")
    String typeName;

    @Override
    public String toString() {
        return "type{" +
                "type_id=" + typeId +
                ", type_name='" + typeName + '\'' +
                '}';
    }
}
