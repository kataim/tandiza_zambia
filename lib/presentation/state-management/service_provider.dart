import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../domain/models/firebase_user_entity.dart';

class ServiceProvider extends ChangeNotifier {
  final ApplicationFacade ? applicationFacade;
  ServiceProvider({this.applicationFacade});

  TandizaClient ? tandizaClient = TandizaClient();
  FirebaseUserEntity ? firebaseUserEntity = FirebaseUserEntity();



  Future<TandizaClient?> getClientData (String id) async {
    tandizaClient = await applicationFacade?.getUserByNrc(id);
    notifyListeners();
    return tandizaClient;
  }

  Future<FirebaseUserEntity?> signInWithPhone(
      {String ? phoneNumber,
        required BuildContext context,
        TandizaClient ? tandizaClient,
        int ? clientId,
        String ? firstName,
        String ? result,
        String ? surname,
        String ? nrcNumber,
        String ? dateOfBirth}) async {
    firebaseUserEntity = await applicationFacade?.signInWithPhone(
        phoneNumber: phoneNumber,
        context : context,
        tandizaClient: tandizaClient,
        clientId: clientId,
    firstName: firstName,
    result: result,
    surname: surname,
    nrcNumber: nrcNumber,
    dateOfBirth: dateOfBirth);
    notifyListeners();
    return firebaseUserEntity;
  }

  Future<void> updateFirebaseUser(FirebaseUserModel userModel) async {
    applicationFacade?.updateFirebaseUserData(userModel);
  }

  Stream<FirebaseUserEntity?>? onAuthStateChanges () {
    return applicationFacade?.authStateChanges();

  }

  Future<void> signOut () async {
    applicationFacade?.signOut();
  }

  Future<FirebaseUserModel?> getFirebaseUser() async {
    return applicationFacade?.getFirebaseUserData();
  }

}