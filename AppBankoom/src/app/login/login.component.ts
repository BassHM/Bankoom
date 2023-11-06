import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {
  loginForm =  new FormGroup({
    usuario: new FormControl('', Validators.required),
    contrasenia: new FormControl('', Validators.required)
  });
  onSubmit() {
    throw new Error('Method not implemented.');
  }
  login() {
    console.log(this.loginForm);
  }

}
