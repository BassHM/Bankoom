import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { SignInUserComponent } from './sign-in-user/sign-in-user.component';
import { LayoutComponent } from './layout/layout/layout.component';
import { HomeComponent } from './layout/layout/home/home.component';
import { LayoutRoutingModule } from './layout/layout-routing.module';
import { OrganizationComponent } from './organizationCrud/organization/organization.component';
import { OrganizationDetailsComponent } from './organizationCrud/organization/organization-details/organization-details.component';
const routes: Routes = [
  {
    path: '', component: LoginComponent
  },
  {
    path: 'sign-in-user', component: SignInUserComponent
  },
  {
    path: 'welcome', component: LayoutComponent,  loadChildren: () => import('./layout/layout.module').then(m => m.LayoutModule)
  },
  {
    path: 'organization', component: OrganizationComponent
  },
  {
    path: 'organization-details/:id', component: OrganizationDetailsComponent
  },
  {
    path: 'home', component: HomeComponent
  }
 
  
];

@NgModule({
  imports: [RouterModule.forRoot(routes), RouterModule.forRoot(routes, {scrollPositionRestoration: 'top'}), LayoutRoutingModule],
  exports: [RouterModule]
})
export class AppRoutingModule { }
