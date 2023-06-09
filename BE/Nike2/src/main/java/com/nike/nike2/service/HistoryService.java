package com.nike.nike2.service;

import com.nike.nike2.bean.History;
import com.nike.nike2.bean.Item;
import com.nike.nike2.bean.Order;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


public interface HistoryService {
    public List<History> findAll();

    public History saveHistory(History h);
    Optional<History> findById(Integer id);
    public void deleteAll(List<History> histories);

    public void delete(int id);

}
