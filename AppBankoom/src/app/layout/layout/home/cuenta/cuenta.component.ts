import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { GeneralServiceService } from '../../generalService/general-service.service';

@Component({
  selector: 'app-cuenta',
  templateUrl: './cuenta.component.html',
  styleUrls: ['./cuenta.component.css']
})
export class CuentaComponent implements OnInit{
  constructor(private route: ActivatedRoute, private router: Router, private apiService: GeneralServiceService){}
  cuenta: string = this.route.snapshot.queryParamMap.get('cuenta') ?? '';
  detallesCuenta: any = {};
  ultimosMovimientos: any = [];
  ngOnInit(): void {
      this.obtenerCuenta();
      this.obtenerUltimosMovimientos();
  }
  obtenerCuenta(){
    this.apiService.getCuenta(this.cuenta).subscribe((data: any) => {
      this.detallesCuenta = data;
    }, (error) => {
      console.log(error);
    });
  }
  obtenerUltimosMovimientos(){
    this.apiService.getUltimosMovimientos(this.cuenta).subscribe((data: any) => {
      this.ultimosMovimientos = data;
    }, (error) => {
      console.log(error);
    });
  }
  navegarTransferir() {
    this.router.navigate(['welcome/cuenta/transferir'], { queryParams: { cuenta: this.cuenta } });
  }
  navegarServicios() {
    this.router.navigate(['welcome/cuenta/servicios'], { queryParams: { cuenta: this.cuenta } });
  }
}
