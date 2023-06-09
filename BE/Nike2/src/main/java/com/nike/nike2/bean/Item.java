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
    Integer itemId;

    @Column(name = "item_name")
    String itemName;

    @Column(name = "color")
    String color;

    @Column(name = "size")
    String size;

    @Column(name = "price")
    double price;

    @Column(name = "img_url")
    String  imageUrl;

    @Column(name = "discount_price")
    double discountPrice;

    @ManyToOne(optional=false,fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id", referencedColumnName = "category_id", nullable = false)
    Category categoryItem;

    @ManyToOne(optional=false,fetch = FetchType.EAGER)
    @JoinColumn(name = "type_id", referencedColumnName = "type_id", nullable = false)
    Type typeItem;

    public Item(Integer itemId, String itemName, String color, String size, double price, String imageUrl, double discountPrice, Category categoryItem, Type typeItem) {
        this.itemId = itemId;
        this.itemName = itemName;
        this.color = color;
        this.size = size;
        this.price = price;
        this.imageUrl = imageUrl;
        this.discountPrice = discountPrice;
        this.categoryItem = categoryItem;
        this.typeItem = typeItem;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemId=" + itemId +
                ", itemName='" + itemName + '\'' +
                ", color='" + color + '\'' +
                ", size='" + size + '\'' +
                ", price=" + price +
                ", imageUrl='" + imageUrl + '\'' +
                ", discountPrice=" + discountPrice +
                ", categoryId=" + categoryItem.getCategoryId() +
                ", typeId=" + typeItem.getType_id() +
                '}';
    }
}
