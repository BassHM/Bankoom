import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators, ReactiveFormsModule } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  loginForm =  new FormGroup({
    'Identificador': new FormControl('', Validators.required),
    'Contraseña': new FormControl('', Validators.required)
  });
  onSubmit() {
    throw new Error('Method not implemented.');
  }

}
