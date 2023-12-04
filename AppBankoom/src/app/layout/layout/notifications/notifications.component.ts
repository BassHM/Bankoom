import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-notifications',
  templateUrl: './notifications.component.html',
  styleUrls: ['./notifications.component.css']
})
export class NotificationsComponent implements OnInit {
  notificaciones: any[]=[];
  ngOnInit(): void {
    this.getNotifications();
  }
  getNotifications(){
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
