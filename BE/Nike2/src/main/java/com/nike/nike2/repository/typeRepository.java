package com.nike.nike2.repository;

import com.nike.nike2.bean.type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface typeRepository extends JpaRepository<type,Integer> {
}
