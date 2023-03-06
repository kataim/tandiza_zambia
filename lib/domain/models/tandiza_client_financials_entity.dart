import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_applications_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/domain/models/tandiza_loans_entity.dart';

import '../../datalayer/models/tandiza_applications_model.dart';
import '../../datalayer/models/tandiza_loan_model.dart';

class TandizaClientFinancials {

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

  TandizaClientFinancials({this.result, this.clientId, this.firstName,
    this.surname,this.nrcNumber,
    this.dateOfBirth,
    this.loans,
    this.applications});
}