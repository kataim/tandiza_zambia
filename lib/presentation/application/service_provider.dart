import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';

class ServiceProvider extends ChangeNotifier {
  final ApplicationFacade applicationFacade;
  ServiceProvider({required this.applicationFacade});

  TandizaClient ? tandizaClient = TandizaClient();
  FirebaseUserModel ? firebaseUserModel = FirebaseUserModel();

  Future<TandizaClient?> getClientData (String id) async {
    tandizaClient = await applicationFacade.getUserByNrc(id);
    notifyListeners();
    return tandizaClient;
  }

  Future<FirebaseUserModel?> signInWithPhone(String phoneNumber, BuildContext context) async {
    firebaseUserModel = await applicationFacade?.signInWithPhone(phoneNumber, context);
    notifyListeners();
    return firebaseUserModel;
  }

}