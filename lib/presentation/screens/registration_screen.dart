


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/widgets/upload_documents_widget.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../domain/models/tandiza_client_entity.dart';
import '../../utilities/settings.dart';
import '../state-management/service_provider.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 0;
  bool _isChecked = false;
  late String nrcnumber;
  final Validation _validation = Validation();
  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTandiza = GlobalKey<FormState>();
  late String phoneNumber;
  late ServiceProvider _serviceProvider;
  late String phoneIsoCode;
  bool visible = false;
  String confirmedNumber = '';
  DateTime firstDate = DateTime(1940, 01, 01);
  DateTime lastDate = DateTime(2004, 1, 1);
  DateTime initialDate = DateTime(1986, 1, 1);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _nrcNumberController1 = TextEditingController();
  final TextEditingController _nrcNumberController2 = TextEditingController();
  final TextEditingController _nrcNumberController3 = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.initState();
  }

  Future<TandizaClient?> getClientData (String id) async {
    return _serviceProvider.getClientData(id);
  }

  Future<void> signInWithPhone(String phoneNumber, BuildContext context, TandizaClient ? tandizaClient) async {
    _serviceProvider.signInWithPhone(phoneNumber: phoneNumber, context:context,);
  }
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
    final tandiza = Provider.of<ServiceProvider>(context).tandizaClient;
    return Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            title: Text('New Client Sign Up'),
          ),
          resizeToAvoidBottomInset: true,
          body: Stepper(
            controlsBuilder: (BuildContext context, ControlsDetails controlsDetails) {
              final isLastStep = currentStep == getSteps(currentStep, context).length - 1;

              return Container(
                margin: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(child: ElevatedButton(
                      onPressed: controlsDetails.onStepContinue,
                      child: Text(isLastStep ? 'Confirm' : 'Continue', style: TextStyle(color: kWhiteColour, fontSize: 18,
                      fontWeight: FontWeight.w500),),
                    )),
                    const SizedBox(height: 15,),
                    if(currentStep != 0)
                      Expanded(child: TextButton(
                        onPressed: controlsDetails.onStepCancel,
                        child: Text('Cancel',style: TextStyle( fontSize: 18,
                            fontWeight: FontWeight.w500)),
                      )),
                  ],
                ),
              );
            },
            onStepTapped: (step){
              setState(() {
                currentStep = step;
              });
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

              if (isLastStep && _isChecked) {
                //TODO register the user and navigate to the dashboard
                nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
                getClientData(nrcnumber);
                signInWithPhone(phoneNumber, context, tandiza);
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
          content: Column(
            children: [
              TextFormField(
                validator: null,
                //_validateName,
                onChanged: (value) {},
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'First Name',
                    hintText: 'First Name',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: null,
                //_validateName,
                onChanged: (value) {},
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                  labelText: 'Surname',
                    hintText: 'Surname',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      controller: _nrcNumberController1,
                      textInputAction: TextInputAction.next,
                      maxLength: 6,
                      validator: _validation.validateNrc1,
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
              const SizedBox(
                height: 20,
              ),
              IntlPhoneField(
                controller: _phoneController,
                onChanged: (phone) {
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                },
                initialCountryCode: 'ZM',
                decoration: kTextFieldDecoration.copyWith(
                    labelText: 'Phone Number',
                    hintText: 'Enter Phone Number',
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: kSecondaryColour,
                    )),
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
                textInputAction: TextInputAction.done,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Date of birth',
                    labelText: 'Date of birth',
                    prefixIcon: Icon(
                      Icons.calendar_month_sharp,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
            ],
          )),
      Step(
          state : currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Address'),
          content: Column(
            children: [
              TextFormField(
                validator: null,
                //_validateName,
                onChanged: (value) {},
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Plot No/House No',
                    labelText: 'Plot No.',
                    prefixIcon: Icon(
                      Icons.business,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                validator: null,
                //_validateName,
                onChanged: (value) {},
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Area',
                    labelText: 'Area',
                    prefixIcon: Icon(
                      Icons.web_asset_outlined,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                validator: null,
                //_validateName,
                onChanged: (value) {},
                textCapitalization: TextCapitalization.words,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                cursorColor: kPrimaryColour,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'City',
                    labelText: 'City',
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Theme.of(context).primaryColorDark,
                    )),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  validator: null,
                  //_validateEmail,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Province',
                      labelText: 'Province',
                      prefixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Theme.of(context).primaryColorDark,
                      ))),
            ],
          )),
      Step(
          state : currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Complete'),
          content: const UploadDocuments())
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
