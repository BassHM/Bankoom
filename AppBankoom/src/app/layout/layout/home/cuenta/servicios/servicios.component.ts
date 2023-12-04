import { Component,OnInit } from '@angular/core';
import { GeneralServiceService } from '../../../generalService/general-service.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-servicios',
  templateUrl: './servicios.component.html',
  styleUrls: ['./servicios.component.css']
})
export class ServiciosComponent implements OnInit {
  constructor(private apiService: GeneralServiceService, private route: ActivatedRoute) { }
  
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
  suscribirse(servicio: any){
    
  }
}
