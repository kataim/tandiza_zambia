import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_applications_model.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_model.dart';

part 'tandiza_client_financials_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TandizaClientFinancialsModel{
  final List<TandizaLoanModel> ? loans;
  final List<TandizaApplicationModel> ? applications;
  @JsonKey(name: 'client_id')
  final int ? clientId;
  @JsonKey(name: 'firstnames')
  final String ? firstName;
  final String ? surname;
  @JsonKey(name: 'nrcnumber')
  final String ? nrcNumber;
  @JsonKey(name: 'date_of_birth')
  final String ? dateOfBirth;
  final String ? result;

  TandizaClientFinancialsModel({this.clientId, this.firstName, this.surname, this.loans, this.applications,
    this.nrcNumber, this.dateOfBirth, this.result});

  factory TandizaClientFinancialsModel.fromJson(Map<String, dynamic> ? json){
    return _$TandizaClientFinancialsModelFromJson(json!);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaClientFinancialsModelToJson(this);
  }
}