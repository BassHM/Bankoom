import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { LayoutRoutingModule } from './layout-routing.module';
import { LayoutComponent } from './layout/layout.component';
import { HomeComponent } from './layout/home/home.component';
import { NotificationsComponent } from './layout/notifications/notifications.component';
import { PlusComponent } from './layout/plus/plus.component';

import { MatCardModule } from '@angular/material/card';
import { MatFormFieldModule } from '@angular/material/form-field';
import { FormsModule }   from '@angular/forms';
import { MatInputModule } from '@angular/material/input';
import {MatButtonModule} from '@angular/material/button';
import {MatSlideToggleModule} from '@angular/material/slide-toggle';
import { ReactiveFormsModule } from '@angular/forms';
import {MatRadioModule} from '@angular/material/radio';
import {MatDatepickerModule} from '@angular/material/datepicker';
import { MAT_DATE_LOCALE, MatNativeDateModule } from '@angular/material/core';
import { HttpClientModule } from '@angular/common/http';
import { MatSelectModule } from '@angular/material/select';
import {MatIconModule} from '@angular/material/icon';
import { CuentaComponent } from './layout/home/cuenta/cuenta.component';
import { IncomeExpenseComponent } from './layout/home/income-expense/income-expense.component';
import { TransferirComponent } from './layout/home/cuenta/transferir/transferir.component';
@NgModule({
  declarations: [
    LayoutComponent,
    HomeComponent,
    NotificationsComponent,
    PlusComponent,
    CuentaComponent,
    TransferirComponent,
  ],
  imports: [
    CommonModule,
    IncomeExpenseComponent,
    LayoutRoutingModule,
    FormsModule,
    //Para hacer peticiones
    HttpClientModule,
    //Mas materials
    MatCardModule,
    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatSlideToggleModule,
    ReactiveFormsModule,
    MatRadioModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatSelectModule,
    MatIconModule,
  ],
  providers: [{ provide: MAT_DATE_LOCALE, useValue: 'en-GB' }
],
})
export class LayoutModule { }
