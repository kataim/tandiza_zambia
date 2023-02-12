import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tandiza/datalayer/datasources/firebase_auth_api.dart';
import 'package:tandiza/datalayer/datasources/loan_management_api.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/domain/repository/repository_interface.dart';

class Repository implements IRepository {

  final LoanManagementApi loanManagementApi;
  final FirebaseAuthApi firebaseAuthApi;

  Repository({required this.loanManagementApi, required this.firebaseAuthApi});

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
  Future<FirebaseUserModel?> signInWithPhone(String phoneNumber, BuildContext context) async {
    try{
      final FirebaseUserModel ? firebaseUser = await firebaseAuthApi.signInWithPhone(phoneNumber, context);
      return firebaseUser;
    }catch(e){
      print(e);
    }
  }
}