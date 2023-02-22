import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/presentation/screens/login_screen.dart';
import 'package:tandiza/presentation/screens/registration_screen.dart';
import 'package:tandiza/utilities/settings.dart';

import 'existing_client_registration_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_sreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: SizedBox(
              height: 200,
              width: 200,
              child: Image.asset('assets/images/tandiza_logo.png'),
            ),
          ),
          Spacer(),
          Text('Tandiza Finance', style: TextStyle(fontSize: 36),),
          Spacer(),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, ExistingClientRegistrationScreen.id);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColour,
              fixedSize: const Size(252, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Get Started",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Texta Alt",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 15),
          OutlinedButton(
            onPressed: () {
              Navigator.pushNamed(context, LoginScreen.id);
            },
            style: OutlinedButton.styleFrom(
              fixedSize: const Size(252, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  width: 2,
                  color: kPrimaryLightColour,
                ),
              ),
            ),
            child: const Text(
              "Login",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColour,
                fontSize: 16,
                fontFamily: "Texta Alt",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}
