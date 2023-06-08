package com.nike.nike2.bean;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "iorder")
public class order {
    @Id
    @Column(name="order_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer order_id;
    @Column(name="quantity")
    int quantity;

    @Column(name="item_id")
    int item_id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="item_id", referencedColumnName = "item_id", insertable=false, updatable=false)
    Item item;

    @Override
    public String toString() {
        return "order{" +
                "order_id=" + order_id +
                ", quantity=" + quantity +
                ", item_id=" + item_id +
                '}';
    }
}