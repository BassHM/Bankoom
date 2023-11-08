import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators} from '@angular/forms';

interface SignInUser {
  idUser: string;
  password: string;
  name: string;
  lastName: string;
  secondLastName: string;
  dateOfBirth: Date;
  curp: string;
  phoneNumber: number;
  address: string;
  postalCode: number;
  email: string;
  idState: number;
}

@Component({
  selector: 'app-sign-in-user',
  templateUrl: './sign-in-user.component.html',
  styleUrls: ['./sign-in-user.component.css']
})


export class SignInUserComponent {
  signInUserForm =  new FormGroup<Record<keyof SignInUser, any>>({
    idUser: new FormControl('', Validators.required),
    password: new FormControl('', Validators.required),
    name: new FormControl('', Validators.required),
    lastName: new FormControl('', Validators.required),
    secondLastName: new FormControl('', Validators.required),
    dateOfBirth: new FormControl('', Validators.required),
    curp: new FormControl('', Validators.required),
    phoneNumber: new FormControl('', Validators.required),
    address: new FormControl('', Validators.required),
    postalCode: new FormControl('', Validators.required),
    email: new FormControl('', Validators.required),
    idState: new FormControl('', Validators.required)
  });
  onSubmit() {
    throw new Error('Method not implemented.');
  }
}