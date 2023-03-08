import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/widgets/pin_put_widget.dart';

import '../../widgets/otp_header_widget.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phoneNumber,
  this.clientFinancialData,
  this.clientId,
  this.firstName,
  this.surname,
    this.result,
  this.nrcNumber,
  this.dateOfBirth});

  static const String id = 'otp_screen';
  final String ? phoneNumber;
  final TandizaClientFinancialsModel ? clientFinancialData;
  final int ? clientId;
  final String ? firstName;
  final String ? surname;
  final String ? nrcNumber;
  final String ? dateOfBirth;
  final String ? result;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with AutomaticKeepAliveClientMixin{
  late UserCredential authCredential;
  final _auth = FirebaseAuth.instance;
  late String verificationCode;

  @override
  void initState() {
    verifyPhoneNumber();
    super.initState();
  }

  Future<void> verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential).then((value) =>
          print(value.user?.uid)
          );
        },
        verificationFailed: (FirebaseAuthException e){
          print(e);
        },
        codeSent: (String verificationId, int ? resendToken){
          setState(() {
            verificationCode = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId){
            verificationCode = verificationId;
        }, timeout: const Duration(seconds: 60));
  }

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Dismiss any open snackbar
    return Scaffold(
      appBar: AppBar(title: const Text('Phone Verification'),
      centerTitle: true,),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 64, 24, 24),
        child: Column(
          children: [
            OtpHeader(phoneNumber: widget.phoneNumber,),
            FilledRoundedPinPut(
              onSubmit: (pin) async{
                try{
                final credential = await FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: pin)
                  );
                if(credential.user?.uid != null){
                  if(!mounted)
                    return;
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(HomeScreen.id, (Route<dynamic> route) => false);
                }
                }catch(e){
                  print(e);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Incorrect Pin Code'))
                  );
                  FocusScope.of(context).unfocus();
                }

              },
            ),
            const SizedBox(height: 44),
            Text(
              'Didn’t receive code?',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
            Text(
              'Resend',
              style: GoogleFonts.poppins(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: const Color.fromRGBO(62, 116, 165, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

