import 'package:flutter/cupertino.dart';
import 'package:tandiza/datalayer/datasources/firebase_auth_api.dart';
import 'package:tandiza/datalayer/datasources/loan_management_api.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/domain/repository/repository_interface.dart';

import '../datasources/firebase_database_api.dart';

class Repository implements IRepository {

  final LoanManagementApi loanManagementApi;
  final FirebaseAuthApi firebaseAuthApi;
  final FirebaseDatabaseService firebaseDatabaseService;

  Repository({required this.loanManagementApi, required this.firebaseAuthApi, required this.firebaseDatabaseService});

  @override
  Future<TandizaClient?> getUserByNrc(String ? id) async {
    // TODO: implement getUser
    try{
      final TandizaClient ? tandizaClient = await loanManagementApi.getUserByNrc(id!);
      return tandizaClient;
    } catch (e){
      print(e);
    }
  }

  @override
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
    try{
      final FirebaseUserEntity ? firebaseUser = await firebaseAuthApi.
      signInWithPhone(phoneNumber: phoneNumber,
        context: context,
      clientId: clientId,
      firstName: firstName,
      result: result,
      surname: surname,
      nrcNumber: nrcNumber,
      dateOfBirth: dateOfBirth);
      return firebaseUser;
    }catch(e){
      print(e);
    }
  }

  @override
  Stream<FirebaseUserEntity?>? authStateChanges() {
    // TODO: implement authStateChanges
    try{
      final firebaseUser = firebaseAuthApi.onAuthStateChanges;
      return firebaseUser;
    }catch(e){
      print(e);
      return null;
    }
  }

  @override
  Future<void>? signOut() {
    firebaseAuthApi.signOut();
  }

  @override
  Future<void>? updateFirebaseUserData(FirebaseUserModel userModel) {
    // TODO: implement updateFirebaseUserData
    firebaseDatabaseService.updateUserData(userModel);
  }

  @override
  Future<FirebaseUserModel?> getFirebaseUserData() async {
    // TODO: implement getFirebaseUserData
    return firebaseDatabaseService.getUserData();
  }
}