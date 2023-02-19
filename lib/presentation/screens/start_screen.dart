import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  static const String id = 'start_screen';

  @override
  Widget build(BuildContext context) {
        return Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot){
              if((snapshot.connectionState == ConnectionState.done) ||
              (snapshot.connectionState == ConnectionState.active)){
                if(snapshot.hasData){
                  return const HomeScreen();
                }else{
                  return const WelcomeScreen();
                }
              }
              return const Center(child: CircularProgressIndicator(),);
            },
          ),
        );
  }
}
