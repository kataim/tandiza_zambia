import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../datalayer/models/tandiza_client_financials_model.dart';
import '../../domain/models/firebase_user_entity.dart';
import '../../domain/models/tandiza_client_entity.dart';
import '../../domain/models/tandiza_client_financials_entity.dart';
import '../../utilities/settings.dart';
import '../state-management/service_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nrcNumberController1 = TextEditingController();

  final TextEditingController _nrcNumberController2 = TextEditingController();

  final TextEditingController _nrcNumberController3 = TextEditingController();

  final Validation _validation = Validation();

  late String phoneNumber;

  late String phoneIsoCode;

  late ServiceProvider _serviceProvider;

  late String nrcnumber;

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
  }

  Future<TandizaClient?> getClientData (String id) async {
    return _serviceProvider.getClientData(id);
  }

  Future<TandizaClientFinancialsModel?> getClientFinancialData(int ? clientId) async {
    return _serviceProvider.getClientFinancials(clientId);
  }

  Future<FirebaseUserEntity?> signInWithPhone({String ? phoneNumber,
    required BuildContext context,
    TandizaClientFinancialsModel ? clientFinancialsModel,
    int ? clientId,
    String ? firstName,
    String ? result,
    String ? surname,
    String ? nrcNumber,
    String ? dateOfBirth, TandizaClientFinancialsModel? tandizaClientFinancials}) async {
    return _serviceProvider.signInWithPhone(
        phoneNumber: phoneNumber,
        context:context,
        tandizaClientFinancials: tandizaClientFinancials,
        clientId: clientId,
        firstName: firstName,
        result: result,
        surname: surname,
        nrcNumber: nrcNumber,
        dateOfBirth: dateOfBirth);
  }

  Future<void> updateFirebaseUser(FirebaseUserModel userModel) async {
    _serviceProvider.saveFirebaseUser(userModel);
  }

  @override
  void initState() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20,),
              const Text('Welcome Back!', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),),
              const SizedBox(height: 10,),
              const Text('Kindly fill in the details below', style: TextStyle( fontSize: 15),),
              const SizedBox(
                height: 50,
              ),
              const Text('Identity Card Number', style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _nrcNumberController1,
                      textInputAction: TextInputAction.next,
                      maxLength: 6,
                      validator: null,
                      onChanged: (value) {},
                      textCapitalization: TextCapitalization.words,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColour,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'NRC Number',
                          labelText: 'NRC Number',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColorDark,
                          )),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _nrcNumberController2,
                      maxLength: 2,
                      validator: _validation.validateNrc2,
                      onChanged: (value) {},
                      textCapitalization: TextCapitalization.words,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColour,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: '',
                          labelText: ''
                      ),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      controller: _nrcNumberController3,
                      maxLength: 1,
                      validator: _validation.validateNrc3,
                      onChanged: (value) {},
                      textCapitalization: TextCapitalization.words,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      cursorColor: kPrimaryColour,
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: '',
                          labelText: ''
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10,),
              const Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold),),
              const SizedBox(height: 10,),
              IntlPhoneField(
                controller: _phoneController,
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                },
                initialCountryCode: 'ZM',
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter Phone Number',
                    labelText: 'Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: kSecondaryColour,
                    )),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50)
                  ),
                  onPressed: () async {
                    nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
                    final tandiza = await getClientData(nrcnumber);

                    if(tandiza?.result == 'Found'){
                      final clientFinancialsModel = await getClientFinancialData(tandiza?.clientId);
                      signInWithPhone(
                          phoneNumber: phoneNumber,
                          context:context,
                          clientFinancialsModel: clientFinancialsModel,
                          clientId: tandiza?.clientId,
                          firstName: tandiza?.firstName,
                          surname: tandiza?.surname ,
                          result: tandiza?.result,
                          nrcNumber: tandiza?.nrcNumber,
                          dateOfBirth: tandiza?.dateOfBirth);

                    }else{
                      showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('User not register'),
                              content: const Text('The user is not present on the system. Please register!'),
                              actions: [
                                TextButton(
                                  child: Text('Cancel'),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                TextButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.pushNamed(context, WelcomeScreen.id);
                                  },
                                )
                              ],
                            );
                          });
                    }


                  }, child: const Text('Sign In', style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColour),)),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, WelcomeScreen.id);
                    },
                child: const Text("Don't have an account? Register.", style: TextStyle(fontWeight: FontWeight.bold),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
