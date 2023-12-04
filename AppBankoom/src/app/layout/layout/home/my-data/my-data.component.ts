import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-my-data',
  templateUrl: './my-data.component.html',
  styleUrls: ['./my-data.component.css']
})
export class MyDataComponent implements OnInit {
    myData: any = {};
    ngOnInit(): void {
        this.getMyData();
    }
    getMyData() {
        this.myData = {
          name: 'John Doe',
          email: 'john@gmail.com',
          phone: '1234567890',
          curp: 'DOEJ1234567890',
          stateOfResidence: 'Jalisco, México',
          address: 'Av. Siempre Viva 123',
        };
    }
}
