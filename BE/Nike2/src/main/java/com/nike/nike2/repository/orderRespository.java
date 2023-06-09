package com.nike.nike2.repository;

import com.nike.nike2.bean.Order;
import com.nike.nike2.bean.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderRespository extends JpaRepository<Order,Integer> {

    @Modifying
    @Query(value = "update OrderDetail set quantity = ?2 where id.orderId = ?1")
    public OrderDetail updateOrder(int orderid, int quantity);
}
