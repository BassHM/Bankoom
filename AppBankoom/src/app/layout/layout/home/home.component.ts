import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { GeneralServiceService } from '../generalService/general-service.service';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  cuentas: any[] = [];
  homeInfo: any = {};
  idUser: string = '';

  constructor(private router: Router, private apiService: GeneralServiceService) { }

  ngOnInit(): void {
    this.idUser = localStorage.getItem('idUser') || '';
    if (this.idUser == '') {
      //Navigate to the raw url
      this.router.navigate(['']);
    } else {
      this.getHomeInfo();
      this.getCuentas();
    }
  }
  getHomeInfo(){
    this.apiService.getHomeInfo(this.idUser).subscribe((data: any) => {
      this.homeInfo = data;
      this.homeInfo.income = Math.round(this.homeInfo.income);
      this.homeInfo.expenses = Math.round(this.homeInfo.expenses);
    }, (error) => {
      console.log(error);
    });
  }

  getCuentas(){
    this.apiService.getCuentas(this.idUser).subscribe((data: any) => {
      this.cuentas = data;
    }, (error) => {
      console.log(error);
    });
  }
  goPlus(){
    this.router.navigate(['welcome/plus']);
  }
  goNotifications(){
    this.router.navigate(['welcome/notifications']);
  }
  goMyData(){
    this.router.navigate(['welcome/myData']);
  }

  goCuenta(cuenta: any) {
    // Redirect with cuenta as a parameter
    this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: cuenta } });
  }
}