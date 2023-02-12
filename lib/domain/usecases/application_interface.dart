import 'package:flutter/cupertino.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../models/tandiza_client_entity.dart';

abstract class IUserInterface {
  Future<TandizaClient?> getUserByNrc(String ? id);
  Future<FirebaseUserModel?> signInWithPhone(String phoneNumber, BuildContext context);
}