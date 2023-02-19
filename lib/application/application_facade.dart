import 'package:flutter/cupertino.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/repository/repository_interface.dart';
import '../datalayer/models/firebase_user_model.dart';
import '../datalayer/repository/repository.dart';
import '../domain/models/tandiza_client_entity.dart';
import '../domain/usecases/application_interface.dart';

class ApplicationFacade implements IUserInterface{
  final Repository  userRepository;

  ApplicationFacade({required this.userRepository});

  @override
  Future<TandizaClient?> getUserByNrc(String ? id) async {
    // TODO: implement getUser
    return userRepository.getUserByNrc(id);
  }

  /*@override
  Future<FirebaseUserEntity?> signInWithPhone(String phoneNumber, BuildContext context, TandizaClient ? tandizaClient) async {
    return userRepository.signInWithPhone(phoneNumber, context, tandizaClient);
  }*/

  @override
  Stream<FirebaseUserEntity?>? authStateChanges() {
    // TODO: implement authStateChanges
    return userRepository.authStateChanges();
  }

  @override
  Future<void> signOut() async {
    userRepository.signOut();
  }

  @override
  Future<void>? updateFirebaseUserData(FirebaseUserModel userModel) {
    // TODO: implement updateFirebaseUserData
    userRepository.updateFirebaseUserData(userModel);
  }

  @override
  Future<FirebaseUserEntity?> signInWithPhone({
    String ? phoneNumber,
    required BuildContext context,
    TandizaClient? tandizaClient,
    int ? clientId,
    String? firstName,
    String? result,
    String? surname,
    String? nrcNumber,
    String? dateOfBirth}) async {
    // TODO: implement signInWithPhone
    return userRepository.signInWithPhone(
      phoneNumber : phoneNumber,
      context: context,
      tandizaClient: tandizaClient,
      clientId: clientId,
      firstName: firstName,
      result: result,
      surname: surname,
      nrcNumber: nrcNumber,
      dateOfBirth: dateOfBirth
    );
  }

  @override
  Future<FirebaseUserModel?> getFirebaseUserData() async {
    // TODO: implement getFirebaseUserData
    return userRepository.getFirebaseUserData();
  }
}