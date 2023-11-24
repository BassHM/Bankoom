import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { SignInUserComponent } from './sign-in-user/sign-in-user.component';
import { LayoutComponent } from './layout/layout/layout.component';
import { HomeComponent } from './layout/layout/home/home.component';
import { LayoutRoutingModule } from './layout/layout-routing.module';
const routes: Routes = [
  {
    path: '', component: LoginComponent
  },
  {
    path: 'sign-in-user', component: SignInUserComponent
  },
  {
    path: 'welcome', component: LayoutComponent,  loadChildren: () => import('./layout/layout.module').then(m => m.LayoutModule)
  }
 
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes), RouterModule.forRoot(routes, {scrollPositionRestoration: 'top'}), LayoutRoutingModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
