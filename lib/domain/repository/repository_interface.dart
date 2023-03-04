import 'package:flutter/cupertino.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import '../../datalayer/models/tandiza_client_financials_model.dart';
import '../models/tandiza_client_entity.dart';

abstract class IRepository {
  Future<TandizaClient?> getUserByNrc(String ? id);
  Future<FirebaseUserEntity?> signInWithPhone({
    String ? phoneNumber,
    required BuildContext  context,
    TandizaClientFinancialsModel ? tandizaClientFinancialsModel,
    int ? clientId,
    String ? firstName,
    String ? result,
    String ? surname,
    String ? nrcNumber,
    String ? dateOfBirth});
  Stream<FirebaseUserEntity?> ? authStateChanges();
  Future<void> ? signOut();
  Future<void> ? saveFirebaseUserData(FirebaseUserModel userModel);
  Future<FirebaseUserModel?> getFirebaseUserData();
  Future<void> ? updateFirebaseUserData(Map<String, dynamic> userJsonMap);
  Future<void> loanStatement (String loanId);
  Future<void> saveClientFinancials(TandizaClientFinancialsModel financialsModel);
  Future<TandizaClientFinancialsModel?> getClientFinancials(int ? clientId);
}