import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'home_screen.dart';


class ExistingClientRegistrationScreen extends StatefulWidget {
  ExistingClientRegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'existing_client_registration_screen';

  @override
  State<ExistingClientRegistrationScreen> createState() =>
      _ExistingClientRegistrationScreenState();
}

class _ExistingClientRegistrationScreenState
    extends State<ExistingClientRegistrationScreen> {
  int currentStep = 0;
  bool _isChecked = false;
  final Validation _validation = Validation();
  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTandiza = GlobalKey<FormState>();
  late String phoneNumber;
  late String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  DateTime firstDate = DateTime(1940, 01, 01);
  DateTime lastDate = DateTime(2004, 1, 1);
  DateTime initialDate = DateTime(1986, 1, 1);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _clientNumberController = TextEditingController();
  final TextEditingController _nrcNumberController1 = TextEditingController();
  final TextEditingController _nrcNumberController2 = TextEditingController();
  final TextEditingController _nrcNumberController3 = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();


  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
  }

  Future<DateTime?> pickDate() async {
    return showDatePicker(context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
  }

  void onValidPhoneNumber(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      visible = true;
      confirmedNumber = internationalizedPhoneNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Tandiza Client'),
      ),
      resizeToAvoidBottomInset: true,
      body: Stepper(
        controlsBuilder:
            (BuildContext context, ControlsDetails controlsDetails) {
          final isLastStep =
              currentStep == getSteps(currentStep, context).length - 1;
          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: controlsDetails.onStepContinue,
                  child: Text(
                    isLastStep ? 'Confirm' : 'Continue',
                    style: TextStyle(
                        color: kWhiteColour,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                )),
                const SizedBox(
                  height: 15,
                ),
                if (currentStep != 0)
                  Expanded(
                      child: TextButton(
                    onPressed: controlsDetails.onStepCancel,
                    child: Text('Cancel',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500)),
                  )),
              ],
            ),
          );
        },
        onStepCancel: () {
          if (currentStep != 0) {
            setState(() {
              currentStep = currentStep - 1;
            });
          }
        },
        onStepContinue: () {
          final isLastStep =
              currentStep == getSteps(currentStep, context).length - 1;

          if (isLastStep && _formKeyTandiza.currentState!.validate() && _isChecked) {
            //TODO register the user and navigate to the dashboard
            Navigator.pushNamed(context, HomeScreen.id);
          } else {
            setState(() {
              currentStep = currentStep + 1;
            });
          }
        },
        currentStep: currentStep,
        elevation: 0,
        type: StepperType.horizontal,
        steps: getSteps(currentStep, context),
      ),
    );
  }

  List<Step> getSteps(int currentStep, BuildContext context) {
    return <Step>[
      Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Account'),
          content: Form(
            key: _formKeyAccount,
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _lastNameController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                IntlPhoneField(
                  onChanged: (phone) {
                    setState(() {
                      phoneNumber = phone.completeNumber;
                    });
                  },
                  initialCountryCode: 'ZM',
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter Phone Number',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: kSecondaryColour,
                      )),
                ),
              ],
            ),
          )),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Tandiza'),
          content: Form(
            key: _formKeyTandiza,
            child: Column(
              children: [
                TextFormField(
                  controller: _clientNumberController,
                  validator: null,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Client Number',
                      prefixIcon: Icon(
                        Icons.numbers,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        controller: _nrcNumberController1,
                        textInputAction: TextInputAction.next,
                        maxLength: 6,
                        validator: null,
                        //_validateName,
                        onChanged: (value) {},
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColour,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: 'NRC Number',
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Theme.of(context).primaryColorDark,
                            )),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _nrcNumberController2,
                        maxLength: 2,
                        validator: null,
                        //_validateName,
                        onChanged: (value) {},
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColour,
                        decoration: kTextFieldDecoration.copyWith(
                          hintText: ''
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _nrcNumberController3,
                        maxLength: 1,
                        validator: null,
                        //_validateName,
                        onChanged: (value) {},
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColour,
                        decoration: kTextFieldDecoration.copyWith(
                            hintText: ''
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _dateOfBirthController,
                  validator: null,
                  //_validateName,
                  onChanged: (value) {},
                  onTap: () async {
                    final dateSelected = await pickDate();

                    if(dateSelected == null) return;

                    setState(() {
                      _dateOfBirthController.text = DateFormat('d MMM y')
                          .format(dateSelected);
                    });

                  },
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Date of birth',
                      prefixIcon: Icon(
                        Icons.calendar_month_sharp,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
              ],
            ),
          )),
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: ListTile(
            title: Text('Terms & Conditions'),
            subtitle: Text('I agree to Tandiza Finance Terms. Information provided is correct'),
            isThreeLine: true,
            leading: Checkbox(
              value: _isChecked,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              },
            ),
          ))
      /*Step(
          state : currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('NRC'),
          content: const UploadDocuments()),
      Step(
          state : currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text('Payslip'),
          content: const UploadDocuments()),
      Step(
          state : currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text('Photo'),
          content: const UploadDocuments()),*/
    ];
  }
}
