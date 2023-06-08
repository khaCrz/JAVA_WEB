package com.nike.nike2.repository;

import com.nike.nike2.bean.order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface orderRespository extends JpaRepository<order,Integer> {



    @Modifying
    @Query(value = "update order set quantity = ?2 where order_id = ?1")
    public order updateOrder(int orderid, int quantity);
}
