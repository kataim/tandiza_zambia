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
  DateTime firstDate = DateTime(1940, 01, 01);
  DateTime lastDate = DateTime(2004, 1, 1);
  DateTime initialDate = DateTime(1986, 1, 1);

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
       
                  onStepContinue: () {
                      if(_currentStep != 2){
                        setState(() {
                          _currentStep += 1;
                        });
                      }else {
                          Navigator.pop(context);
                      }
                     
                  
                      
                  },
                  
                  

                  
       
                  steps: [
                    Step(title: Text('Profile 1'), content: Column(
                       children: [
                        TextFormField(
                  controller: _firstName1Controller,
                  //validator: _validation.validateName,
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
                  //validator: _validation.validateName,
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
                        validator: null,
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
                        validator: null,
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
                        validator: null,
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
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text('Profile 2'), content: Column(
                      children: [
                        const Text('Next Of Kin',
                        style: TextStyle(
                          fontSize: 12
                        ),
                        ),
                        SizedBox(height: 10,),
                       TextFormField(
                  controller: _firstName2Controller,
                  //validator: _validation.validateName,
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
                  //validator: _validation.validateName,
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
                  //validator: _validation.validateName,
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
                        validator: null,
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
                        validator: null,
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
                        validator: null,
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