import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/datalayer/datasources/firebase_database_api.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import '../../domain/models/firebase_user_entity.dart';
import '../../utilities/settings.dart';
import '../models/firebase_user_model.dart';

class FirebaseAuthApi {
    final _auth = FirebaseAuth.instance;
    late String smsCode;
    final TextEditingController controller = TextEditingController();
    final _form_key = GlobalKey<FormState>();
    late UserCredential authCredential;

    Future<FirebaseUserEntity?> signInWithPhone (
        {String ? phoneNumber,
            required BuildContext context,
            TandizaClient ? tandizaClient,
            int ? clientId,
            String ? firstName,
            String ? result,
            String ? surname,
            String ? nrcNumber,
            String ? dateOfBirth}) async{
        await _auth.verifyPhoneNumber(
            phoneNumber: phoneNumber,
            verificationCompleted: (PhoneAuthCredential credential) async {
                await _auth.signInWithCredential(credential);
            },
            verificationFailed: (FirebaseAuthException e) {

                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Phone Number Error'),
                            content: Text(e.code.toString()),
                            actions: [
                                TextButton(
                                    child: const Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                )
                            ],
                        );
                    });
            },
            codeSent: (String verificationId, int ? resendToken) async {
                showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Enter SMS Code'),
                            content: Container(
                                height: 300,
                                child: Form(
                                    key: _form_key,
                                    child: Center(
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                                TextFormField(
                                                    controller: controller,
                                                    onChanged: (value) {
                                                        smsCode = value;
                                                    },
                                                    validator: null,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: kPrimaryColour,
                                                    decoration: kTextFieldDecoration.copyWith(
                                                        hintText: 'Sms Code',
                                                        prefixIcon: const Icon(
                                                            Icons.message,
                                                            color: kSecondaryColour,
                                                        )))
                                            ],
                                        ),
                                    ),
                                ),
                            ),
                            actions: [
                                TextButton(
                                    child: const Text('Submit'),
                                    onPressed: () async {
                                        final credential = PhoneAuthProvider.credential(
                                            verificationId: verificationId,
                                            smsCode: controller.text.trim());
                                        Navigator.of(context).popUntil((route) => route.isFirst);
                                        final userCredential = await _auth.signInWithCredential(credential);
                                        FirebaseDatabaseService(uid: userCredential.user?.uid).
                                        updateUserData(FirebaseUserModel(
                                            uid: userCredential.user?.uid,
                                            phoneNumber: userCredential.user?.phoneNumber,
                                            clientId: clientId,
                                            firstName: firstName,
                                            surname: surname,
                                            result: result,
                                            nrcNumber: nrcNumber,
                                            dateOfBirth: dateOfBirth,
                                        ));
                                    },
                                )
                            ],
                        );
                    });

            },
            codeAutoRetrievalTimeout: (String verificationId) {
                showDialog<void>(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Phone Number Error'),
                            content: const Text('The sms code was not resolved'),
                            actions: [
                                TextButton(
                                    child: Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                )
                            ],
                        );
                    });
            },
            timeout: const Duration(seconds: 60));

        return _userFromFirebase(authCredential.user);
    }

    FirebaseUserEntity _userFromFirebase(User ? user){
        return FirebaseUserEntity(
            phoneNumber: user?.phoneNumber,
            uid: user?.uid,
        );
    }

    Stream<FirebaseUserEntity?> get onAuthStateChanges {
        return _auth.authStateChanges().map((e) {
            return _userFromFirebase(e);
        });
    }

    Future<void> signOut () async {
        _auth.signOut();
    }


}