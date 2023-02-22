import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class FirebaseUserModel extends TandizaClient {
  final String ? uid;
  final String ? phoneNumber;

  FirebaseUserModel({this.uid, this.phoneNumber,
    clientId,
    firstName,
    result,
    surname,
    nrcNumber,
    dateOfBirth
  }) : super(clientId: clientId,
      firstName: firstName, result: result, surname: surname, nrcNumber: nrcNumber, dateOfBirth: dateOfBirth);


  factory FirebaseUserModel.fromJson(Map<String, dynamic> ? json){
    return FirebaseUserModel(
        clientId: json?['client_id'],
        result: json?['result'],
        firstName: json?['firstName'],
        surname: json?['surname'],
        nrcNumber: json?['nrcnumber'],
        dateOfBirth: json?['date_of_birth'],
        uid: json?['uid'],
        phoneNumber: json?['phoneNumber']);
  }

  Map<String, dynamic> toJson () {
    return {
      'client_id': clientId,
      'firstName': firstName,
      'surname': surname,
      'result': result,
      'nrcnumber': nrcNumber,
      'date_of_birth': dateOfBirth,
      'uid' : uid,
      'phoneNumber' : phoneNumber
    };
  }
}