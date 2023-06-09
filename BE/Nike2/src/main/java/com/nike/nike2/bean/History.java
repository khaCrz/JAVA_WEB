package com.nike.nike2.bean;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "history")
public class History {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "history_id")
    Integer historyId;

    @Column(name = "item_id")
    Integer itemId;

    @Column(name = "quantity")
    Integer quantity;

    @ManyToOne(optional = false, fetch = FetchType.EAGER)
    @JoinColumn(name = "item_id", referencedColumnName = "item_id", nullable = false, insertable = false, updatable = false)
    Item item;
}
