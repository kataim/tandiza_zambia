import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class TandizaClientModel extends TandizaClient{
  final String clientId;
  final String firstName;
  final String surname;
  final String nrcNumber;
  final String dateOfBirth;

  TandizaClientModel({ required this.clientId,
    required this.firstName,
    required this.surname,
    required this.nrcNumber,
    required this.dateOfBirth}) :
        super(clientId: clientId,
          firstName: firstName, surname: surname, nrcNumber: nrcNumber, dateOfBirth: dateOfBirth);

  factory TandizaClientModel.fromJson(Map<String, dynamic> json){

    return TandizaClientModel(
        clientId: json['clientId'],
        firstName: json['firstName'],
        surname: json['surname'],
        nrcNumber: json['nrcNumber'],
        dateOfBirth: json['dateOfBirth']);
  }

  Map<String, dynamic> toJson () {
    return {
      clientId : 'clientId',
      firstName : 'firstName',
      surname : 'surname',
      nrcNumber : 'nrcNumber',
      dateOfBirth : 'dateOfBirth'
    };
  }
}