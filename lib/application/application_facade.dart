import 'package:flutter/cupertino.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/repository/repository_interface.dart';
import '../datalayer/models/firebase_user_model.dart';
import '../domain/models/tandiza_client_entity.dart';
import '../domain/usecases/application_interface.dart';

class ApplicationFacade implements IUserInterface{
  final IRepository  userRepository;

  ApplicationFacade({required this.userRepository});

  @override
  Future<TandizaClient?> getUserByNrc(String ? id) async {
    // TODO: implement getUser
    return userRepository.getUserByNrc(id);
  }

  @override
  Future<FirebaseUserEntity?> signInWithPhone(String phoneNumber, BuildContext context) async {
    return userRepository.signInWithPhone(phoneNumber, context);
  }

  @override
  Stream<FirebaseUserEntity?>? authStateChanges() {
    // TODO: implement authStateChanges
    return userRepository.authStateChanges();
  }
}