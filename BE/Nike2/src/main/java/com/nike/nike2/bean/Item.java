package com.nike.nike2.bean;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import jakarta.persistence.*;

@Getter
@Setter
@NoArgsConstructor
@Entity
@Table(name = "item")
public class Item {
    @Id
    @Column(name = "item_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer item_id;

    @Column(name = "item_name")
    String item_name;

    @Column(name = "color")
    String color;

    @Column(name = "size")
    String size;

    @Column(name = "price")
    double price;

    @Column(name = "img_url")
    String  imageUrl;

    @Column(name = "discount_price")
    double discount_price;

    @ManyToOne(optional=false,fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", referencedColumnName = "category_id", nullable = false)
    Category category_item;

    @ManyToOne(optional=false,fetch = FetchType.EAGER)
    @JoinColumn(name = "type_id", referencedColumnName = "type_id", nullable = false)
    type type_item;


    public Item(int item_id, String item_name, String color, String size, int type, double price, String imageUrl, double discount_price, Category category_item, com.nike.nike2.bean.type type_item) {
        this.item_id = item_id;
        this.item_name = item_name;
        this.color = color;
        this.size = size;
        this.price = price;
        this.imageUrl = imageUrl;
        this.discount_price = discount_price;
        this.category_item = category_item;
        this.type_item = type_item;
    }

    @Override
    public String toString() {
        return "Item{" +
                "item_id=" + item_id +
                ", item_name='" + item_name + '\'' +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", price=" + price +
                ", imageUrl='" + imageUrl + '\'' +
                ", discount_price=" + discount_price +
                ", category_item=" + category_item +
                ", type_item=" + type_item +
                '}';
    }
}
