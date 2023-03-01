
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:tandiza/utilities/utils.dart';
import 'package:tandiza/widgets/upload_documents_widget.dart';
import 'package:tandiza/widgets/upload_triple_documents_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

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

  File? imageHrLetter;
  Future<File?> startCamera(ImageSource source, File ? imageSelected) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return null;
      }
      final imageFilePath = await saveImagePermanently(image.path);
      setState(() {
        imageSelected = imageFilePath;
      });
      return imageSelected;
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  Future<File?> saveImagePermanently(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');
    return File(imagePath).copy(image.path);
  }


double _selectedAmount = 1500;
double _selectedPeriod = 6;
int _selectedNetPay = 3500;
double _selectedRentAmount = 1000;
double _selectedElectricityAmount = 1000;
double _selectedWaterAmount = 200;
double _selectedGroceriesAmount = 600;
double _selectedTransportAmount = 500;
bool ? _accepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Loan Application'),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Stepper(
                currentStep: _currentStep,
                type: StepperType.vertical,
                physics: const ScrollPhysics(),
                controlsBuilder: (context, ControlsDetails controlsDetails) {
                  final isLastStep = _currentStep == getSteps(_currentStep, context).length - 1;
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
                        if (_currentStep != 0)
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
              onStepCancel: (){
                  if(_currentStep != 0 ){
                    setState(() {
                      _currentStep = _currentStep - 1;
                    });
                  }
              },
              onStepContinue: (){
                final isLastStep = _currentStep == getSteps(_currentStep, context).length - 1;
                if(isLastStep && _accepted!){
                  //TODO apply for loan
                  Navigator.pop(context);
                }else if(isLastStep && !_accepted!){
                  const snackBar = SnackBar(
                    content: Text('Confirm Tandiza Terms & Conditions!'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
                else{
                  setState(() {
                    _currentStep = _currentStep + 1;
                  });
                }

              },

              steps: getSteps(_currentStep, context),)));
  }

  List<Step> getSteps(int currentStep, BuildContext context) {
    return <Step> [
      Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const Text('Loan Amount'),
          content: Column(
            children: [
              Text('ZMW ${_selectedAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 1000,
                  max: 30000,
                  divisions: 29,
                  label: '${_selectedAmount.round().toString()}',
                  value: _selectedAmount, onChanged: (double value) {
                  setState(() {
                    _selectedAmount = value;
                  });
                },),
              ),
            ],
          )),
      Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text('Loan Duration'),
          content: Column(
            children: [
              Text('${_selectedPeriod.round().toString()} Months',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 6,
                  max: 60,
                  divisions: 9,
                  label: '${_selectedPeriod.round().toString()}',
                  value: _selectedPeriod, onChanged: (double value) {
                  setState(() {
                    _selectedPeriod = value;
                  });
                },),
              ),
            ],
          )),
      Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: Text('Add Expenses'),
          content: Column(
            children: [
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 1000,
                  max: 20000,
                  divisions: 190,
                  label: '${_selectedRentAmount.round().toString()}',
                  value: _selectedRentAmount, onChanged: (double value) {
                  setState(() {
                    _selectedRentAmount = value;
                  });
                },),
              ),
              Text('Rent: ${_selectedRentAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 500,
                  max: 5000,
                  divisions: 45,
                  label: '${_selectedElectricityAmount.round().toString()}',
                  value: _selectedElectricityAmount, onChanged: (double value) {
                  setState(() {
                    _selectedElectricityAmount = value;
                  });
                },),
              ),
              Text('Electricity: ${_selectedElectricityAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 300,
                  max: 10000,
                  divisions: 97,
                  label: '${_selectedGroceriesAmount.round().toString()}',
                  value: _selectedGroceriesAmount, onChanged: (double value) {
                  setState(() {
                    _selectedGroceriesAmount = value;
                  });
                },),
              ),
              Text('Groceries: ${_selectedGroceriesAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 500,
                  max: 5000,
                  divisions: 45,
                  label: '${_selectedTransportAmount.round().toString()}',
                  value: _selectedTransportAmount, onChanged: (double value) {
                  setState(() {
                    _selectedTransportAmount = value;
                  });
                },),
              ),
              Text('Transport: ${_selectedTransportAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              const SizedBox(height: 25,),
              SliderTheme(
                data: const SliderThemeData(
                    valueIndicatorColor: kSecondaryColour,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape()
                ),
                child: Slider.adaptive(
                  min: 100,
                  max: 2000,
                  divisions: 190,
                  label: '${_selectedWaterAmount.round().toString()}',
                  value: _selectedWaterAmount, onChanged: (double value) {
                  setState(() {
                    _selectedWaterAmount = value;
                  });
                },),
              ),
              Text('Water: ${_selectedWaterAmount.round().toString()}',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            ],
          )),
      Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: Text('Upload HR Letter'),
          content: UploadDocuments()),
      Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: Text('Upload Payslips'),
          content: UploadTripleDocuments()),
      Step(
          state: currentStep > 5 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 5,
          title: Text('Terms & Conditions'),
          content: Row(
            children: [
              Checkbox(value: _accepted,
                  onChanged: (value){
                setState(() {
                  _accepted = value;
                });
                  }),
              Expanded(child: Text('Accept Tandiza Finance Terms & Conditions'))
            ],
          ))
    ];
  }
}
