import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { LoginService } from '../login.service';
import { Router } from '@angular/router';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})

export class LoginComponent {
  constructor(private loginService: LoginService, private router: Router) { }
  loginForm = new FormGroup({
    idUser: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required, Validators.minLength(6)])
  });

  login(): void {
    this.loginService.userLogin(this.loginForm.value).subscribe((data: any) => {
      // Guardar el id del usuario en el local storage
      localStorage.setItem('idUser', data[0]);
      // Redirigir al usuario al dashboard
      this.router.navigate(['/welcome']);
    }, (error) => { 
      console.log(error); 
      this.loginForm.valid != false;
    });
  }
  
}