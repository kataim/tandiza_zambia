//import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tandiza/utilities/utils.dart';

class LoanApplication extends StatefulWidget {
  const LoanApplication({super.key});

  @override
  State<LoanApplication> createState() => _LoanApplicationState();
}

class _LoanApplicationState extends State<LoanApplication> {
  int _currentStep = 0;
  Uint8List? _image;


  final Validation _validation = Validation();
  final GlobalKey<FormState> _formKeyAccount = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKeyTandiza = GlobalKey<FormState>();
  
void selectImage() async {
      Uint8List im = await pickImage(ImageSource.gallery);

      setState(() {
        _image = im;
      });
  }


int _selectedAmount = 1500;
String _selectedPeriod = "6 Months";
int _selectedNetPay = 3500;
int _selectedRentAmount = 500;
int _selectedElectricityAmount = 100;
int _selectedWaterAmount = 100;
int _selectedGroceriesAmount = 600;
int _selectedTransportAmount = 300;

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
                           if (_currentStep != 2) {
                                  setState(() {
                                    _currentStep += 1;
                                  });
                                } else {
                                  Navigator.pop(context);
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

                  /* onStepCancel: (){
                    if(_currentStep != 0){
                    //  Navigator.pop(context);
                      setState(() {
                        _currentStep -= 1;
                      });
                    }
                  },
       
                  onStepContinue: () {
                      if(_currentStep != 1){
                        setState(() {
                          _currentStep += 1;
                        });
                      }else {
                          Navigator.pop(context);
                      }
                     
                  
                      
                  }, */
                  
                  
       
                  steps: [
                    Step(title: Text('Loan 1'), content: Column(
                      children: [
                        
                 
                 const Text('Amount Requested',
                 style: TextStyle(
                  fontSize: 15
                 ),
                 ),
                 const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'ZMW',
                      prefixIcon: Icon(
                        Icons.money,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedAmount,
                  items: amountRequest.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedAmount = newValue!;
                      });
                }),
                  const SizedBox(
                              height: 15,
                            ),
                     DropdownButtonFormField(
                                isExpanded: true,
                                
                                decoration: kTextFieldDecoration.copyWith(
                                    labelText: 'Duration',
                                    prefixIcon: Icon(
                                      Icons.lock_clock,
                                      color: Theme.of(context).primaryColorDark,
                                    )),
                                value: _selectedPeriod,
                                items: periodList
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
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Net Pay',
                      prefixIcon: Icon(
                        Icons.money,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedNetPay,
                  items: netPay.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(
                      child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedNetPay = newValue!;
                      });
                }),
                
                const SizedBox(height: 20.0,)
                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text('Loan 2'), content: Column(
                      children: [
                            const Text(
                              'Expenses',
                              style: TextStyle(fontSize: 15),
                            ),
                           DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Rent',
                      prefixIcon: Icon(
                        Icons.home,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedRentAmount,
                  items: rent.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedRentAmount = newValue!;
                      });
                }),
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Electricity',
                      prefixIcon: Icon(
                        Icons.electric_meter,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedElectricityAmount,
                  items: electricity.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedElectricityAmount = newValue!;
                      });
                }),
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Water',
                      prefixIcon: Icon(
                        Icons.water,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedWaterAmount,
                  items: water.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedWaterAmount = newValue!;
                      });
                }),
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Groceries',
                      prefixIcon: Icon(
                        Icons.local_grocery_store,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedGroceriesAmount,
                  items: groceries.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedGroceriesAmount = newValue!;
                      });
                }),
                const SizedBox(height: 15,),
                DropdownButtonFormField(
                  isExpanded: true,
                  decoration: kTextFieldDecoration.copyWith(
                      labelText: 'Transport',
                      prefixIcon: Icon(
                        Icons.emoji_transportation,
                        color: Theme.of(context).primaryColorDark,
                      )),
                  value:_selectedTransportAmount,
                  items: transport.map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Center(child: Text(value.toString()))
                    );
                }).toList(), 
                onChanged: (int? newValue){
                      setState(() {
                        _selectedTransportAmount = newValue!;
                      });
                }),
                const SizedBox(height: 20.0,)
                      ],
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                    ),
                    Step(title: Text('Upload Payslips'), content: Column(
                      children: [
                        Text('Upload Payslips'),
                        const SizedBox(height: 10.0,),

                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPrimaryColour)
                          ),
                          onPressed: selectImage,
                        child: const Text('Attach Payslip 1',
                        style: TextStyle(
                          color: kWhiteColour,
                          fontSize: 15
                        ),
                        ),
                        ),
                      const SizedBox(height: 10.0,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPrimaryColour)
                          ),
                          onPressed: selectImage, 
                        child: const Text('Attach Payslip 1',
                        style: TextStyle(
                          color: kWhiteColour,
                          fontSize: 15
                        ),
                        ),
                        ),
                         const SizedBox(height: 10.0,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPrimaryColour)
                          ),
                          onPressed: selectImage, 
                        child: const Text('Attach Payslip 1',
                        style: TextStyle(
                          color: kWhiteColour,
                          fontSize: 15
                        ),
                        ),
                        ),
                          const SizedBox(height: 10.0,),
                        Text('Upload NRCs'),
                        const SizedBox(height: 10.0,),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kPrimaryColour)
                          ),
                          onPressed: selectImage, 
                        child: const Text('Upload ID',
                        style: TextStyle(
                          color: kWhiteColour,
                          fontSize: 15
                        ),
                        ),
                        ),
                         const SizedBox(height: 25.0,),
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