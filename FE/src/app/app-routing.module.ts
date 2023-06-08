import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ShowItemComponent } from './show-item/show-item.component';
import { HomeComponent } from './home/home.component';
import { OrderDetailComponent } from './order-detail/order-detail.component';
import { OrderComponent } from './order/order.component';

const routes: Routes = [
  { path: '', component: HomeComponent },
  { path: 'show/:id', component: ShowItemComponent },
  { path: 'orderDetail', component: OrderDetailComponent },
  { path: 'order', component: OrderComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
