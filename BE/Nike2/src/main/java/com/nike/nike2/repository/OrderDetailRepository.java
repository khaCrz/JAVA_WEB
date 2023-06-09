package com.nike.nike2.repository;

import com.nike.nike2.bean.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Integer> {

    @Modifying
    @Query(value = "SELECT od FROM OrderDetail od WHERE od.id.orderId = ?1")
    public List<OrderDetail> getOrderDetailsByOrderId(int orderId);


}
