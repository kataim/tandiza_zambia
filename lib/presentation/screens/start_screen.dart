import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return const WelcomeScreen();

  }
}
