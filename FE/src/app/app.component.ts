import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'qlsf-app';
  constructor(private route: Router) {}

  viewCart() {
    this.route.navigateByUrl('/orderDetail');
  }

  viewHistory() {
    this.route.navigateByUrl('/order');
  }
}
