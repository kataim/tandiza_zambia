import 'package:flutter/material.dart';
import 'package:tandiza/screens/welcome_screen.dart';
import 'package:tandiza/utilities/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: kSecondaryColour,
                  foregroundColor: kPrimaryColour)),
          primarySwatch: kMaterialPrimaryColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: kPrimaryColour,
            secondary: kSecondaryColour,
          )),
      home: const WelcomeScreen(),
    );
  }
}

