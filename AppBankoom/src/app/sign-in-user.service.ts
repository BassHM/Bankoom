import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})

export class SignInUserService {
  private apiUrl = environment.apiUrl;
  constructor(private httpClient: HttpClient) { }

  getCountries() {
    return this.httpClient.get(this.apiUrl + 'Country/getCountries');
  }
  getStates(idCountry: number) {
    return this.httpClient.get(this.apiUrl + 'State/GetStates/' + idCountry);
  }
  signInUser(signInUser: any) {
    console.log(signInUser);
    return this.httpClient.post(this.apiUrl + 'User/SignInUser', signInUser);
  }
}
