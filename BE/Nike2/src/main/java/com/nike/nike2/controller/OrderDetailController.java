package com.nike.nike2.controller;

import com.nike.nike2.bean.Order;
import com.nike.nike2.bean.OrderDetail;
import com.nike.nike2.service.OrderDetailServiceImp;
import com.nike.nike2.service.OrderServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/orderdetail")
public class OrderDetailController {
    @Autowired
    OrderDetailServiceImp service;
    @Autowired
    OrderServiceImp orderService;

    @GetMapping("/{id}")
    public ResponseEntity<List<OrderDetail>> findAllOrderDetail(@PathVariable(value = "id") Integer orderid) {
        return new ResponseEntity<List<OrderDetail>>(service.getOrderDetailsByOrderId(orderid), HttpStatus.OK);
    }

    @GetMapping("/current")
    public ResponseEntity<List<OrderDetail>> OrderDetailCurrent() {
        Optional<Order> ods =  orderService.findAll().stream().filter(o->o.getStatus()==0).findFirst();
        if(ods.isPresent()){
            return new ResponseEntity<List<OrderDetail>>(service.findAll().stream().filter(od->od.getOrder().getOrderId() == ods.get().getOrderId()).toList(), HttpStatus.OK);
        }else{
            return new ResponseEntity<List<OrderDetail>>(HttpStatus.OK);
        }

    }

    @GetMapping("/order/{id}")
    public ResponseEntity<List<OrderDetail>> getOrderDetailsByOrderId(@PathVariable(value = "id") Integer orderid) {
        return new ResponseEntity<List<OrderDetail>>(service.findAll().stream().filter(od->od.getId().getOrderId() == orderid).toList(), HttpStatus.OK);
    }


    @GetMapping("")
    public ResponseEntity<List<OrderDetail>> findAll() {
        return new ResponseEntity<List<OrderDetail>>(service.findAll(), HttpStatus.OK);
    }

    @DeleteMapping("/delete")
    public void delete(@RequestParam("idod") Integer orderId, @RequestParam("idi") Integer itemId) {
        OrderDetail orderDetail = service.findAll().stream().filter(od->od.getId().getOrderId() == orderId && od.getId().getItemId() == itemId).findFirst().get();
        System.out.println(orderDetail);
        service.delete(orderDetail);
    }
}
