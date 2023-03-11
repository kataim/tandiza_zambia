import 'package:flutter/material.dart';

const kPrimaryColour = Color(0xFF5a6d40);
const int kPrimaryColourInt = 0xFF5a6d40;
const kSecondaryColour = Color(0xFF53406D);
const kPrimaryLightColour = Color(0xFF653624);
const int kSecondaryColourInt = 0xFF007BB6;
const kWhiteColour = Color(0xffffffff);
const kBackgroundColour = Color(0xFF1F1F1F);
const kDividerColour = Color(0xFF282828);

const MaterialColor kMaterialSecondaryColor =
MaterialColor(kSecondaryColourInt, <int, Color>{
  50: kSecondaryColour,
  100: kSecondaryColour,
  200: kSecondaryColour,
  300: kSecondaryColour,
  400: kSecondaryColour,
  500: kSecondaryColour,
  600: kSecondaryColour,
  700: kSecondaryColour,
  800: kSecondaryColour,
  900: kSecondaryColour,
});

const MaterialColor kMaterialPrimaryColor =
MaterialColor(kPrimaryColourInt, <int, Color>{
  50: kPrimaryColour,
  100: kPrimaryColour,
  200: kPrimaryColour,
  300: kPrimaryColour,
  400: kPrimaryColour,
  500: kPrimaryColour,
  600: kPrimaryColour,
  700: kPrimaryColour,
  800: kPrimaryColour,
  900: kPrimaryColour,
});

// Affordability Check constants
const double MIN_AFFORDABILITY_RATIO_NETPAY = 0.4;
const double MIN_AFFORDABILITY_RATIO_DISPOSABLE_INCOME = 0.6;
const int MIN_LOAN_REQUEST_AMOUNT = 2000;
const int MIN_EXPENSES = 1500;
const int MIN_FEES = 50;
const double PERCENT_LOAN_INTEREST = 0.25;

List<DropdownMenuItem<Object>> titles = ['Mr', 'Mrs', 'Miss', 'Dr'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();

List<DropdownMenuItem<Object>> marital = ['Single', 'Married', 'Divorced', 'Widowed'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();

List<DropdownMenuItem<Object>> genders = ['Male', 'Female'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();


const List<String> list = <String>['Ndola',
'Lusaka',
'Chipata',
'Kitwe',
'Kabwe',
'Kasama',
'Chingola',
'Livingstone',
'Luanshya',
'Mufulira',
'Mazabuka',
'Mongu',
'Choma',
'Kapiri Mposhi',
'Mansa',
'Chinsali',
'Mpika',
'Solwezi',
'Mbala',
'Chililabombwe',
'Serenje',
'Mkushi',
'Kalulushi',
'Mwinilunga',
'Petauke',
'Isoka',
'Kafue',
'Lundazi',
'Monze',
'Siavonga',
'Kaoma',
'Luangwa',
'Sesheke',
'Samfya',
'Kawambwa',
'Nakonde',
'Mporokoso',
'Mpulungu',
'Senanga',
'Mumbwa',
'Nchelenge',
'Lukulu',
'Chibombo',
'Kabompo',
'Kalabo',
'Gwembe',
'Sinazongwe',
'Chadiza',
'Kataba',
'Chirundu',
'Luwingu'
];

List<String> zambiaProvinces = [
  'Central Province',
  'Copperbelt Province',
  'Eastern Province',
  'Luapula Province',
  'Lusaka Province',
  'Muchinga Province',
  'Northern Province',
  'North-Western Province',
  'Southern Province',
  'Western Province'
];

List<String> employers = [
  'Madison Insurance',
  'Total Zambia',
  'Toyota Zambia',
  'Zambia Revenue Authority',
  'ZANAZO',
  'First National Bank',
  'MTN',
  'Airtel',
  'Mopani Copper Mines',
  'Konkola Copper Mines'
];

List<DropdownMenuItem<Object>> contractType = <String>['Permanent', 'Temporary', 'Contract'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();

List<DropdownMenuItem<Object>> addressTypes = <String>['Home', 'Work', 'Other'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();

List<DropdownMenuItem<Object>> relationshipTypes = <String>['Wife', 'Brother', 'Sister', 'Husband', 'Other'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();

List<DropdownMenuItem<Object>> phoneProviderTypes = <String>['','Airtel Mobile', 'MTN Mobile', 'Zamtel Mobile'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();



List<DropdownMenuItem<Object>> contractDuration = <String>['6 Months', '1 Year', '2 Years', '5 Years', '10 Years'].
map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      value,
      style: const TextStyle(fontSize: 20),
    ),
  );
}).toList();


const kTextFieldDecoration = InputDecoration(
  labelText: 'Field title',
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryLightColour, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColour, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
  ),
);

class Validation  {


  String ? validateEmail(String ? arg) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(arg??'')) {
      return 'Email has invalid characters';
    } else if (arg!.isEmpty) {
      return "Email can't be empty";
    } else {
      return null;
    }
  }

  String ? validateNrc1(String ? arg){
    if (arg!.length < 6) {
      return 'Number is too short';
    } else {
      return null;
    }
  }

  String ? validateNrc2(String ? arg){
    if (arg!.length < 2) {
      return 'Number is too short';
    } else {
      return null;
    }
  }

  String ? validatePhone(String ? arg){
    if (arg!.length < 9) {
      return 'Number is too short';
    } else {
      return null;
    }
  }

  String ? validateNrc3(String ? arg){
    if (arg!.isEmpty) {
      return 'Number is too short';
    } else {
      return null;
    }
  }
  String ? validateDob(String ? arg){
    if (arg!.isEmpty) {
      return 'Please add a date';
    } else {
      return null;
    }
  }

  String ? validateIsEmpty(String ? arg){
    if (arg!.isEmpty) {
      return 'Field is empty';
    } else {
      return null;
    }
  }

  String ? validatePassword(String ? arg) {
    if (arg!.length < 6) {
      return 'Password is too short';
    } else {
      return null;
    }
  }

  String ? validateName(String ? arg) {
    if (arg!.length < 2) {
      return 'Name is too short';
    } else {
      return null;
    }
  }
}