import { Component, OnInit } from '@angular/core';
import { GeneralServiceService } from '../generalService/general-service.service';

@Component({
  selector: 'app-notifications',
  templateUrl: './notifications.component.html',
  styleUrls: ['./notifications.component.css']
})
export class NotificationsComponent implements OnInit {
  constructor(private apiService: GeneralServiceService) { }
  notificaciones: any[]=[];
  ngOnInit(): void {
    this.getNotifications();
  }
  getNotifications(){
    const idUser = localStorage.getItem('idUser') ?? '';
    this.apiService.getNotifications(idUser).subscribe((data: any) => {
      this.notificaciones = data;
    }, (error) => {
      console.log(error);
    });
    this.notificaciones= [
      {
        descripcion: 'Retiro de efectivo',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Compra en línea',
        fecha: '2021-01-01',
        monto: '-500 MXN',
      },
      {
        descripcion: 'Pago de servicios',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Retiro de efectivo',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Compra en línea',
        fecha: '2021-01-01',
        monto: '-500 MXN',
      },
      {
        descripcion: 'Pago de servicios',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Retiro de efectivo',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Compra en línea',
        fecha: '2021-01-01',
        monto: '-500 MXN',
      },
      {
        descripcion: 'Pago de servicios',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Retiro de efectivo',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Compra en línea',
        fecha: '2021-01-01',
        monto: '-500 MXN',
      },
      {
        descripcion: 'Pago de servicios',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Retiro de efectivo',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },
      {
        descripcion: 'Compra en línea',
        fecha: '2021-01-01',
        monto: '-500 MXN',
      },
      {
        descripcion: 'Pago de servicios',
        fecha: '2021-01-01',
        monto: '-$1000 USD',
      },

    ]
  }
}
