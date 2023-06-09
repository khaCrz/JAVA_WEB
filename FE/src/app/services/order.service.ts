import { Injectable } from '@angular/core';
import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from '@angular/common/http';

import { history } from '../models/history';
import { catchError, throwError } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Order': 'application/json',
  }),
};
@Injectable({
  providedIn: 'root',
})
export class OrderService {
  private URL = 'http://localhost:8080';
  constructor(private httpClient: HttpClient) { }

  private handleError(error: HttpErrorResponse) {
    if (error.error instanceof ErrorEvent) {
      // A client-side or network error occurred. Handle it accordingly.
      console.error('An error occurred: ', error.error.message);
    } else {
      console.error(
        `Backend returned code ${error.status} , ` + `body was: ${error.error} `
      );
    }
    // The backend returned an unsuccestypul response code.
    // The response body may contain clues as to what went wrong. console.error(
    //Backend returned code ${ error.status },
    return throwError('Something bad happened; please try again later.');
  }

  public getOrders() {
    const url = this.URL + '/api/v1/order';
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getOrderDetailCurrent() {
    const url = this.URL + '/api/v1/orderdetail/current';
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getOrdersById(id: number) {
    const url = this.URL + '/api/v1/order' + '/' + id;
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public addOrder(emp: any) {
    const url = this.URL + '/api/v1/order' + '/' + emp;
    console.log(emp);
    return this.httpClient
      .post<any>(url, emp, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public editOrder(typ: any) {
    console.log(typ);
    const url = this.URL + '/api/v1/order/update'
    return this.httpClient
      .put<any>(url, typ, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public deleteHistory(id: number) {
    const url = this.URL + '/api/v1/history' + '/' + id;
    console.log(url);
    return this.httpClient
      .delete<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public deleteOrderDetail(u: any) {
    const url = this.URL + '/api/v1/orderdetail/delete' + u
    console.log(url);
    return this.httpClient
      .delete<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public checkout(his: history[]) {
    const url = this.URL + '/api/v1/order' + '/checkout';
    console.log(his);
    return this.httpClient
      .post<any>(url, his, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public addHistory(emp: number) {
    const url = this.URL + '/api/v1/history' + '/' + emp;
    console.log(emp);
    return this.httpClient
      .post<any>(url, emp, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getOrderDetailByOrderId(id: number) {
    const url = this.URL + '/api/v1/orderdetail/order' + '/' + id;
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }
}
