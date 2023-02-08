import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class TandizaClientModel extends TandizaClient{
  final int ? clientId;
  final String ? firstName;
  final String ? surname;
  final String ? nrcNumber;
  final String ? dateOfBirth;
  final String ? result;


  TandizaClientModel({ required this.clientId,
    this.firstName,
    this.result,
    this.surname,
    this.nrcNumber,
    this.dateOfBirth}) :
        super(clientId: clientId,
          firstName: firstName, result: result, surname: surname, nrcNumber: nrcNumber, dateOfBirth: dateOfBirth);

  factory TandizaClientModel.fromJson(Map<String, dynamic> json){

    return TandizaClientModel(
        clientId: json['client_id'],
        result: json['result'],
        firstName: json['firstnames'],
        surname: json['surname'],
        nrcNumber: json['nrcnumber'],
        dateOfBirth: json['date_of_birth']);
  }

  Map<String, dynamic> toJson () {
    return {
      'client_id' : clientId,
      'firstName' : firstName,
      'surname' : surname,
      'result' : result,
      'nrcNumber' : nrcNumber,
      'dateOfBirth' : dateOfBirth
    };
  }
}