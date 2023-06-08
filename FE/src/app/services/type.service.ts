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

export class TypeService {

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

  public getTypes() {
    const url = this.URL + '/api/v1/type';
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public getTypesById(id: number) {
    const url = this.URL + '/api/v1/type' + '/' + id;
    console.log(url);
    return this.httpClient
      .get<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public addType(emp: any) {
    const url = this.URL + '/api/v1/type';
    console.log(emp);
    return this.httpClient
      .post<any>(url, emp, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public editType(typ: any) {
    console.log(typ);
    const url = this.URL + '/api/v1/type' + '/' + typ.id;
    return this.httpClient
      .put<any>(url, typ, httpOptions)
      .pipe(catchError(this.handleError));
  }

  public deleteTypes(id: number) {
    const url = this.URL + '/api/v1/type' + '/' + id;
    return this.httpClient
      .delete<any>(url, httpOptions)
      .pipe(catchError(this.handleError));
  }
}
