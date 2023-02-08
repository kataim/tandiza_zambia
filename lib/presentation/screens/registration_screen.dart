


import 'package:flutter/material.dart';
import 'package:tandiza/widgets/upload_documents_widget.dart';

import '../../utilities/settings.dart';

class RegistrationScreen extends StatefulWidget {
  RegistrationScreen({Key? key}) : super(key: key);
  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
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

              if (isLastStep) {
                //TODO register the user and navigate to the dashboard
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
                validator: null,
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
              TextFormField(
                  validator: null,
                  //_validateEmail,
                  onChanged: (value) {},
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Theme.of(context).primaryColorDark,
                      ))),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                  validator: null,
                  //_validatePassword(),
                  onChanged: (value) {},
                  obscureText: false,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.phone,
                  cursorColor: kPrimaryColour,
                  decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Phone',
                      prefixIcon: Icon(
                        Icons.phone,
                        color: Theme.of(context).primaryColorDark,
                      ))),
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
                    hintText: 'Street',
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
