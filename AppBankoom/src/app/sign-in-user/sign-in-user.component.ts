import { Component } from '@angular/core';
import { FormGroup, FormControl, Validators } from '@angular/forms';
import { SignInUserService } from '../sign-in-user.service';
import { RouterLink } from '@angular/router';

//Interfaz para mamonear. Porque aqui pretendemos que sabemos lo que hacemos :v
interface country {
  idCountry: number;
  countryName: string;
}
interface states {
  idState: number;
  stateName: string;
  stateForCurp: string;
}
interface SignInUser {
  idUser: string;
  password: string;
  name: string;
  lastName: string;
  secondLastName: string;
  dateOfBirth: string;
  genero: string;
  curp: string;
  phoneNumber: string;
  address: string;
  postalCode: number;
  email: string;
  idState: number;
}
declare var curp: any;
@Component({
  selector: 'app-sign-in-user',
  templateUrl: './sign-in-user.component.html',
  styleUrls: ['./sign-in-user.component.css']
})


export class SignInUserComponent {
  constructor(private signInUserService: SignInUserService) { }

  minDate: Date = new Date(1900, 0, 1);//Fecha minima para el datepicker
  maxDate: Date = new Date(new Date().setFullYear(new Date().getFullYear() - 18));
  step = 3;//Paso del formulario, en total habrá 3 pasos
  countries: country[] = [];//Lista de paises
  states: states[] = [];//Lista de estados
  selectedCountry: any; //Pais seleccionado
  confirmPassword: boolean = false; //Para validar que las contraseñas coincidan
  temporalPassword: string = ''; //Para validar que las contraseñas coincidan

  //Formulario
  signInUserForm = new FormGroup<Record<keyof SignInUser, any>>({
    idUser: new FormControl('', Validators.required),
    password: new FormControl('', Validators.required),
    name: new FormControl('', Validators.required),
    lastName: new FormControl('', Validators.required),
    secondLastName: new FormControl('', Validators.required),
    dateOfBirth: new FormControl('', Validators.required),
    curp: new FormControl('', Validators.required),
    genero: new FormControl('', Validators.required),
    phoneNumber: new FormControl('', Validators.required),
    address: new FormControl('', Validators.required),
    postalCode: new FormControl('', Validators.required),
    email: new FormControl('', Validators.email),
    idState: new FormControl('', Validators.required)
  });

  ngOnInit(): void {
    //Obtenemos los paises
    this.signInUserService.getCountries().subscribe((data) => {
      this.countries = data as country[];
    }, (error) => { console.log(error); });
  }
  //Paso 0:
  setCountry(country: any) {
    this.selectedCountry = country;
  }

  getStates() {
    //Basado en el idCountry, obtenemos los estados
    this.signInUserService.getStates(this.selectedCountry.idCountry).subscribe((data) => {
      this.states = data as states[];
    }, (error) => { console.log(error); });
  }

  GenerarCurp() {
    const persona = curp.getPersona();
    const constDateOfBirth = new Date(this.signInUserForm.get('dateOfBirth')!.value as string);
    const formattedDate = `${constDateOfBirth.getDate().toString().padStart(2, '0')}-${(constDateOfBirth.getMonth() + 1).toString().padStart(2, '0')}-${constDateOfBirth.getFullYear()}`;
    persona.nombre = this.signInUserForm.get('name')!.value;
    persona.apellidoPaterno = this.signInUserForm.get('lastName')!.value;
    persona.apellidoMaterno = this.signInUserForm.get('secondLastName')!.value;
    persona.genero = this.signInUserForm.get('genero')!.value;
    persona.fechaNacimiento = formattedDate;
    //Get the stateForCurp with the idState
    persona.estado = this.states.find((state) => state.idState === this.signInUserForm.get('idState')!.value)!.stateForCurp;
    const curpGenerada = curp.generar(persona);
    this.signInUserForm.get('curp')!.setValue(curpGenerada);
  }

  validarPaso1() {
    if (this.signInUserForm.get('name')!.valid &&
      this.signInUserForm.get('lastName')!.valid &&
      this.signInUserForm.get('secondLastName')!.valid &&
      this.signInUserForm.get('dateOfBirth')!.valid &&
      this.signInUserForm.get('genero')!.valid &&
      this.signInUserForm.get('curp')!.valid) {
      return true;
    }
    return false;

  }
  validarPaso2() {
    if (this.signInUserForm.get('phoneNumber')!.valid &&
      this.signInUserForm.get('address')!.valid &&
      this.signInUserForm.get('postalCode')!.valid &&
      this.signInUserForm.get('email')!.valid) {
      return true;
    }
    return false;
  }
  validarPaso3() {
    if (this.signInUserForm.get('idUser')!.valid &&
      this.signInUserForm.get('password')!.valid && this.confirmPassword===this.signInUserForm.get('password')!.value) {
      return true;
    }
    return false;
  }


  registrarUsuario() {
    //Redireccionar a la pagina de inicio de sesion
    this.signInUserForm.value.dateOfBirth = new Date(this.signInUserForm.value.dateOfBirth).toLocaleDateString();
    if(this.signInUserForm.valid){
      console.log(this.signInUserForm.value);
        this.signInUserService.signInUser(this.signInUserForm.value).subscribe((data) => {
          window.location.href = '/';
        }, (error) => { console.log(error); });
    }
    else{
      alert("Llena todos los campos");
    }
  }
  confirmarContrasenia() {
    if(this.temporalPassword===this.signInUserForm.get('password')!.value && this.temporalPassword!=''){
      this.confirmPassword=true;
    }
    else{
      this.confirmPassword=false;
    }
  }
}