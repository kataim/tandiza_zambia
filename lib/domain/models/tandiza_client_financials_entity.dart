import 'package:tandiza/domain/models/tandiza_applications_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/domain/models/tandiza_loans_entity.dart';

class TandizaClientFinancials extends TandizaClient{

  final List<TandizaLoanEntity> ? loans;
  final List<TandizaApplication> ? applications;

  TandizaClientFinancials({result, clientId, firstName,
    surname,nrcNumber,
    dateOfBirth,
    this.loans,
    this.applications});

}