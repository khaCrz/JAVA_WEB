package com.nike.nike2.controller;

import com.nike.nike2.bean.Category;
import com.nike.nike2.service.categoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/category")
public class categoryController {

    @Autowired
    private categoryService CategoryService;

    @GetMapping("")
    public ResponseEntity<List<Category>> findAllItems() {
        return new ResponseEntity<List<Category>>(CategoryService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Category> findItemById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<Category>(CategoryService.findAll().get(id-1), HttpStatus.OK);
    }
}
