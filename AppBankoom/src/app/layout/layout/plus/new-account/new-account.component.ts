import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { GeneralServiceService } from '../../generalService/general-service.service';
import { FormControl, FormGroup, Validators} from '@angular/forms';

@Component({
  selector: 'app-new-account',
  templateUrl: './new-account.component.html',
  styleUrls: ['./new-account.component.css']
})
export class NewAccountComponent implements OnInit{
  
    constructor(private route: ActivatedRoute, private apiService: GeneralServiceService, private router: Router) { }
    typeOfAccount: string = this.route.snapshot.queryParamMap.get('idTipoDeCuenta') ?? '';
    idTipoDeCuenta: number = parseInt(this.typeOfAccount, 10) || 0;
    tipoDeCuenta: any = {};
    //Formulario con el monto inicial y el nombre de la cuenta:
    newAccountForm!: FormGroup;

    ngOnInit(): void {
      this.getTypeOfAccount();
      this.buildForm();
    }

    buildForm(): void {
      this.newAccountForm = new FormGroup({
        idUser: new FormControl(localStorage.getItem('idUser')),
        idTipoDeCuenta: new FormControl(this.idTipoDeCuenta),
        nombre: new FormControl(this.tipoDeCuenta.minimumAmount, Validators.required),
        montoInicial: new FormControl('', Validators.required)
      });
    }
    getTypeOfAccount(){
      this.apiService.getTipoDeCuenta(this.idTipoDeCuenta).subscribe((data: any) => {
        this.tipoDeCuenta = data;
      });
    }
    onSubmit(){
      console.log(this.newAccountForm.value)
      if(this.newAccountForm.valid){
        this.apiService.postNewAccount(this.newAccountForm.value).subscribe((data: any) => {
          console.log(data);
          this.router.navigate(['welcome']);
        }, (error: any) => {
          console.log(error);
          this.router.navigate(['welcome']);
        });
      }
    };
}
