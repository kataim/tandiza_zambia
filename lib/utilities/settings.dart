import 'package:flutter/material.dart';

const kPrimaryColour = Color(0xFF5E763F);
const int kPrimaryColourInt = 0xFF5E763F;
const kSecondaryColour = Color(0xFFBE4169);
const kPrimaryLightColour = Color(0xFF007BB6);
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

const kTextFieldDecoration = InputDecoration(
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