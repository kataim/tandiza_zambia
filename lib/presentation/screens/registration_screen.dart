import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_created_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../datalayer/models/tandiza_address_model.dart';
import '../../datalayer/models/tandiza_contacts_model.dart';
import '../state-management/service_provider.dart';
import 'otp_screen.dart';



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

  bool _isOwnerOfHouse = false;

  late String nrcnumber;

  final Validation _validation = Validation();

  final focusRegNodePhone = FocusNode();

  final focusNodeNrc1 = FocusNode();

  final focusNodeNrc2 = FocusNode();

  final focusNodeNrc3 = FocusNode();

  final focusNodeFirstName = FocusNode();

  final focusNodeSurname = FocusNode();

  final focusNodeDateOfBirth = FocusNode();

  final focusNodeMonthsResided = FocusNode();

  final focusNodeSupervisorPhoneNumber = FocusNode();

  final focusNodeNokPhoneNumber = FocusNode();

  final GlobalKey<FormState> _formKeyIdentity = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyAddress = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyEmployment = GlobalKey<FormState>();

  final GlobalKey<FormState> _formKeyNextOfKin = GlobalKey<FormState>();

  late String phoneNumber;

  late String phoneSupervisor;

  late ServiceProvider _serviceProvider;

  late String phoneIsoCode;

  String title = 'Mr';

  String addressType = 'Home';

  String gender = 'Male';

  String maritalStatus = 'Married';

  bool visible = false;

  String confirmedNumber = '';

  DateTime firstDate = DateTime(1940, 01, 01);

  DateTime lastDate = DateTime(2004, 1, 1);

  DateTime initialDate = DateTime(1986, 1, 1);

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _phoneNumberController = TextEditingController();

  final TextEditingController _nrcNumberController1 = TextEditingController();

  final TextEditingController _nrcNumberController2 = TextEditingController();

  final TextEditingController _nrcNumberController3 = TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _phoneProviderController = TextEditingController();

  final TextEditingController _employerController = TextEditingController();

  final TextEditingController _employmentDateController = TextEditingController();

  final TextEditingController _occupationController = TextEditingController();

  final TextEditingController _employeeNumberController = TextEditingController();

  final TextEditingController _phoneSupervisorController = TextEditingController();

  final TextEditingController _supervisorNameController = TextEditingController();

  String contractTypeDropDown = 'Contract';

  String phoneProviderType = '';

  String relationshipType = 'Wife';

  String contractDurationDropDown = '1 Year';

  late String phoneKinNumber;

  bool _isLoading = false;

  DateTime firstKinDate = DateTime(1940, 01, 01);

  DateTime lastKinDate = DateTime(2004, 1, 1);

  DateTime initialKinDate = DateTime(1986, 1, 1);

  final TextEditingController _firstNameKinController = TextEditingController();

  final TextEditingController _lastNameKinController = TextEditingController();

  final TextEditingController _phoneKinController = TextEditingController();

  final TextEditingController _plotNumberController = TextEditingController();

  final TextEditingController _streetAddressController = TextEditingController();

  final TextEditingController _monthsResidedController = TextEditingController();

  final TextEditingController _postCodeController = TextEditingController(text: '10101');




  @override
  void initState() {
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    super.initState();
  }

  @override
  void dispose(){
    focusRegNodePhone.dispose();

    focusNodeNrc1.dispose();

    focusNodeNrc2.dispose();

    focusNodeNrc3.dispose();

    focusNodeFirstName.dispose();

    focusNodeSurname.dispose();
    super.dispose();


  }

  Future<TandizaClient?> getClientData (String id) async {
    return _serviceProvider.getClientData(id);
  }

  Future<TandizaClientFinancialsModel?> getClientFinancialData(int ? clientId) async {
    return _serviceProvider.getClientFinancials(clientId);
  }

  Future<TandizaClientCreatedModel?> createClientData({
    required String nrcnumber, required String firstName, required String phoneNumber,
    required String surname, required String dateOfBirth, required String supervisorName,
    required String title, required String gender, required String addressType,
    required String nokFullNames, required String nokRelationship, required String nokPhoneNumber, required String  phoneProvider,
    required String maritalStatus, required String postCode,
    required String plotNumber,
    required String streetAddress, required String monthsResided,
    required String city, required bool isOwned, required bool isResident, required String  employerName,
    required String employmentType,
    required String  occupation, required String  contactNumber,
    required String employeeNumber, required String  engagementDate,}) async {
    return _serviceProvider.createClient(
        nrcnumber: nrcnumber, firstName: firstName,
        surname: surname, dateOfBirth: dateOfBirth,
        title: title, gender: gender, addressType: addressType,
        nokFullNames: nokFullNames, nokRelationship: nokRelationship,
        nokPhoneNumber: nokPhoneNumber, maritalStatus: maritalStatus,
        employerName : employerName, employmentType : employmentType,
        occupation : occupation, contactNumber : contactNumber ,
        employeeNumber : employeeNumber,
        engagementDate : engagementDate,
      phoneProvider: phoneProvider, plotNumber: plotNumber, streetAddress: streetAddress,
      monthsResided: monthsResided, city: city, isOwned: isOwned ,
      isResident: isResident, phoneNumber: phoneNumber, supervisorName: supervisorName, postCode: postCode,

    );
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

  void onPhoneNumberSupervisorChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneSupervisor = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
  }

  void onphoneKinNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneKinNumber = internationalizedPhoneNumber;
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
                  onPressed: _isLoading ? null : controlsDetails.onStepContinue,
                  child: _isLoading ? const Center(child: CircularProgressIndicator()) : Text(
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

          if (isLastStep && _isChecked && _formKeyAccount.currentState!.validate() &&
              _formKeyIdentity.currentState!.validate() &&
          _formKeyAddress.currentState!.validate() &&
          _formKeyEmployment.currentState!.validate() &&
          _formKeyNextOfKin.currentState!.validate()) {
            //TODO register the user and navigate to the dashboard
           nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
           setState(() {
             _isLoading = true;
           });
          final tandizaClient = await createClientData(
              nrcnumber: nrcnumber, firstName: _firstNameController.text,
              surname: _lastNameController.text, dateOfBirth: _dateOfBirthController.text,
              title: title, gender: gender, addressType: addressType,
              nokFullNames: '${_firstNameKinController.text} ${_lastNameKinController.text} ', nokRelationship: relationshipType,
              nokPhoneNumber: phoneKinNumber, maritalStatus: maritalStatus,
              employerName : _employerController.text, employmentType : contractTypeDropDown,
              occupation : _occupationController.text, contactNumber : phoneSupervisor,
              employeeNumber : _employeeNumberController.text, engagementDate : _employmentDateController.text, 
              phoneProvider: _phoneProviderController.text, plotNumber: _plotNumberController.text,
              streetAddress: _streetAddressController.text, monthsResided: _monthsResidedController.text, 
            city: _cityController.text, isOwned: _isOwnerOfHouse, isResident: _isResident, phoneNumber: phoneNumber,
            supervisorName: _supervisorNameController.text, postCode: _postCodeController.text,
          );
           setState(() {
             _isLoading = false;
           });

           if(tandizaClient?.clientId != null){
             if(!mounted)
               return;
             Navigator.of(context).push(MaterialPageRoute(builder: (context){
               return OtpScreen(
                   phoneNumber: phoneNumber,
                   nrcNumber : nrcnumber
               );
             }));
           }else{
             Future.delayed(Duration.zero, (){
               showDialog(
                   context: context,
                   builder: (BuildContext context) {
                     return AlertDialog(
                       title: const Text('User already exists'),
                       content: const Text('Please register your account to access Tandiza Finance services'),
                       actions: [
                         TextButton(onPressed: (){
                           Navigator.pushNamedAndRemoveUntil(context, WelcomeScreen.id, (route) => false);
                         }, child: const Text('Dismiss'))
                       ],
                     );
                   });
             });
           }


          } else if(currentStep == 0 && _formKeyIdentity.currentState!.validate()){
            nrcnumber = '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}';
            setState(() {
              _isLoading = true;
            });
            final tandiza = await getClientData(nrcnumber);
            setState(() {
              _isLoading = false;
            });

            if(tandiza?.result == 'Found'){
              if(!mounted){
                return;
              }

              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return OtpScreen(
                    phoneNumber: phoneNumber,
                    nrcNumber : nrcnumber
                );
              }));
            }else{
              setState(() {
                currentStep = currentStep + 1;
              });
            }
              }else if(isLastStep && !_isChecked){
            const snackBar = SnackBar(
              content: Text('Confirm Tandiza Terms & Conditions!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }else if(isLastStep && (!_formKeyAccount.currentState!.validate() ||
              !_formKeyIdentity.currentState!.validate() ||
              !_formKeyAddress.currentState!.validate() ||
              !_formKeyEmployment.currentState!.validate() ||
              !_formKeyNextOfKin.currentState!.validate())){
            const snackBarValidate = SnackBar(
              content: Text('Please ensure that all fields are complete!'),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBarValidate);
          }else if(currentStep == 1){
            if(_formKeyAccount.currentState!.validate()){
              setState(() {
                currentStep = currentStep + 1;
              });
            }


          }else if(currentStep == 2){
            if(_formKeyAddress.currentState!.validate()){
              setState(() {
                currentStep = currentStep + 1;
              });
            }

          }else if(currentStep == 3){
            if(_formKeyEmployment.currentState!.validate()){
              setState(() {
                currentStep = currentStep + 1;
              });
            }
          }
        },
        currentStep: currentStep,
        elevation: 0,
        type: StepperType.vertical,
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
                            FocusScope.of(context).requestFocus(focusRegNodePhone);
                          }
                        },
                        textCapitalization: TextCapitalization.words,
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
                const Text('Phone Provider', style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextFormField(
                  enabled: false,
                  controller: _phoneProviderController,
                  validator: null,
                  //_validateName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Phone Provider',
                      labelText: 'Phone Provider',
                      prefixIcon: Icon(Icons.phone,
                        color: Theme.of(context).primaryColorDark,)),
                ),
                const SizedBox(height: 10,),
                const Text('Phone Number', style: TextStyle(fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                IntlPhoneField(
                  controller: _phoneNumberController,
                  textInputAction: TextInputAction.done,
                  focusNode: focusRegNodePhone,
                  onChanged: (phone) {
                    setState(() {
                      phoneNumber = phone.completeNumber;
                    });
                    if(phoneNumber.length >= 6){
                      print(phoneNumber.length);
                      if(phoneNumber.substring(5,6).contains('7')){
                        _phoneProviderController.text = 'Airtel Mobile';
                      }else if(phoneNumber.substring(5,6).contains('6')){
                        _phoneProviderController.text = 'MTN Mobile';
                      }else if(phoneNumber.substring(5,6).contains('5')){
                        _phoneProviderController.text = 'Zamtel Mobile';
                      }
                    }

                    if(phoneNumber.length == 13){
                      focusRegNodePhone.unfocus();
                    }
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
                const SizedBox(height: 10,),
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
                  focusNode: focusNodeFirstName,
                  controller: _firstNameController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {
                     },
                  textCapitalization: TextCapitalization.words,
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
                  focusNode: focusNodeSurname,
                  controller: _lastNameController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {
                    },
                  textCapitalization: TextCapitalization.words,
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
                  focusNode: focusNodeDateOfBirth,
                  controller: _dateOfBirthController,
                  validator: _validation.validateDob,
                  //_validateName,
                  onChanged: (value) {
                    focusNodeDateOfBirth.unfocus();
                  },
                  onTap: () async {
                    final dateSelected = await pickDate();

                    if(dateSelected == null) return;

                    setState(() {
                      _dateOfBirthController.text = DateFormat('yyyy-MM-dd')
                          .format(dateSelected);
                      focusNodeDateOfBirth.unfocus();
                    });

                  },
                  textCapitalization: TextCapitalization.words,
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
            key: _formKeyAddress,
            child: Column(
              children: [
                DropdownButtonFormField(
                  value: addressType,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      addressType = value.toString();
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Address Type',
                      labelText: 'Address Type',
                      prefixIcon: Icon(
                        Icons.home,
                        color: Theme.of(context).primaryColorDark,
                      )), items: addressTypes,
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _plotNumberController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
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
                  height: 20,
                ),
                TextFormField(
                  controller: _streetAddressController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
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
                const SizedBox(height: 20,),
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
                      keyboardType: TextInputType.name,
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
                const SizedBox(height: 20,),
                TextFormField(
                  focusNode: focusNodeMonthsResided,
                  controller: _monthsResidedController,
                  validator: _validation.validateDob,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Months Resided',
                      labelText: 'Months Resided',
                      prefixIcon: Icon(
                        Icons.history,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  focusNode: null,
                  controller: _postCodeController,
                  validator: _validation.validateDob,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Post Code',
                      labelText: 'Post Code',
                      prefixIcon: Icon(
                        Icons.history,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Checkbox(value: _isOwnerOfHouse, onChanged: (value){
                      setState(() {
                        _isOwnerOfHouse = value!;
                      });
                      focusNodeMonthsResided.unfocus();
                    }),
                    const SizedBox(width: 10,),
                    const Expanded(child: Text('Owns The House', style: TextStyle(fontSize: 18),))
                  ],
                ),
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


              ],
            ),
          )),
      Step(title: const Text('Employment'),
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          content: Form(
            key: _formKeyEmployment,
            child: Column(
              children: [
                Autocomplete<String>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    if (textEditingValue.text == '') {
                      return const Iterable<String>.empty();
                    }
                    return employers.where((String option) {
                      return option
                          .contains(textEditingValue.text);
                    });
                  },
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController textEditingController,
                      FocusNode focusNode,
                      VoidCallback onFieldSubmitted) {
                    return TextFormField(
                      textCapitalization: TextCapitalization.words,
                      validator: _validation.validateIsEmpty,
                      controller: textEditingController,
                      focusNode: focusNode,
                      keyboardType: TextInputType.name,
                      onFieldSubmitted: (str) => onFieldSubmitted(),
                      decoration: kTextFieldDecoration.copyWith(
                          hintText: 'Employer',
                          labelText: 'Employer',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Theme.of(context).primaryColorDark,
                          )),
                    );
                  },
                  onSelected: (String selection) {
                    _employerController.text = selection;
                    debugPrint('You just selected $selection');
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  onTap: () async{
                    final dateSelected = await pickDate();

                    if(dateSelected == null) return;

                    setState(() {
                      _employmentDateController.text = DateFormat('yyyy-MM-dd')
                          .format(dateSelected);
                    });
                  },
                  controller: _employmentDateController,
                  validator: _validation.validateIsEmpty,
                  //_validateName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Employment start date',
                      labelText: 'Employment start date',
                      suffixIcon: IconButton(
                        color: Theme.of(context).primaryColorDark, onPressed: () async {
                        final dateSelected = await pickDate();

                        if(dateSelected == null) return;

                        setState(() {
                          _employmentDateController.text = DateFormat('yyyy-MM-dd')
                              .format(dateSelected);
                        });
                      },
                        icon: const Icon(Icons.calendar_month_sharp)  ,
                      )),
                ),
                const SizedBox(height: 25,),
                DropdownButtonFormField(
                  value: contractTypeDropDown,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      contractTypeDropDown = value.toString();
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Contract Type',
                      labelText: 'Contract Type',
                      prefixIcon: Icon(
                        Icons.history,
                        color: Theme.of(context).primaryColorDark,
                      )), items: contractType,
                ),
                const SizedBox(height: 25,),
                Visibility(
                  visible: contractTypeDropDown.contains('Contract'),
                  child: DropdownButtonFormField(
                    //_validateName,
                    value: contractDurationDropDown,
                    onChanged: (value) {
                      setState(() {
                        contractDurationDropDown = value.toString();
                      });
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Contract Duration',
                        labelText: 'Contract Duration',
                        prefixIcon: Icon(
                          Icons.history,
                          color: Theme.of(context).primaryColorDark,
                        )), items: contractDuration,
                  ),
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  controller: _occupationController,
                  validator: _validation.validateIsEmpty,
                  //_validateName,
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Occupation',
                      labelText: 'Occupation',
                      prefixIcon: Icon(Icons.account_tree_sharp,
                        color: Theme.of(context).primaryColorDark,)),
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  controller: _employeeNumberController,
                  validator: _validation.validateIsEmpty,
                  //_validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Employee Number',
                      labelText: 'Employee Number',
                      prefixIcon: Icon(Icons.numbers,
                        color: Theme.of(context).primaryColorDark,)),
                ),
                const SizedBox(height: 25,),
                TextFormField(
                  controller: _supervisorNameController,
                  validator: _validation.validateIsEmpty,
                  //_validateName,
                  textCapitalization: TextCapitalization.words,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Supervisor Name',
                      labelText: 'Supervisor Name',
                      prefixIcon: Icon(Icons.task_alt,
                        color: Theme.of(context).primaryColorDark,)),
                ),
                const SizedBox(height: 25,),
                IntlPhoneField(
                  controller: _phoneSupervisorController,
                  textInputAction: TextInputAction.done,
                  onChanged: (phone) {

                    setState(() {
                      phoneSupervisor = phone.completeNumber;
                    });
                    if(phoneSupervisor.length == 13){
                      focusNodeSupervisorPhoneNumber.unfocus();
                    }
                  },
                  initialCountryCode: 'ZM',
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Supervisor Phone Number',
                      labelText: 'Supervisor Phone Number',
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: kSecondaryColour,
                      )),
                ),
              ],
            ),
          ),),
      Step(title: const Text('Next Of Kin'),
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          content: Form(
            key: _formKeyNextOfKin,
            child: Column(
              children: [
                TextFormField(
                  focusNode: null,
                  controller: _firstNameKinController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
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
                  controller: _lastNameKinController,
                  validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
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
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  value: relationshipType,
                  //_validateName,
                  onChanged: (value) {
                    setState(() {
                      relationshipType = value.toString();
                    });
                  },
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Relationship',
                      labelText: 'Relationship',
                      prefixIcon: Icon(
                        Icons.people,
                        color: Theme.of(context).primaryColorDark,
                      )), items: relationshipTypes,
                ),
                const SizedBox(
                  height: 15,
                ),
                IntlPhoneField(
                  controller: _phoneKinController,
                  onChanged: (phone) {
                    setState(() {
                      phoneKinNumber = phone.completeNumber;
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
          ),),
    ];
  }
}
