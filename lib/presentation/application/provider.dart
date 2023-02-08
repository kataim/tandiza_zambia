import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/get_user.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

class UserServiceProvider extends ChangeNotifier {
  final GetUserFacade getUserFacade;
  UserServiceProvider({required this.getUserFacade});

  TandizaClient ? tandizaClient = TandizaClient(clientId: 0);

  Future<void> getClientData () async {
    tandizaClient = await getUserFacade.getUser();
    notifyListeners();
  }

}