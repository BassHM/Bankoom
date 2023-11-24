import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-layout',
  templateUrl: './layout.component.html',
  styleUrls: ['./layout.component.css']
})
export class LayoutComponent implements OnInit {
  constructor(private router: Router) { }

  ngOnInit() {
    this.router.navigate(['welcome/home']);
  }

  goHome(){
    this.router.navigate(['welcome/home']);
  }

  goNotifications(){
    this.router.navigate(['welcome/notifications']);
  }

  goPlus(){
    this.router.navigate(['welcome/plus']);
  }
}
