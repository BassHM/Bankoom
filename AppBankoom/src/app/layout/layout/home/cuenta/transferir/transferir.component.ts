import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { trigger, state, style, animate, transition } from '@angular/animations';

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
export class TransferirComponent {
  detalleCuenta: any = {
    nombre: 'Cuenta pal mazda 3',
    cuenta: '1234567890',
    monedaIsoCode: 'USD',
    saldo: 1000
  };
  transferirForm: FormGroup = new FormGroup({
    cuentaDestino: new FormControl('', Validators.required),
    monto: new FormControl('', Validators.required),
    concepto: new FormControl('', Validators.required),
  });
  transferir() {
    if(this.transferirForm.valid) {
      if(true){

      }else{
        
      }
    }
  }
}
