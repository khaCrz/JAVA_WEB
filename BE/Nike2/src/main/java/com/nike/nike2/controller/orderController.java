package com.nike.nike2.controller;

import com.nike.nike2.bean.History;
import com.nike.nike2.bean.Order;
import com.nike.nike2.bean.OrderDetail;
import com.nike.nike2.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@RestController
@CrossOrigin("*")
@RequestMapping( "/api/v1/order")
public class OrderController {
    @Autowired
    OrderServiceImp orderService;
    @Autowired
    OrderDetailServiceImp orderDetailService;

    @Autowired
    HistoryServiceImp historyService;

    @GetMapping("all")
    public ResponseEntity<List<Order>> AllOrder() {
        return new ResponseEntity<List<Order>>(orderService.findAll(), HttpStatus.OK);
    }

    @GetMapping("")
    public ResponseEntity<Order> OrderNow() {
        Optional<Order> order = orderService.findAll().stream().filter(o->o.getStatus()==0).findFirst();
        if(order.isPresent())
            return new ResponseEntity<Order>(order.get(), HttpStatus.OK);
        else{
            return new ResponseEntity<Order>(HttpStatus.OK);
        }
    }



    @PostMapping("/checkout")
    public ResponseEntity<List<History>> saveOrderFromHistory(@RequestBody List<History> hitories) {
        if(hitories.size() > 0){
            if (orderService.findAll().stream().filter(o -> o.getStatus() == 0).count() <= 0) {
                Order o = new Order();
                o.setDescription("");
                o.setMail("");
                o.setPhone("");
                o.setTimeOrder(LocalDate.now().toString());
                o.setAddressReciver("");
                o.setNameReceiver("");
                o.setStatus(0);
                o.setTotalPayment(0);
                o.setTimeDelivery("");
                o = orderService.saveOrder(o);
                System.out.println(o);
                for (History h : hitories) {
                    OrderDetail od = new OrderDetail();
                    OrderDetail.Id id = new OrderDetail.Id();
                    id.setOrderId(o.getOrderId());
                    id.setItemId(h.getItemId());
                    od.setQuantity(h.getQuantity());
                    od.setItem(h.getItem());
                    o.setTotalPayment(o.getTotalPayment() + h.getQuantity() * h.getItem().getPrice());
                    od.setOrder(o);
                    od.setId(id);
                    System.out.println(od);
                    orderDetailService.save(od);
                }
                orderService.saveOrder(o);
            } else {
                Order o = orderService.findAll().stream().filter(or -> or.getStatus() == 0).findFirst().get();
                for (History h : hitories) {
                    if (orderDetailService.findAll().stream().filter(od -> od.getId().getItemId() == h.getItemId() && od.getOrder().getOrderId() == o.getOrderId()).count() > 0) {
                        OrderDetail od = orderDetailService.findAll().stream().filter(od1 -> od1.getId().getItemId() == h.getItemId() && od1.getOrder().getOrderId() == o.getOrderId()).findFirst().get();

                        System.out.println(od.getItem() + "-" + od.getQuantity() + "--" + h.getItem() + "-" + h.getQuantity());
                        od.setQuantity(h.getQuantity() + od.getQuantity());
                        od = orderDetailService.save(od);
                        System.out.println(od.getItem() + "-" + od.getQuantity());
                    } else {
                        OrderDetail od = new OrderDetail();
                        OrderDetail.Id id = new OrderDetail.Id();
                        id.setOrderId(o.getOrderId());
                        id.setItemId(h.getItemId());
                        od.setQuantity(h.getQuantity());
                        od.setItem(h.getItem());
                        o.setTotalPayment(o.getTotalPayment() + h.getQuantity() * h.getItem().getPrice());
                        od.setOrder(o);
                        od.setId(id);
                        System.out.println(od);
                        orderDetailService.save(od);
                    }
                }
                orderService.saveOrder(o);
            }
            historyService.deleteAll(hitories);
        }
        return new ResponseEntity<List<History>>(historyService.findAll(), HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Order> findItemById(@PathVariable(value = "id") int id) {
        return new ResponseEntity<Order>(orderService.findById(id), HttpStatus.OK);
    }


    @PutMapping("update")
    public void saveOrder(@RequestBody Order o) {
        System.out.println(o);
        o.setTimeDelivery(LocalDate.now().toString());
        orderService.saveOrder(o);
    }
}
