import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { trigger, state, style, animate, transition } from '@angular/animations';
import { GeneralServiceService } from '../../../generalService/general-service.service';
import { ActivatedRoute, Router } from '@angular/router';
import { MatSnackBar } from '@angular/material/snack-bar';

@Component({
  animations: [
    trigger('fadeInOut', [
      state('void', style({ opacity: 0 })),
      transition(':enter, :leave', animate(500)),
    ]),
  ],
  selector: 'app-transferir',
  templateUrl: './transferir.component.html',
  styleUrls: ['./transferir.component.css']
})
export class TransferirComponent implements OnInit{
  constructor(private route: ActivatedRoute, private apiService: GeneralServiceService, private _snackBar: MatSnackBar, private router: Router) { }

  cuenta: string = this.route.snapshot.queryParamMap.get('cuenta') ?? '';
  cuentaOrigenValue: number = parseInt(this.cuenta, 10) || 0;

  detalleCuenta: any = {};

  transferirForm: FormGroup = new FormGroup({
    cuentaOrigen: new FormControl(this.cuentaOrigenValue),
    cuentaDestino: new FormControl('', Validators.required),
    monto: new FormControl('', Validators.required),
    concepto: new FormControl('', Validators.required),
  });

  transferirButtonDisabled: boolean = false; // Agrega esta propiedad

  ngOnInit(): void {
    this.obtenerCuenta();
  }
  obtenerCuenta(){
    this.apiService.getCuenta(this.cuenta).subscribe((data: any) => {
      this.detalleCuenta = data;
    }, (error) => {
      console.log(error);
    });
  }
  transferir() {
    if(this.transferirForm.valid) {
      this.transferirButtonDisabled = true; // Desactiva el botón de transferir

      if(true){
        this.apiService.postTransferir(this.transferirForm.value).subscribe((data: any) => {
          
          this._snackBar.open(data.message, 'Continuar', {verticalPosition: 'top', duration: 3000}).afterDismissed().subscribe(() => {
            this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: this.cuenta } });
          });
        }, (error) => {
          this._snackBar.open(error.error.message, 'Cerrar', {verticalPosition: 'top', duration: 3000}).afterDismissed().subscribe(() => {
            this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: this.cuenta } });
          });
        });
      }
    }
  }
}
