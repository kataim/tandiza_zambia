import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/presentation/screens/start_screen.dart';
import 'package:tandiza/widgets/pin_put_widget.dart';

import '../../datalayer/datasources/firebase_database_api.dart';
import '../../datalayer/models/firebase_user_model.dart';
import '../../datalayer/models/tandiza_loan_statement_model.dart';
import '../../domain/models/tandiza_client_entity.dart';
import '../../widgets/otp_header_widget.dart';
import '../state-management/service_provider.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, this.phoneNumber, required this.nrcNumber});

  static const String id = 'otp_screen';
  final String ? phoneNumber;
  final String nrcNumber;


  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with AutomaticKeepAliveClientMixin{
  late UserCredential authCredential;
  final _auth = FirebaseAuth.instance;
  late String verificationCode;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ServiceProvider _serviceProvider;

  Future<TandizaClient?> getClientData (String id) async {
    return _serviceProvider.getClientData(id);
  }

  Future<TandizaClientFinancialsModel?> getClientFinancialData(int ? clientId) async {
    return _serviceProvider.getClientFinancials(clientId);
  }

  Future<TandizaLoanStatementModel?> getLoanStatement(int ? loanId) async {
    return _serviceProvider.getLoanStatement(loanId);
  }

  @override
  void initState() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);

    verifyPhoneNumber();
    super.initState();
  }

  Future<void> verifyPhoneNumber() async {
    _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          final tandiza = await getClientData(widget.nrcNumber);
          final tandizaClientFinancials = await getClientFinancialData(tandiza?.clientId);
          final statement = await getLoanStatement(tandizaClientFinancials?.loans?[0].loanId);
          if(tandiza?.result !=null){

            final authCredential = await _auth.signInWithCredential(credential);
            FirebaseDatabaseService(uid: authCredential.user?.uid).
            saveUserData(FirebaseUserModel(
              uid: authCredential.user?.uid,
              phoneNumber: authCredential.user?.phoneNumber,
              clientId: tandiza?.clientId,
              firstName: tandiza?.firstName,
              surname: tandiza?.surname,
              result: tandiza?.result,
              nrcNumber: tandiza?.nrcNumber,
              dateOfBirth: tandiza?.dateOfBirth,
            ));
            FirebaseDatabaseService(uid: authCredential.user?.uid).
            saveClientFinancialData(TandizaClientFinancialsModel(
                loans: tandizaClientFinancials?.loans,
                applications: tandizaClientFinancials?.applications
            ));
            FirebaseDatabaseService(uid: authCredential.user?.uid).
            saveLoanStatement(TandizaLoanStatementModel(
                pdf: statement?.pdf
            ));
          }else{

          }
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
      key: _scaffoldKey,
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
                  final tandiza = await getClientData(widget.nrcNumber);
                  final tandizaClientFinancials = await getClientFinancialData(tandiza?.clientId);
                  final statement = await getLoanStatement(tandizaClientFinancials?.loans?[0].loanId);
                  final credential = await FirebaseAuth.instance.signInWithCredential(
                      PhoneAuthProvider.credential(
                          verificationId: verificationCode, smsCode: pin)
                  );

                  FirebaseDatabaseService(uid: credential.user?.uid).
                  saveUserData(FirebaseUserModel(
                    uid: credential.user?.uid,
                    phoneNumber: credential.user?.phoneNumber,
                    clientId: tandiza?.clientId,
                    firstName: tandiza?.firstName,
                    surname: tandiza?.surname,
                    result: tandiza?.result,
                    nrcNumber: tandiza?.nrcNumber,
                    dateOfBirth: tandiza?.dateOfBirth,
                  ));
                  FirebaseDatabaseService(uid: credential.user?.uid).
                  saveClientFinancialData(TandizaClientFinancialsModel(
                      loans: tandizaClientFinancials?.loans,
                      applications: tandizaClientFinancials?.applications
                  ));
                  FirebaseDatabaseService(uid: credential.user?.uid).
                  saveLoanStatement(TandizaLoanStatementModel(
                      pdf: statement?.pdf
                  ));
                }catch(e){
                  print(e);
                  Future.delayed(Duration.zero, (){
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Invalid Sms Code'),
                            content: Text(e.toString()),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: const Text('Dismiss'))
                            ],
                          );
                        });
                  });

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

