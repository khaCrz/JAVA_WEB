package com.nike.nike2.bean;

import lombok.*;

import jakarta.persistence.*;

import java.io.Serializable;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "order_detail")
public class OrderDetail {
    @EmbeddedId
    Id id;

    @Column(name="quantity")
    int quantity;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("itemId")
    @JoinColumn(name="item_id", referencedColumnName = "item_id", insertable=false, updatable=false)
    Item item;

    @ManyToOne(fetch = FetchType.EAGER)
    @MapsId("orderId")
    @JoinColumn(name="order_id", referencedColumnName = "order_id", insertable=false, updatable=false)
    Order order;
    @Getter
    @Setter
    @ToString
    @Embeddable
    public static class Id implements Serializable {
        @Column(name="order_id")
        Integer orderId;

        @Column(name="item_id")
        int itemId;

        public Id() {
        }
        public Id(Integer orderId, int itemId) {
            this.orderId = orderId;
            this.itemId = itemId;
        }
    }

    public OrderDetail(Id id, int quantity, Item item, Order order) {
        this.id = id;
        this.quantity = quantity;
        this.item = item;
        this.order = order;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", quantity=" + quantity +
                ", item=" + item +
                ", order=" + order +
                '}';
    }
}