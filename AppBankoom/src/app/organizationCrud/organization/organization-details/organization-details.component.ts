import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { SericeService } from '../../serice.service';

export interface OrganizationAccount {
  idOrganizationAccount: number;
  idOrganization: string;
  accountName: string;
  balance: number;
  active: number;
}

export interface InsertAccount {
  idOrganization: string;
  accountName: string;
  balance: number;
  active: number;
}

@Component({
  selector: 'app-organization-details',
  templateUrl: './organization-details.component.html',
  styleUrls: ['./organization-details.component.css']
})
export class OrganizationDetailsComponent implements OnInit {
  organizationId!: string;
  organizationAccounts: OrganizationAccount[] = [];
  newOrganizationAccount: InsertAccount = {
    idOrganization: this.organizationId,
    accountName: '',
    balance: 0,
    active: 1
  };

  constructor(
    private route: ActivatedRoute,
    private organizationAccountService: SericeService
  ) {}

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.organizationId = params.get('id') || '';
      this.newOrganizationAccount.idOrganization = this.organizationId;
      this.loadOrganizationAccounts();
    });
  }

  loadOrganizationAccounts() {
    this.organizationAccountService.getOrganizationAccounts(this.organizationId).subscribe(
      data => (this.organizationAccounts = data),
      error => console.error('Error loading organization accounts', error)
    );
  }

  deactivateOrganizationAccount(id: number, active: number) {
    this.organizationAccountService.deactivateOrganizationAccount(id, active ).subscribe(
      () => {
        this.loadOrganizationAccounts();
      },
      error => console.error('Error deactivating organization account', error)
    );
  }

  insertOrganizationAccount() {
    console.log(this.newOrganizationAccount);
    if (this.isFormValid()) {
      this.organizationAccountService.insertOrganizationAccount(this.newOrganizationAccount).subscribe(
        () => {
          this.loadOrganizationAccounts();
          this.resetForm();
        },
        error => console.error('Error inserting organization account', error)
      );
    } else {
      console.error('Form is not valid');
    }
  }

  isFormValid(): boolean {
    // You can add more validation logic if needed
    return this.newOrganizationAccount.accountName.trim() !== '' && this.newOrganizationAccount.balance >= 0;
  }

  resetForm() {
    this.newOrganizationAccount = {
      idOrganization: '',
      accountName: '',
      balance: 0,
      active: 1
    };
  }
}
