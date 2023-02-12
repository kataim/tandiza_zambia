import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class FirebaseUser extends TandizaClient {

  final String ? uid;
  final String ? phoneNumber;

  FirebaseUser({this.phoneNumber, this.uid, clientId,
    firstName,
    surname,
    nrcNumber,
    dateOfBirth,
    result});
}