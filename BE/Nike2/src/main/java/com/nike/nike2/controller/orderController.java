package com.nike.nike2.controller;

import com.nike.nike2.bean.Order;
import com.nike.nike2.bean.OrderDetail;
import com.nike.nike2.service.ItemServiceImp;
import com.nike.nike2.service.OrderServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/order")
public class OrderController {
    @Autowired
    OrderServiceImp service;

    @Autowired
    private ItemServiceImp ItemService;

    @GetMapping("")
    public ResponseEntity<List<Order>> findAllType() {
        return new ResponseEntity<List<Order>>(service.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> findItemById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<Order>(service.findById(id), HttpStatus.OK);
    }

    @PostMapping("/{id}")
    public Order saveOrUpdateOrder(@PathVariable(value = "id") int itemid) {
        return null;
    }

    @PutMapping("update")
    public OrderDetail saveOrder(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
        return null;
    }
}
