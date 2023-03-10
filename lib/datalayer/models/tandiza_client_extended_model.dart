import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_address_model.dart';
import 'package:tandiza/datalayer/models/tandiza_contacts_model.dart';

part 'tandiza_client_extended_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TandizaClientExtendedModel {

  @JsonKey(name: 'nrcnumber')
  final String ? nrcNumber;
  @JsonKey(name: 'firstnames')
  final String ? firstName;
  @JsonKey(name: 'date_of_birth')
  final String ? dateOfBirth;
  final String ? surname;
  final String ? resident;
  final String ? title;
  final String ? gender;
  @JsonKey(name: 'marital_status')
  final String ? maritalStatus;
  List<TandizaContactModel> ? contacts;
  List<TandizaAddressModel> ? addresses;
  @JsonKey(name: 'employer_name')
  final String ? employerName;
  final String ? occupation;
  @JsonKey(name: 'employment_type')
  final String ? employmentType;
  @JsonKey(name: 'engagement_date')
  final String ? engagementDate;
  @JsonKey(name: 'employee_number')
  final String ? employeeNumber;
  @JsonKey(name: 'supervisor_name')
  final String supervisorName;
  @JsonKey(name: 'nok_fullnames')
  final String ? fullNames;
  final String ? relationship;
  @JsonKey(name: 'nok_contact_number')
  final String ? contactNumber;

  TandizaClientExtendedModel(this.nrcNumber, this.dateOfBirth,
      this.surname, this.firstName, this.maritalStatus,
      this.gender, this.title, this.addresses,
      this.contacts, this.employerName, this.employmentType,
      this.occupation, this.resident, this.contactNumber,
      this.employeeNumber, this.engagementDate, this.fullNames,
      this.relationship, this.supervisorName);

  factory TandizaClientExtendedModel.fromJson(Map<String, dynamic> json){
    return _$TandizaClientExtendedModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaClientExtendedModelToJson(this);
  }
}