import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({super.key});

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {
  int _currentStep = 0;
  late String phoneNumber;
  late String phoneIsoCode;
  DateTime firstDate = DateTime(1940, 01, 01);
  DateTime lastDate = DateTime(2004, 1, 1);
  DateTime initialDate = DateTime(1986, 1, 1);

  final Validation _validation = Validation();
  final GlobalKey<FormState> _formKeyProfile1 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyProfile2 = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyEmployment = GlobalKey<FormState>();
  //personal details 1 controllers
  final TextEditingController _firstName1Controller = TextEditingController();
  final TextEditingController _lastName1Controller = TextEditingController();
  final TextEditingController _nrcNumber1Controller1 = TextEditingController();
  final TextEditingController _nrcNumber1Controller2 = TextEditingController();
  final TextEditingController _nrcNumber1Controller3 = TextEditingController();
  final TextEditingController _plotNumber1Controller = TextEditingController();
  final TextEditingController _city1Controller = TextEditingController();
  final TextEditingController _location1Controller = TextEditingController();

  //personal details 2 controllers
  final TextEditingController _firstName2Controller = TextEditingController();
  final TextEditingController _lastName2Controller = TextEditingController();
 final TextEditingController _email2Controller = TextEditingController();
  final TextEditingController _plotNumber2Controller = TextEditingController();
  final TextEditingController _city2Controller = TextEditingController();
  final TextEditingController _location2Controller = TextEditingController();


  final TextEditingController _dateOfBirthController = TextEditingController();
  
  Future<DateTime?> pickDate() async {
    return showDatePicker(context: context,
        initialDate: initialDate,
        firstDate: firstDate,
        lastDate: lastDate);
  }

  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    setState(() {
      phoneNumber = internationalizedPhoneNumber;
      phoneIsoCode = isoCode;
    });
  }

 /*  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstName1Controller.dispose();
    _lastName1Controller.dispose();   
    _nrcNumber1Controller1.dispose();
    _nrcNumber1Controller2.dispose();
    _nrcNumber1Controller3.dispose();
    _city1Controller.dispose();
    _plotNumber1Controller.dispose();
    _location2Controller.dispose();


    _firstName2Controller.dispose();
    _firstName2Controller.dispose();
    _location2Controller.dispose();
    _plotNumber2Controller.dispose();
    _email2Controller.dispose();
    _city2Controller.dispose();
  }
 */
final contractList = ["permanent", "TemporalContract","PartTime"];
String _selectedContract = "permanent";

