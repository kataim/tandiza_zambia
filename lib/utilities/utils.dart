//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

pickImage(ImageSource source) async{
  String res = 'something';
  final ImagePicker imagePicker = ImagePicker();

 XFile? file = await imagePicker.pickImage(source: source);


if (file != null) {
    return await file.readAsBytes();
  }
 return res;
}

final amountRequest = [1500, 2500,3500,5000,10000,20000,30000];


final periodList = ["6 Months", "8 Months", "1 Year", "2 Year", "3 Year", "4 Year","5 years"];


final netPay = [3500,5000,10000,20000,30000];


final rent = [500,1000,2000,3000,4000];


final electricity = [100,200,300,400];


final water = [100,200,300,400];


final groceries = [600,700,800,1000,1500];


final transport = [300,400,600,800];
