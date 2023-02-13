import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import '../../domain/models/firebase_user_entity.dart';
import '../../utilities/settings.dart';

class FirebaseAuthApi {
    final _auth = FirebaseAuth.instance;
    late String smsCode;
    final _form_key = GlobalKey<FormState>();

    Future<FirebaseUserEntity?> signInWithPhone (String phoneNumber, BuildContext context) async{
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
                                    child: Text('OK'),
                                    onPressed: () {
                                        Navigator.pop(context);
                                    },
                                )
                            ],
                        );
                    });
            },
            codeSent: (String verificationId, int ? resendToken) async {

                final _controller = TextEditingController();
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
                                                    controller: _controller,
                                                    onChanged: (value) {
                                                        smsCode = value;
                                                    },
                                                    validator: null,
                                                    textAlign: TextAlign.center,
                                                    keyboardType: TextInputType.number,
                                                    cursorColor: kPrimaryColour,
                                                    decoration: kTextFieldDecoration.copyWith(
                                                        hintText: 'Sms Code',
                                                        prefixIcon: Icon(
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
                                    child: Text('Submit'),
                                    onPressed: () async {
                                        final credential = PhoneAuthProvider.credential(
                                            verificationId: verificationId,
                                            smsCode: _controller.text.trim());
                                        Navigator.pop(context);
                                        await _auth.signInWithCredential(credential);
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


}