package com.nike.nike2.repository;

import com.nike.nike2.bean.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface categoryRepository extends JpaRepository<Category, Integer> {
}
