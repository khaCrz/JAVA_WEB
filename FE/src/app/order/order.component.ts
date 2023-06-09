import { Component, Inject, OnInit } from '@angular/core';
import { OrderService } from '../services/order.service';
import { order } from '../models/order';
import { FormBuilder, FormGroup } from '@angular/forms';
import { DOCUMENT } from '@angular/common';
import { orderdetail } from '../models/orderdetail';
import { OrderDetailComponent } from '../order-detail/order-detail.component';

@Component({
  selector: 'app-order',
  templateUrl: './order.component.html',
  styleUrls: ['./order.component.css'],
})
export class OrderComponent implements OnInit {
  Order!: order;
  OrderDetails!: orderdetail[];
  sfForm: FormGroup;

  constructor(
    private Oservice: OrderService,
    private fb: FormBuilder,
    @Inject(DOCUMENT) document: Document
  ) {
    this.sfForm = fb.group({
      orderId: [''],
      description: [''],
      timeOrder: [''],
      timeDelivery: [''],
      totalPayment: [''],
      status: 1,
      phone: [''],
      nameReceiver: [''],
      categoryItem: [''],
      addressReciver: [''],
      mail: [''],
    });
  }
  ngOnInit(): void {
    this.Oservice.getOrders().subscribe((data) => {
      this.Order = data;
      this.sfForm.patchValue(this.Order);
      console.log(this.Order);
    });
    this.Oservice.getOrderDetailCurrent().subscribe((data) => {
      this.OrderDetails = data;
      console.log(this.OrderDetails);
    });
  }

  onSubmit() {
    let Order: order = this.sfForm.value
    Order.status = 1
    this.Oservice.editOrder(Order).subscribe(data => {
      alert("Place order successfully")
      this.ngOnInit()
    })
  }
}
