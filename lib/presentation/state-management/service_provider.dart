import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../domain/models/firebase_user_entity.dart';

class ServiceProvider extends ChangeNotifier {
  final ApplicationFacade ? applicationFacade;
  ServiceProvider({this.applicationFacade});

  TandizaClient ? tandizaClient = TandizaClient();
  FirebaseUserEntity ? firebaseUserModel = FirebaseUserEntity();



  Future<TandizaClient?> getClientData (String id) async {
    tandizaClient = await applicationFacade?.getUserByNrc(id);
    notifyListeners();
    return tandizaClient;
  }

  Future<FirebaseUserEntity?> signInWithPhone(String phoneNumber, BuildContext context) async {
    firebaseUserModel = await applicationFacade?.signInWithPhone(phoneNumber, context);
    notifyListeners();
    return firebaseUserModel;
  }

  Stream<FirebaseUserEntity?>? onAuthStateChanges () {
    return applicationFacade?.authStateChanges();

  }

  Future<void> signOut () async {
    applicationFacade?.signOut();
  }

}