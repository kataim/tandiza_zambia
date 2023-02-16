import 'package:flutter/cupertino.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../models/tandiza_client_entity.dart';

abstract class IUserInterface {
  Future<TandizaClient?> getUserByNrc(String ? id);
  Future<FirebaseUserEntity?> signInWithPhone(String phoneNumber, BuildContext context);
  Stream<FirebaseUserEntity?> ? authStateChanges();
  Future<void> signOut();
}