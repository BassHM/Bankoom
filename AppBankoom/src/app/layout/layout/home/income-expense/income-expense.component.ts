import { Component, Input, OnChanges } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-income-expense',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './income-expense.component.html',
  styleUrls: ['./income-expense.component.css']
})
export class IncomeExpenseComponent implements OnChanges {
  @Input() income?: number;
  @Input() expense?: number;
  incomePercentege: number = 0;
  expensePercentege: number = 0;
  ngOnChanges(): void {
    this.incomePercentege = Math.round((this.income || 0) / ((this.income || 0) + (this.expense || 0)) * 100);
    this.expensePercentege = 100 - this.incomePercentege;
  }
}
