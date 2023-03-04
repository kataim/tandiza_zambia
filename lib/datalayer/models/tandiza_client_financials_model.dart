import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_applications_model.dart';
import 'package:tandiza/datalayer/models/tandiza_balance_model.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_model.dart';
import '../../domain/models/tandiza_client_financials_entity.dart';

part 'tandiza_client_financials_model.g.dart';

@JsonSerializable()
class TandizaClientFinancialsModel extends TandizaClientFinancials{
  final List<TandizaLoanModel> ? loans;
  @override
  final List<TandizaApplicationModel> ? applications;
  @override
  @JsonKey(name: 'client_id')
  final int ? clientId;
  @override
  @JsonKey(name: 'firstnames')
  final String ? firstName;
  @override
  @JsonKey(name: 'nrcnumber')
  final String ? nrcNumber;
  @JsonKey(name: 'date_of_birth')
  final String ? dateOfBirth;

  TandizaClientFinancialsModel({result, this.clientId, this.firstName,
    surname, this.nrcNumber,
    this.dateOfBirth,
    this.loans,
    this.applications}) : super(result: result, clientId: clientId,
      firstName: firstName, surname: surname, dateOfBirth: dateOfBirth, loans: loans,
  applications: applications);

  factory TandizaClientFinancialsModel.fromJson(Map<String, dynamic> json){
    return _$TandizaClientFinancialsModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaClientFinancialsModelToJson(this);
  }
}