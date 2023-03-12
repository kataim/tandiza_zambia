import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_address_model.dart';
import 'package:tandiza/datalayer/models/tandiza_contacts_model.dart';

part 'tandiza_client_extended_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TandizaClientExtendedModel {

  @JsonKey(name: 'nrcnumber')
  final String  nrcNumber;
  @JsonKey(name: 'firstnames')
  final String  firstName;
  @JsonKey(name: 'date_of_birth')
  final String  dateOfBirth;
  final String  surname;
  final String  resident;
  final String  title;
  final String  gender;
  @JsonKey(name: 'marital_status')
  final String  maritalStatus;
  List<TandizaContactModel>  contacts;
  List<TandizaAddressModel>  addresses;
  @JsonKey(name: 'employer_name')
  final String  employerName;
  final String  occupation;
  @JsonKey(name: 'employment_type')
  final String  employmentType;
  @JsonKey(name: 'engagement_date')
  final String  engagementDate;
  @JsonKey(name: 'employee_number')
  final String  employeeNumber;
  @JsonKey(name: 'supervisor_name')
  final String  supervisorName;
  @JsonKey(name: 'nok_fullnames')
  final String  fullNames;
  @JsonKey(name: 'nok_relationship')
  final String  relationship;
  @JsonKey(name: 'nok_contact_number')
  final String  contactNumber;
  @JsonKey(name: 'postal_code')
  final String postalCode;

  TandizaClientExtendedModel({required this.nrcNumber, required this.dateOfBirth,
      required this.surname, required this.firstName, required this.maritalStatus,
      required this.gender, required this.title, required this.addresses,
      required this.contacts, required this.employerName, required this.employmentType,
      required this.occupation, required this.resident, required this.contactNumber,
      required this.employeeNumber, required this.engagementDate, required this.fullNames,
      required this.relationship, required this.supervisorName, required this.postalCode});

  factory TandizaClientExtendedModel.fromJson(Map<String, dynamic> json){
    return _$TandizaClientExtendedModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaClientExtendedModelToJson(this);
  }
}