import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../datalayer/datasources/firebase_database_api.dart';
import '../../datalayer/models/firebase_user_model.dart';
import '../../utilities/settings.dart';
import '../state-management/service_provider.dart';

class EmploymentScreen extends StatefulWidget {
  const EmploymentScreen({Key? key}) : super(key: key);

  static const String id = 'employment_screen';

  @override
  State<EmploymentScreen> createState() => _EmploymentScreenState();
}

class _EmploymentScreenState extends State<EmploymentScreen> {
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

  String contractTypeDropDown = 'Contractor';

  String contractDurationDropDown = '1 Year';

  DateTime firstDate = DateTime(1940, 01, 01);

  DateTime lastDate = DateTime(2004, 1, 1);

  DateTime initialDate = DateTime(1986, 1, 1);

  final TextEditingController _employerController = TextEditingController();

  final TextEditingController _employmentDateController = TextEditingController();

  final TextEditingController _contractTypeController = TextEditingController();

  final TextEditingController _contractDurationController = TextEditingController();

  final TextEditingController _monthlyEarningsController = TextEditingController();
  double monthlyEarnings = 10000;

  late Future<FirebaseUserModel> getUsers;
  late FirebaseUserModel userModel;

  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    getUsers = FirebaseDatabaseService(uid: uid).getUserData();
    userModel = await getUsers;
  }

  Future<DateTime?> pickDate() async {
    return showDatePicker(context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
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
      appBar: AppBar(title: const Text('Employment Details'),
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
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Enter Employer';
                                    } else {
                                      return null;
                                    }
                                  },
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
                              controller: _employmentDateController,
                              validator: null,
                              //_validateName,
                              textCapitalization: TextCapitalization.words,
                              textAlign: TextAlign.center,
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
                            const SizedBox(height: 45,),
                            Text('Monthly Earnings: ZMW ${monthlyEarnings.round().toString()}'),
                            const SizedBox(height: 45,),
                            SliderTheme(
                              data: const SliderThemeData(
                                  valueIndicatorColor: kSecondaryColour,
                                  valueIndicatorShape: PaddleSliderValueIndicatorShape()
                              ),
                              child: Slider.adaptive(
                                min: 5000,
                                max: 50000,
                                divisions: 50,
                                label: '${monthlyEarnings.round().toString()}',
                                value: monthlyEarnings, onChanged: (double value) {
                                setState(() {
                                  monthlyEarnings = value;
                                });
                              },),
                            ),
                            const SizedBox(height: 25,),
                            const SizedBox(
                              height: 25,
                            ),
                            DropdownButtonFormField(
                              value: contractTypeDropDown,
                              //_validateName,
                              onChanged: (value) {
                                setState(() {
                                  contractTypeDropDown = value.toString();
                                  print(contractTypeDropDown);
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
                              visible: contractTypeDropDown.contains('Contractor'),
                              child: DropdownButtonFormField(
                                //_validateName,
                                value: contractDurationDropDown,
                                onChanged: (value) {
                                  setState(() {
                                    contractDurationDropDown = value.toString();
                                    print(contractDurationDropDown);
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
                          letterSpacing:0.8,
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
