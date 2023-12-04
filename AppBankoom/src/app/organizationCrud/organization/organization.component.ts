import { Component, OnInit } from '@angular/core';
import { GeneralServiceService } from 'src/app/layout/layout/generalService/general-service.service';
import { SericeService } from '../serice.service';
export interface Organization {
  idOrganization: string;
  password: string;
  comercialName: string;
  idState: number;
}
export interface State {
  idState: number;
  stateName: string;
  // Add any other properties if present in your actual state model
}
@Component({
  selector: 'app-organization',
  templateUrl: './organization.component.html',
  styleUrls: ['./organization.component.css']
})
export class OrganizationComponent implements OnInit{
  organizations: Organization[] = [];
  newOrganization: Organization = { idOrganization: '', password: '', comercialName: '', idState: 1 };
  states: State[] = [];
  constructor(private apiService: SericeService) { }

  ngOnInit(): void {
    this.loadOrganizations();
    this.loadStates();

  }
  loadStates() {
    // Fetch the states and assign them to the 'states' variable
    this.apiService.getStates(1).subscribe(
      data => (this.states = data),
      error => console.error('Error loading states', error)
    );
  }

  loadOrganizations() {
    this.apiService.getOrganizations().subscribe(
      data => {this.organizations = data; console.log(data);},
      error => console.error('Error loading organizations', error)
    );
  }

  insertOrganization() {
    console.log(this.newOrganization);
    this.apiService.insertOrganization(this.newOrganization).subscribe(
      () => {
        this.loadOrganizations();
        // Reset the form after successful insertion
        this.newOrganization = { idOrganization: '', password: '', comercialName: '', idState: 0 };
      },
      error => console.error('Error inserting organization', error)
    );
  }
}
