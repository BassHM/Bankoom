import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class LoginService {
  private apiUrl = environment.apiUrl;
  constructor(private httpClient: HttpClient) { }

  userLogin(userLogin: any) {
    return this.httpClient.post(this.apiUrl + 'User/UserLogin',userLogin);
  }
}
