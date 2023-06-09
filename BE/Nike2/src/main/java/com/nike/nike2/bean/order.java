package com.nike.nike2.bean;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "iorder")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    Integer orderId;
    @Column(name = "description")
    String description;
    @Column(name = "time_order")
    String timeOrder;
    @Column(name = "time_delivery")
    String timeDelivery;
    @Column(name = "total_payment")
    double totalPayment;
    @Column(name = "status")
    int status;
    @Column(name = "phone")
    String phone;
    @Column(name = "name_receiver")
    String nameReceiver;
    @Column(name = "address_reciver")
    String addressReciver;
    @Column(name = "mail")
    String mail;

    public Order(int orderId, String description, String timeOrder, String timeDelivery, double totalPayment, int status, String phone, String nameReceiver, String addressReciver, String mail) {
        this.orderId = orderId;
        this.description = description;
        this.timeOrder = timeOrder;
        this.timeDelivery = timeDelivery;
        this.totalPayment = totalPayment;
        this.status = status;
        this.phone = phone;
        this.nameReceiver = nameReceiver;
        this.addressReciver = addressReciver;
        this.mail = mail;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", description='" + description + '\'' +
                ", timeOrder='" + timeOrder + '\'' +
                ", timeDelivery='" + timeDelivery + '\'' +
                ", totalPayment=" + totalPayment +
                ", status=" + status +
                ", phone='" + phone + '\'' +
                ", nameReceiver='" + nameReceiver + '\'' +
                ", addressReciver='" + addressReciver + '\'' +
                ", mail='" + mail + '\'' +
                '}';
    }
}
