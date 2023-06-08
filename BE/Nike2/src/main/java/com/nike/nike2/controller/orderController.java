package com.nike.nike2.controller;

import com.nike.nike2.bean.Item;
import com.nike.nike2.bean.order;
import com.nike.nike2.service.itemServiceImp;
import com.nike.nike2.service.orderServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/order")
public class orderController {
    @Autowired
    orderServiceImp service;

    @Autowired
    private itemServiceImp ItemService;

    @GetMapping("")
    public ResponseEntity<List<order>> findAllType() {
        return new ResponseEntity<List<order>>(service.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<order> findOrderById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<order>(service.findById(id), HttpStatus.OK);
    }

    @PostMapping("/{id}")
    public order saveOrUpdateOrder(@PathVariable(value = "id") int itemid) {
        order Order = null;
        if (service.findAll().stream().filter(o -> o.getItem().getItem_id() == itemid).count() > 0) {
            Order = service.findById(service.findAll().stream().filter(o -> o.getItem().getItem_id() == itemid).findFirst().get().getOrder_id());
            Order.setQuantity(Order.getQuantity() + 1);
        } else {
            Order = new order();
            Order.setQuantity(1);
            Order.setItem_id(itemid);
            Order.setItem(ItemService.findById(itemid).get());
        }
        System.out.println(Order);
        return new ResponseEntity<order>(service.saveOrder(Order), HttpStatus.OK).getBody();
    }

    @PutMapping("update")
    public order saveOrder(@RequestParam("id") Integer id, @RequestParam("quantity") Integer quantity) {
        order o = service.findById(id);
        o.setQuantity(quantity);
        System.out.println(id + "-" + quantity);
        return new ResponseEntity<order>(service.saveOrder(o), HttpStatus.OK).getBody();
    }
}
