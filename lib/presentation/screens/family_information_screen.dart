import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../datalayer/datasources/firebase_database_api.dart';
import '../../datalayer/models/firebase_user_model.dart';
import '../../utilities/settings.dart';
import '../state-management/service_provider.dart';

class FamilyInformationScreen extends StatefulWidget {
  const FamilyInformationScreen({Key? key}) : super(key: key);

  static const String id = 'family_information_screen';

  @override
  State<FamilyInformationScreen> createState() => _FamilyInformationScreenState();
}

class _FamilyInformationScreenState extends State<FamilyInformationScreen> {
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

  final TextEditingController _plotNumberController = TextEditingController();

  final TextEditingController _cityController = TextEditingController();

  final TextEditingController _provinceContoller = TextEditingController();

  final TextEditingController _streetController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  late Future<FirebaseUserModel> getUsers;
  late FirebaseUserModel userModel;

  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    getUsers = FirebaseDatabaseService(uid: uid).getUserData();
    userModel = await getUsers;


  }

  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Address'),
        centerTitle: true,),
      body: FutureBuilder<FirebaseUserModel>(
          future: getUsers,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15, top: 30),
                      child: Form(
                        key: null,
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
                            const SizedBox(
                              height: 15,
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
                                  hintText: 'Enter Phone Number',
                                  labelText: 'Phone Number',
                                  prefixIcon: const Icon(
                                    Icons.phone,
                                    color: kSecondaryColour,
                                  )),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _plotNumberController,
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
                              controller: _streetController,
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
                            Autocomplete<String>(
                              optionsBuilder: (TextEditingValue textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return zambiaProvinces.where((String option) {
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
                                      return 'Enter province';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onFieldSubmitted: (str) => onFieldSubmitted(),
                                  decoration: kTextFieldDecoration.copyWith(
                                      hintText: 'Province',
                                      labelText: 'Province',
                                      prefixIcon: Icon(
                                        Icons.maps_home_work_sharp,
                                        color: Theme.of(context).primaryColorDark,
                                      )),
                                );
                              },
                              onSelected: (String selection) {
                                _provinceContoller.text = selection;
                                debugPrint('You just selected $selection');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50)
                          ),
                          onPressed: () {

                          }, child: const Text('Update', style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColour),)),
                    )
                  ],
                ),
              );
            }
            return const Center(child: CircularProgressIndicator(),);
          }
      ),
    );
  }
}
