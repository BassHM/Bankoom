import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-plus',
  templateUrl: './plus.component.html',
  styleUrls: ['./plus.component.css']
})
export class PlusComponent implements OnInit {
  typesOfAccounts: any[] = [];

  ngOnInit(): void {
      this.getTypesOfAccounts();
  }
  getTypesOfAccounts(){
    this.typesOfAccounts=[
      {
        monedaIsoCode: 'USD',
        cuentaTipo: 'Cuenta de Ahorros',
        balance: 1000,
        nombre: 'Cuenta pal mazda 3',
        cuenta: '1234567890'
      }
    ];
  }	

}
