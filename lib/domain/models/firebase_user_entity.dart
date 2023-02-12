import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class FirebaseUserEntity extends TandizaClient {

  final String ? uid;
  final String ? phoneNumber;

  FirebaseUserEntity({this.phoneNumber, this.uid, clientId,
    firstName,
    surname,
    nrcNumber,
    dateOfBirth,
    result});
}