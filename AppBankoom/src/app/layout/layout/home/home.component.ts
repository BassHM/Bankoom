import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent {
  constructor(private router: Router){ }

  cuentas: any[] = [
    {
      monedaIsoCode: 'USD',
      cuentaTipo: 'Cuenta de Ahorros',
      balance: 1000,
      nombre: 'Cuenta pal mazda 3',
      cuenta: '1234567890'
    }
  ];
  imprimirCuenta(cuenta: any) {
    //Redirect with cuenta as a parameter
    this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: cuenta } });
  }
}
