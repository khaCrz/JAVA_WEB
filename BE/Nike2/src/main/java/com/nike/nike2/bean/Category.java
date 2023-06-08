package com.nike.nike2.bean;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "category")
public class Category {
    @Id
    @Column(name = "category_id")
    int category_id ;

    @Column(name = "name_category")
    String name_category;

    public Category(int category_id, String name_category) {
        this.category_id = category_id;
        this.name_category = name_category;
    }


    @Override
    public String toString() {
        return "category{" +
                "category_id=" + category_id +
                ", name_category='" + name_category + '\'' +
                '}';
    }
}
