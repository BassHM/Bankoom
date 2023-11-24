import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-cuenta',
  templateUrl: './cuenta.component.html',
  styleUrls: ['./cuenta.component.css']
})
export class CuentaComponent{
  constructor(private route: ActivatedRoute, private router: Router){}
  cuenta: string = this.route.snapshot.queryParamMap.get('cuenta') ?? '';
  detallesCuenta = {
    nombreCuenta: "Cuenta de nómina",
    numeroCuenta: this.cuenta,
    balance: 100000,
    tipoCuenta: "Cuenta de ahorro",
    nombreMoneda: "Pesos mexicanos",
    isoMoneda: "MXN"
  };
  ultimosMovimientos: any[] = [
    {
      fechaMovimiento: "01/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "02/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "03/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "04/01/2020",
      concepto: "Pago de nómina",
      monto: 20000
    },
    {
      fechaMovimiento: "05/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "06/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "07/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "08/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
    {
      fechaMovimiento: "09/01/2020",
      concepto: "Pago de nómina",
      monto: 10000
    },
  ];

  navegarTransferir() {
    this.router.navigate(['welcome/cuenta/transferir'], { queryParams: { cuenta: this.cuenta } });
  }
}
