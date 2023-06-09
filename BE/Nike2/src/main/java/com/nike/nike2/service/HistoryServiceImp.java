package com.nike.nike2.service;

import com.nike.nike2.bean.Category;
import com.nike.nike2.bean.History;
import com.nike.nike2.repository.HistoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HistoryServiceImp implements HistoryService{
    @Autowired
    HistoryRepository repo;
    @Override
    public List<History> findAll() {
        return repo.findAll();
    }

    @Override
    public History saveHistory(History h) {
        return repo.save(h);
    }

    @Override
    public Optional<History> findById(Integer id) {
        return repo.findById(id);
    }

    @Override
    public void deleteAll(List<History> histories) {
        repo.deleteAll(histories);
    }

    @Override
    public void delete(int id) {
        repo.deleteById(id);
    }


}