final contractPeriodList = ["6 Months", "8 Months", "1 Year", "2 Year", "3 Year", "4 Year","5 years"];
String _selectedPeriod = "6 Months";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SafeArea(
         child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
           child: Column(
            children: [
              Expanded(
                child: Stepper(
                  currentStep: _currentStep,
                  type: StepperType.horizontal,
                  physics: const ScrollPhysics(),
                  controlsBuilder: (context, onStepContinue){
                    return Row(
                       children: [
                        ElevatedButton(
                          onPressed: (() {
                           if (_currentStep == 2) {
                                  
                                  Navigator.pop(context);

                                } else if(_currentStep == 0 && _formKeyProfile1.currentState!.validate()) {
                                  
                                  setState(() {
                                    _currentStep += 1;
                                  });
                                }else if(_currentStep == 1 && _formKeyProfile2.currentState!.validate()){
                                  setState(() {
                                    _currentStep += 1;
                                  });
                                }
                        }),
                         child: Text(_currentStep != 2 ? 'Continue' : 'Submit',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                             color: kWhiteColour,
                            fontSize: 15,
                        fontWeight: FontWeight.w500),
                        )
                         ),
                         const SizedBox(width: 15,),
                        ElevatedButton(onPressed: (() {
                          if(_currentStep == 0){
                               Navigator.pop(context);
                          }else {
                               setState(() {
                                _currentStep -= 1;
                             });
                          }
                           
                        }),
                         child: Text(_currentStep != 0 ? 'Back' : 'Back',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                             color: kWhiteColour,
                            fontSize: 15,
                        fontWeight: FontWeight.w500
                        ),
                        )
                         ),

                       ],
                    );
                  },
                  onStepTapped: ((int index) {
                    setState(() {
                      _currentStep = index;
                    });
                  }),
                  

                  onStepCancel: (){
                    if(_currentStep != 0){
                    //  Navigator.pop(context);
                      setState(() {
                        _currentStep -= 1;
                      });
                    }
                  },

                  

       
                 /*  onStepContinue: () {
                      if(_currentStep != 2){
                        setState(() {
                          _currentStep += 1;
                        });
                      }else {
                          Navigator.pop(context);
                      }
                     
                  
                      
                  }, */
                  
                  steps: [
                    Step(title: Text('Profile 1'),
                     content: Form(
                      key: _formKeyProfile1,
                       child: Column(
                         children: [
                          TextFormField(
                                       controller: _firstName1Controller,
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
                                       controller: _lastName1Controller,
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
                                     Row(
                                       children: [
                                         Expanded(
                        flex: 3,
                        child: TextFormField(
                          controller: _nrcNumber1Controller1,
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
                          controller: _nrcNumber1Controller2,
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
                          controller: _nrcNumber1Controller3,
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
                                     IntlPhoneField(
                                       onChanged: (phone) {
                                         setState(() {
                        phoneNumber = phone.completeNumber;
                                         });
                                       },
                                       initialCountryCode: 'ZM',
                                       decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter Phone Number',
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: kSecondaryColour,
                        )),
                                     ),
                                     Row(
                                       children: [
                                         Expanded(
                        flex: 1,
                        child: TextFormField(
                        controller: _plotNumber1Controller,
                          textInputAction: TextInputAction.next,
                          maxLength: 8,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Plot #',
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
                          controller:  _location1Controller,
                          maxLength: 50,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Location'
                          ),
                        ),
                                         ),
                                       ],
                                     ),
                                     Row(
                                       children: [
                                         Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _city1Controller,
                          textInputAction: TextInputAction.next,
                          maxLength: 100,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'City',
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Theme.of(context).primaryColorDark,
                              )),
                        ),
                                         ),
                                         
                                       ],
                                     ),
                         ],
                                         ),
                     ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text('Profile 2'), content: Form(
                      key: _formKeyProfile2,
                      child: Column(
                        children: [
                          const Text('Next Of Kin',
                          style: TextStyle(
                            fontSize: 12
                          ),
                          ),
                          SizedBox(height: 10,),
                         TextFormField(
                                      controller: _firstName2Controller,
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
                                      controller: _lastName2Controller,
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
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: kSecondaryColour,
                        )),
                                    ),
                                    TextFormField(
                                      controller: _email2Controller,
                                      validator: _validation.validateEmail,
                                      //_validateName,
                                      onChanged: (value) {},
                                      textCapitalization: TextCapitalization.words,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.emailAddress,
                                      cursorColor: kPrimaryColour,
                                      decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Email',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColorDark,
                        )),
                                    ),
                                     const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _plotNumber2Controller,
                          textInputAction: TextInputAction.next,
                          maxLength: 8,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Plot #',
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
                          controller: _location2Controller,
                          maxLength: 50,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.streetAddress,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                            hintText: 'Location'
                          ),
                        ),
                      ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                      Expanded(
                        flex: 1,
                        child: TextFormField(
                          controller: _city2Controller,
                          textInputAction: TextInputAction.next,
                          maxLength: 100,
                          validator: _validation.validateName,
                          //_validateName,
                          onChanged: (value) {},
                          textCapitalization: TextCapitalization.words,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          cursorColor: kPrimaryColour,
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'City',
                              prefixIcon: Icon(
                                Icons.location_city,
                                color: Theme.of(context).primaryColorDark,
                              )),
                        ),
                      ),
                      
                                      ],
                                    ),
                        ],
                      ),
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text('Employment Details'), content: Column(
                      children: [
                        TextFormField(
                  //controller: _lastName2Controller,
                  //validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Employer',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Theme.of(context).primaryColorDark,
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
                  keyboardType: TextInputType.text,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Date of Employment',
                      prefixIcon: Icon(
                        Icons.calendar_month_sharp,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Contract Type',
                      prefixIcon: Icon(
                        Icons.work_outline,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedContract,
                  items: contractList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Center(child: Text(value))
                    );
                }).toList(), 
                onChanged: (String? newValue){
                      setState(() {
                        _selectedContract = newValue!;
                      });
                }),
                  const SizedBox(
                              height: 15,
                            ),
                     DropdownButtonFormField(
                                isExpanded: true,
                                
                                decoration: kTextFieldDecoration.copyWith(
                                    labelText: 'Contract Duration',
                                    prefixIcon: Icon(
                                      Icons.lock_clock,
                                      color: Theme.of(context).primaryColorDark,
                                    )),
                                value: _selectedPeriod,
                                items: contractPeriodList
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Center(child: Text(value)));
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedPeriod = newValue!;
                                  });
                                }),
                      const SizedBox(
                              height: 15,
                            ),
                                TextFormField(
                  //controller: _lastName2Controller,
                  //validator: _validation.validateName,
                  //_validateName,
                  onChanged: (value) {},
                  textCapitalization: TextCapitalization.words,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Current Monthly earnings',
                      prefixIcon: Icon(
                        Icons.money,
                        color: Theme.of(context).primaryColorDark,
                      )),
                ),
                const SizedBox(
                              height: 15,
                            ),
                      ],
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                    )
                  ]
                  ),
              ),
            ],
           ),
         ),
       ),
    );
    }
}