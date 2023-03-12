import 'dart:convert';
import 'dart:io';
import 'package:tandiza/datalayer/models/tandiza_client_extended_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_model.dart';
import 'package:http/http.dart' as http;
import 'package:tandiza/datalayer/models/tandiza_loan_statement_model.dart';

import '../models/tandiza_address_model.dart';
import '../models/tandiza_client_created_model.dart';
import '../models/tandiza_contacts_model.dart';


class LoanManagementApi {
  Future<TandizaClientModel?> getUserByNrc (String id) async {
    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/client?nrcnumber=$id';
      final response = await http.get(Uri.parse(url), headers: {
        'Accept' : 'application/json',
        'Content-Type' : 'application/json',
        'Authorisation' : 'Tandiza210Rocks1964',
        'Tenant' : 'TDZ'
      });

      if(response.statusCode == 200){
        return TandizaClientModel.fromJson(jsonDecode(response.body));
      }else{
        throw Exception('Failed to get data');
      }
  }

  Future<TandizaClientFinancialsModel> getClientFinancialsById(int ? client_id) async {
    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/client-financials?client_id=$client_id';
    final response = await http.get(Uri.parse(url), headers: {
      'Accept' : 'application/json',
      'Content-Type' : 'application/json',
      'Authorisation' : 'Tandiza210Rocks1964',
      'Tenant' : 'TDZ'
    });

    if(response.statusCode == 200){
      return TandizaClientFinancialsModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to get data');
    }
  }

  Future<TandizaLoanStatementModel> getLoanStatement(int ? loanId) async {
    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/loan-statement?loan_id=$loanId';
    final response = await http.get(Uri.parse(url), headers: {
      'Accept' : 'application/json',
      'Content-Type' : 'application/json',
      'Authorisation' : 'Tandiza210Rocks1964',
      'Tenant' : 'TDZ'
    });

    if(response.statusCode == 200){
      return TandizaLoanStatementModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to get data');
    }
  }

  Future<TandizaClientCreatedModel?> createTandizaClient({
    required String nrcnumber, required String firstName, required String phoneNumber,
    required String surname, required String dateOfBirth, required String supervisorName,
    required String title, required String gender, required String addressType,
    required String nokFullNames, required String nokRelationship, required String nokPhoneNumber, required String  phoneProvider,
    required String maritalStatus,
    required String plotNumber, required String postCode,
    required String streetAddress, required String monthsResided,
    required String city, required bool isOwned, required bool isResident, required String  employerName,
    required String employmentType,
    required String  occupation, required String  contactNumber,
    required String employeeNumber, required String  engagementDate,}) async {

    final createClient = TandizaClientExtendedModel(
      firstName: firstName, nrcNumber: nrcnumber,
      surname: surname, dateOfBirth: dateOfBirth, resident: isResident! ? '1' : '0',
        contacts: [TandizaContactModel(contactType: phoneProvider, contactNumber: phoneNumber)],
      title: title, gender: gender,
        addresses: [TandizaAddressModel(addressType: addressType,
            addressLine1: plotNumber, addressLine2: streetAddress, addressLine3: city,
            addressLine4: null, postalCode: postCode, owned: isOwned! ? 'Yes': 'No', monthsResided: monthsResided)],
        employerName : employerName, employmentType : employmentType,
        occupation : occupation, contactNumber : contactNumber ,
        employeeNumber : employeeNumber, engagementDate : engagementDate, maritalStatus: maritalStatus,
      fullNames: nokFullNames, relationship: nokRelationship, supervisorName: supervisorName, postalCode: postCode,

    );

    String url = 'https://nek-runaloan.calidad.co.za/tdzapi/client';
    final response = await http.post(Uri.parse(url), headers: {
      'Accept' : 'application/json',
      'Content-Type' : 'application/json',
      'Authorisation' : 'Tandiza210Rocks1964',
      'Tenant' : 'TDZ'
    },
    body: jsonEncode(createClient.toJson())
    );

    if(response.statusCode == 200){
      return TandizaClientCreatedModel.fromJson(jsonDecode(response.body));
    }else{
      print(createClient.toJson());
      print(jsonDecode(response.body));
      throw Exception('Failed to get data');
    }
  }
}