import { Component, OnInit } from '@angular/core';
import { GeneralServiceService } from '../../generalService/general-service.service';

@Component({
  selector: 'app-my-data',
  templateUrl: './my-data.component.html',
  styleUrls: ['./my-data.component.css']
})
export class MyDataComponent implements OnInit {
  constructor(private apiService: GeneralServiceService) { }
    myData: any = {};
    ngOnInit(): void {
        this.getMyData();
    }
    getMyData() {
        const idUser = localStorage.getItem('idUser') ?? '';
        this.apiService.getUserInfo(idUser).subscribe((data: any) => {
          this.myData = data;
        }, (error) => {
          console.log(error);
        });
    }
}
