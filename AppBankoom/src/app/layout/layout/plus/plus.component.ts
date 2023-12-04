import { Component, OnInit } from '@angular/core';
import { GeneralServiceService } from '../generalService/general-service.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-plus',
  templateUrl: './plus.component.html',
  styleUrls: ['./plus.component.css']
})
export class PlusComponent implements OnInit {
  constructor(private apiService: GeneralServiceService, private router: Router) { }
  typesOfAccounts: any[] = [];

  ngOnInit(): void {
      this.getTypesOfAccounts();
  }
  getTypesOfAccounts(){
    this.apiService.getTiposDeCuenta().subscribe((data: any) => {
      this.typesOfAccounts = data;
    });

  }
  addAccount(idTipoDeCuenta: number){
    this.router.navigate(['welcome/plus/newAccount'], { queryParams: { idTipoDeCuenta: idTipoDeCuenta } });
  }
}
