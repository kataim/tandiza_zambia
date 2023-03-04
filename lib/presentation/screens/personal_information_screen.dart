import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

import '../../datalayer/datasources/firebase_database_api.dart';
import '../../datalayer/models/firebase_user_model.dart';
import '../../utilities/settings.dart';
import '../state-management/service_provider.dart';

class PersonalInformationScreen extends StatefulWidget {
  const PersonalInformationScreen({Key? key}) : super(key: key);

  static const String id = 'personal_information_screen';

  @override
  State<PersonalInformationScreen> createState() => _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
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

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _nrcNumberController1 = TextEditingController();

  final TextEditingController _nrcNumberController2 = TextEditingController();

  final TextEditingController _nrcNumberController3 = TextEditingController();

  final TextEditingController _dateOfBirthController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  String title = 'Mr';
  String gender = 'Male';
  String maritalStatus = 'Married';

  late Future<FirebaseUserModel> getUsers;
  late FirebaseUserModel userModel;

  Future<DateTime?> pickDate() async {
    return showDatePicker(context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
  }

  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    getUsers = FirebaseDatabaseService(uid: uid).getUserData();
    userModel = await getUsers;

    _firstNameController.text = userModel.firstName ?? '';
    _dateOfBirthController.text = userModel.dateOfBirth ?? '';
    _lastNameController.text = userModel.surname ?? '';
    _nrcNumberController1.text = userModel.nrcNumber?.substring(0, 6) ?? '';
    _nrcNumberController2.text = userModel.nrcNumber?.substring(7, 9) ?? '';
    _nrcNumberController3.text = userModel.nrcNumber?.substring(10) ?? '';
    _phoneController.text = userModel.phoneNumber?.substring(4) ?? '';
  }

  @override
  void initState() {
    // TODO: implement initState
    _serviceProvider = Provider.of<ServiceProvider>(context, listen: false);
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Personal Information'),
      centerTitle: true,),
      body: FutureBuilder<FirebaseUserModel>(
        future: getUsers,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 30, right: 10),
                child: Column(
                  children: [
                    Form(
                      key: null,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            enabled: false,
                            controller: _firstNameController,
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
                            enabled: false,
                            controller: _lastNameController,
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
                          const SizedBox(height: 15,),
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  controller: _nrcNumberController1,
                                  textInputAction: TextInputAction.next,
                                  maxLength: 6,
                                  validator: null,
                                  onChanged: (value) {},
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

                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  controller: _nrcNumberController2,
                                  maxLength: 2,
                                  validator: _validation.validateNrc2,
                                  onChanged: (value) {},
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

                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  controller: _nrcNumberController3,
                                  maxLength: 1,
                                  validator: _validation.validateNrc3,
                                  onChanged: (value) {},
                                  textCapitalization: TextCapitalization.words,
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
                          const SizedBox(height: 15,),
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
                          const SizedBox(height: 15,),
                          TextFormField(

                            enabled: false,
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
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: ElevatedButton(
                              onPressed: () {
                                final FirebaseUserModel userModel = FirebaseUserModel(
                                    phoneNumber: _phoneController.text,
                                    firstName: _firstNameController.text,
                                    surname: _lastNameController.text,
                                    nrcNumber: '${_nrcNumberController1.text}/${_nrcNumberController2.text}/${_nrcNumberController3.text}',
                                    dateOfBirth: _dateOfBirthController.text
                                );
                                FirebaseDatabaseService(uid: FirebaseAuth.instance.currentUser?.uid).
                                updateUserData({
                                  'phoneNumber' : phoneNumber
                                });
                                const snackBar = SnackBar(
                                  content: Text('Updated phone number'),
                                );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                 Navigator.pop(context);

                              }, child: const Text('Update', style: TextStyle(fontSize: 20,

                              color: kWhiteColour),)),
                        ),
                        Expanded(
                          child: TextButton(onPressed: (){
                            Navigator.pop(context);
                          }, child: const Text('Cancel', style: TextStyle(fontSize: 20,))),
                        )
                      ],
                    )
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
