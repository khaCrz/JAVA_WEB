import { Injectable } from '@angular/core';
import {
  HttpClient,
  HttpErrorResponse,
  HttpHeaders,
} from '@angular/common/http';
import { catchError, throwError } from 'rxjs';
const httpOptions = {
  headers: new HttpHeaders({
    'Content-Type': 'application/json',
  }),
};
@Injectable({
  providedIn: 'root',
})

export class ItemService {

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
    // The backend returned an unsuccesitul response code.
    // The response body may contain clues as to what went wrong. console.error(
    //Backend returned code ${ error.status },
    return throwError('Something bad happened; please try again later.');
  }

  public getItems() {
    const url = this.URL + '/api/v1/item';
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getFilterItems(ur: string) {
    const url = this.URL + '/api/v1/item' + ur;
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getItemsById(id: string) {
    const url = this.URL + '/api/v1/item' + '/' + id;
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public addItem(emp: any) {
    const url = this.URL + '/api/v1/item';
    console.log(emp);
    return this.httpClient
      .post<any>(url, emp, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public editItem(it: any) {
    console.log(it);
    const url = this.URL + '/api/v1/item'
    return this.httpClient
      .put<any>(url, it, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public deleteItems(id: number) {
    const url = this.URL + '/api/v1/item' + '/' + id;
    return this.httpClient
      .delete<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }
}
