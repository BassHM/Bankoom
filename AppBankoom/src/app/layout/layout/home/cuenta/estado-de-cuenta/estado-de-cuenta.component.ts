import { Component, OnInit } from '@angular/core';
import { GeneralServiceService } from '../../../generalService/general-service.service';
import { ActivatedRoute, Router } from '@angular/router';
import jsPDF from 'jspdf';
import html2canvas from 'html2canvas';
@Component({
  selector: 'app-estado-de-cuenta',
  templateUrl: './estado-de-cuenta.component.html',
  styleUrls: ['./estado-de-cuenta.component.css']
})
export class EstadoDeCuentaComponent implements OnInit {
  report: any = {};
  idUser: string = localStorage.getItem('idUser') || '';
  cuenta: string = this.route.snapshot.queryParamMap.get('cuenta') ?? '';
  constructor(private apiService: GeneralServiceService, private route: ActivatedRoute, private router: Router) { }
  ngOnInit(): void {
    
    this.getEstadoDeCuenta();
  }
  public downloadPDF(): void {
    const data: HTMLElement = document.getElementById('htmlData')!;
    console.log(data);
    const doc = new jsPDF('p', 'pt', 'a4');
    const options = {
     background: 'white',
     scale: 3,
     dpi: 300
    };
    setTimeout(() => {
      html2canvas(data, options).then((canvas) => {
        const imgData = canvas.toDataURL('image/png');
        const imgProps= doc.getImageProperties(imgData);
        const pdfWidth = doc.internal.pageSize.getWidth();
        const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
        doc.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
        doc.save('EstadoDeCuenta.pdf');
        this.router.navigate(['welcome/cuenta'], { queryParams: { cuenta: this.cuenta } });

       });
    }, 10000);

   }
   
   
  getEstadoDeCuenta() {
    const cuenta: number = parseInt(this.cuenta);
    const body = {
      idAccount: cuenta,
      idUser: this.idUser
    }
    this.apiService.getEstadoDeCuenta(body).subscribe((data: any) => {
      this.report = data;
      this.downloadPDF();
    }, (error) => {
      console.log(error);
    });
  }
}
