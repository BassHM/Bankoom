import { NgModule } from '@angular/core';
import { Router, RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './layout/home/home.component';
import { NotificationsComponent } from './layout/notifications/notifications.component';
import { PlusComponent } from './layout/plus/plus.component';
import { CuentaComponent } from './layout/home/cuenta/cuenta.component';
import { TransferirComponent } from './layout/home/cuenta/transferir/transferir.component';
import { MyDataComponent } from './layout/home/my-data/my-data.component';
import { NewAccountComponent } from './layout/plus/new-account/new-account.component';
import { ServiciosComponent } from './layout/home/cuenta/servicios/servicios.component';
const routes: Routes = [
  {
    path: 'home', component: HomeComponent,
  },
  {
    path: 'notifications', component: NotificationsComponent
  },
  {
    path: 'plus', component: PlusComponent,
  },
  {
    path: 'cuenta', component: CuentaComponent
  },
  {
    path: 'cuenta/transferir', component: TransferirComponent
  },
  {
    path: 'cuenta/servicios', component: ServiciosComponent
  }
  ,{
    path: 'myData', component: MyDataComponent
  },
  {
    path: 'plus/newAccount', component: NewAccountComponent
  }

];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class LayoutRoutingModule { }
