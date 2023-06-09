package com.nike.nike2.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.nike.nike2.bean.Item;

@Repository
public interface ItemRepository extends JpaRepository<Item, Integer> {
}
