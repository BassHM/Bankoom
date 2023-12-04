import { Component,OnInit } from '@angular/core';
import { GeneralServiceService } from '../../../generalService/general-service.service';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  selector: 'app-servicios',
  templateUrl: './servicios.component.html',
  styleUrls: ['./servicios.component.css']
})
export class ServiciosComponent implements OnInit {
  constructor(private apiService: GeneralServiceService, private route: ActivatedRoute, private _snackBar: MatSnackBar, private router: Router) { }
  
  cuenta: string = this.route.snapshot.queryParamMap.get('cuenta') ?? '';
  cuentaOrigenValue: number = parseInt(this.cuenta, 10) || 0;
  servicios: any = [];

  monto?: number;

  ngOnInit(): void {
    this.obtenerServicios();
  }
  obtenerServicios(){
    this.apiService.getServicios().subscribe((data: any) => {
      this.servicios = data;
    }, (error) => {
      console.log(error);
    });
  }
  suscribirse(servicio: any, monto: number){
    if(monto == 0 || monto == null){
      this._snackBar.open('Debe ingresar un monto', 'Continuar', {verticalPosition: 'top', duration: 3000});
      return;
    }else{
      const body = {
        idAccount: this.cuentaOrigenValue,
        idOrganizationAccount: servicio,
        amount: monto
      };
      console.log(body);
      this.apiService.postSuscribirse(body).subscribe((data: any) => {
        this._snackBar.open(data.message, 'Ver Cuenta', {verticalPosition: 'top', duration: 3000}).afterDismissed().subscribe(() => {
          this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: this.cuenta } });
        });
      }, (error) => {
        console.log(error);
        this._snackBar.open(error.error.message || 'Error', 'Ver Cuenta', {verticalPosition: 'top', duration: 3000}).afterDismissed().subscribe(() => {
          this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: this.cuenta } });
        });
      });
    }
  }
}
