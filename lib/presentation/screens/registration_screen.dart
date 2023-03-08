import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../state-management/service_provider.dart';



class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'existing_client_registration_screen';

  @override
  State<RegistrationScreen> createState() =>
      _RegistrationScreenState();
}

class _RegistrationScreenState
    extends State<RegistrationScreen> {
  int currentStep = 0;
  bool _isChecked = false;
  bool _isResident = false;
  late String nrcnumber;
  final Validation _validation = Validation();
  final focusNodePhone = FocusNode();
  final focusNodeNrc1 = FocusNode();
  final focusNodeNrc2 = FocusNode();
  final focusNodeNrc3 = FocusNode();

  final GlobalKey<FormState> _formKeyIdentity = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTandiza = GlobalKey<FormState>();
  late String phoneNumber;
  late ServiceProvider _serviceProvider;
  late String phoneIsoCode;
  String title = 'Mr';
  String gender = 'Male';
  String maritalStatus = 'Married';
  bool visible = false;
  String confirmedNumber = '';
  DateTime firstDate = DateTime(1940, 01, 01);
  DateTime lastDate = DateTime(2004, 1, 1);
  DateTime initialDate = DateTime(1986, 1, 1);
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nrcNumberController1 = TextEditingController();
  final TextEditingController _nrcNumberController2 = TextEditingController();
  final TextEditingController _nrcNumberController3 = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.initState();
  }

  Future<TandizaClient?> getClientData (String id) async {
    return _serviceProvider.getClientData(id);
  }

  Future<TandizaClientFinancialsModel?> getClientFinancialData(int ? clientId) async {
    return _serviceProvider.getClientFinancials(clientId);
  }

  Future<FirebaseUserEntity?> signInWithPhone({String ? phoneNumber,
    required BuildContext context,
    TandizaClientFinancialsModel ? tandizaClientFinancials,
    int ? clientId,
    String ? firstName,
    String ? result,
    String ? surname,
    String ? nrcNumber,
    String ? dateOfBirth}) async {
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
        title: const Text('Tandiza Sign Up'),
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
                    style: const TextStyle(
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
                    child: const Text('Cancel',
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
        onStepContinue: () async {
          final isLastStep =
              currentStep == getSteps(currentStep, context).length - 1;

          if (isLastStep && _isChecked) {
            //TODO register the user and navigate to the dashboard
           nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
           signInWithPhone(
               phoneNumber: phoneNumber,
               context:context,
                firstName: _firstNameController.text,
                surname: _lastNameController.text,
                nrcNumber: nrcnumber,
                dateOfBirth: _dateOfBirthController.text);


          } else if(_formKeyIdentity.currentState!.validate() && currentStep == 0){
            nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
            final tandiza = await getClientData(nrcnumber);
            if(tandiza?.result == 'Found'){

              final clientFinancialData = await getClientFinancialData(tandiza?.clientId);
              if(!context.mounted){
                return;
              }
              signInWithPhone(
                  phoneNumber: phoneNumber,
                  context:context,
                  tandizaClientFinancials: clientFinancialData,
                  clientId: tandiza?.clientId,
                  firstName: tandiza?.firstName,
                  surname: tandiza?.surname,
                  result: tandiza?.result,
                  nrcNumber: tandiza?.nrcNumber,
                  dateOfBirth: tandiza?.dateOfBirth);
            }else{
              setState(() {
                currentStep = currentStep + 1;
              });
            }
              }
          else if(_formKeyAccount.currentState!.validate() && currentStep == 1){
                setState(() {
                  currentStep = currentStep + 1;
                });
              } else if(isLastStep && !_isChecked){
            const snackBar = SnackBar(
              content: Text('Confirm Tandiza Terms & Conditions!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
          title: const Text('Identity'),
          content: Form(
            key: _formKeyIdentity,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                const Text('NRC Number', style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        focusNode: focusNodeNrc1,
                        controller: _nrcNumberController1,
                        textInputAction: TextInputAction.next,
                        maxLength: 6,
                        validator: _validation.validateNrc1,
                        onChanged: (value) {
                          if(value.length == 6){
                            FocusScope.of(context).requestFocus(focusNodeNrc2);
                          }
                        },
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
                        focusNode: focusNodeNrc2,
                        validator: _validation.validateNrc2,
                        onChanged: (value) {
                          if(value.length == 2){
                            FocusScope.of(context).requestFocus(focusNodeNrc3);
                          }
                        },
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
                        focusNode: focusNodeNrc3,
                        controller: _nrcNumberController3,
                        maxLength: 1,
                        validator: _validation.validateNrc3,
                        onChanged: (value) {
                          if(value.length == 1){
                            FocusScope.of(context).requestFocus(focusNodePhone);
                          }
                        },
                        textCapitalization: TextCapitalization.words,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        cursorColor: kPrimaryColour,
                        textInputAction: TextInputAction.done,
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
                  textInputAction: TextInputAction.done,
                  focusNode: focusNodePhone,
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
              ],
            ),
          )),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Account'),
          content: Form(
            key: _formKeyAccount,
            child: Column(
              children: [
                DropdownButtonFormField(
                  value: title,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      title = value.toString();
                      print(title);
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Title',
                      labelText: 'Title',
                      prefixIcon: Icon(
                        Icons.perm_identity,
                        color: Theme.of(context).primaryColorDark,
                      )), items: titles,
                ),
                const SizedBox(height: 15,),
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
                      labelText: 'First Name',
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
                      labelText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  value: gender,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      print(gender);
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Gender',
                      labelText: 'Gender',
                      prefixIcon: Icon(
                        gender.contains('Male') ? Icons.male : Icons.female,
                        color: Theme.of(context).primaryColorDark,
                      )), items: genders,
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: _dateOfBirthController,
                  validator: null,
                  //_validateName,
                  onChanged: (value) {},
                  onTap: () async {
                    final dateSelected = await pickDate();

                    if(dateSelected == null) return;

                    setState(() {
                      _dateOfBirthController.text = DateFormat('yyyy-MM-dd')
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
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  value: maritalStatus,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      maritalStatus = value.toString();
                      print(maritalStatus);
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Marital Status',
                      labelText: 'Marital Status',
                      prefixIcon: Icon(
                        Icons.diamond,
                        color: Theme.of(context).primaryColorDark,
                      )), items: marital,
                ),
              ],
            ),
          )),
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text('Address'),
          content: Form(
            key: _formKeyTandiza,
            child: Column(
              children: [
                TextFormField(
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Plot No / House No',
                      labelText: 'Plot No / House No',
                      prefixIcon: Icon(
                        Icons.business,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Street Address',
                      labelText: 'Street Address',
                      prefixIcon: Icon(
                        Icons.web_asset_outlined,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(height: 25,),
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return list.where((String option) {
                      return option
                          .contains(textEditingValue.text);
                    });
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Enter city';
                        } else {
                          return null;
                        }
                      },
                      controller: textEditingController,
                      focusNode: focusNode,
                      onFieldSubmitted: (str) => onFieldSubmitted(),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'City',
                          labelText: 'City',
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Theme.of(context).primaryColorDark,
                          )),
                    );
                  },
                  onSelected: (String selection) {
                    _cityController.text = selection;
                    debugPrint('You just selected $selection');
                  },
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Checkbox(value: _isResident, onChanged: (value){
                      setState(() {
                        _isResident = value!;
                      });
                    }),
                    const SizedBox(width: 10,),
                    const Expanded(child: Text('Resident', style: TextStyle(fontSize: 18),))
                  ],
                ),
                const SizedBox(height: 25,),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    const SizedBox(width: 10,),
                    const Expanded(child: Text('I agree to Tandiza Finance Terms & Conditions', style: TextStyle(fontSize: 18),))

                  ],
                ),
              ],
            ),
          )),
    ];
  }
}
