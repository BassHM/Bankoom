import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

export interface Organization {
  idOrganization: string;
  password: string;
  comercialName: string;
  idState: number;
}
@Injectable({
  providedIn: 'root'
})
export class GeneralServiceService {
  private apiUrl = environment.apiUrl;
  constructor(private httpClient: HttpClient) { }

  // Home
  getCuentas(idUser: string){
    return this.httpClient.get(`${this.apiUrl}Account/GetCuentas/${idUser}`);
  }
  getHomeInfo(idUser: string){
    return this.httpClient.get(`${this.apiUrl}Account/GetHomeInfo/${idUser}`);
  }
  // Usario
  getUserInfo(idUser: string){
    return this.httpClient.get(`${this.apiUrl}User/GetUserInfo/${idUser}`);
  }
  // Cuenta
  getCuenta(idAccount: string){
    return this.httpClient.get(`${this.apiUrl}Account/GetCuenta/${idAccount}`);
  }
  getUltimosMovimientos(idAccount: string){
    return this.httpClient.get(`${this.apiUrl}Account/GetUltimosMovimientos/${idAccount}`);
  }
  // Transferir
  postTransferir(params: any){
    return this.httpClient.post(`${this.apiUrl}Money/PostTransfer`, params);
  }
  // Oportunidades
  getTiposDeCuenta(){
    return this.httpClient.get(`${this.apiUrl}Account/GetTypesOfAccount`);
  }
  getTipoDeCuenta(idTipoDeCuenta: number){
    return this.httpClient.get(`${this.apiUrl}Account/GetTypeOfAccount/${idTipoDeCuenta}`);
  }
  postNewAccount(params: any){
    return this.httpClient.post(`${this.apiUrl}Account/PostNewAccount`, params);
  }
  //Servicios
  getServicios(){
    return this.httpClient.get(`${this.apiUrl}Payment/GetPeriodicPayments`);
  }
  postSuscribirse(params: any){
    return this.httpClient.post(`${this.apiUrl}Payment/SignToPeriodic`, params);
  }
  // Notificaciones
  getNotifications(idUser: string){
    return this.httpClient.get(`${this.apiUrl}User/GetNotificaciones/${idUser}`);
  }
  getEstadoDeCuenta(params: any){
    return this.httpClient.post(`${this.apiUrl}Account/EstadoDeCuenta`, params);
  }
  
}
