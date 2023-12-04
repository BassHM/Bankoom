import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment.development';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
export interface Organization {
  idOrganization: string;
  password: string;
  comercialName: string;
  idState: number;
}
export interface InsertAccount {
  idOrganization: string;
  accountName: string;
  balance: number;
  active: number;
}
export interface OrganizationAccount {
  idOrganizationAccount: number;
  idOrganization: string;
  accountName: string;
  balance: number;
  active: number; // Assuming 'Active' property from the API maps to a boolean in TypeScript
}
export interface State {
  idState: number;
  stateName: string;
  // Add any other properties if present in your actual state model
}
@Injectable({
  providedIn: 'root'
})
export class SericeService {
  private apiUrl = environment.apiUrl;
  constructor(private httpClient: HttpClient) { }

  getOrganizations(): Observable<Organization[]> {
    return this.httpClient.get<Organization[]>(`${this.apiUrl}Organization/GetOrganizations`);
  }

  insertOrganization(organization: Organization): Observable<any> {
    return this.httpClient.post(`${this.apiUrl}Organization/InsertOrganization`, organization);
  }
  getOrganizationAccounts(idOrganization: string): Observable<OrganizationAccount[]> {
    return this.httpClient.get<OrganizationAccount[]>(`${this.apiUrl}Organization/GetOrganizationAccounts/${idOrganization}`);
  }

  insertOrganizationAccount(account: InsertAccount): Observable<any> {
    return this.httpClient.post(`${this.apiUrl}Organization/InsertOrganizationAccount`, account);
  }

  deactivateOrganizationAccount(id: number,active: number): Observable<any> {
    return this.httpClient.put(`${this.apiUrl}Organization/DeactivateOrganizationAccount/${id}/${active}`, {});
  }
  getStates(idCountry: number): Observable<State[]> {
    return this.httpClient.get<State[]>(`${this.apiUrl}State/GetStates/${idCountry}`);
  }
}
