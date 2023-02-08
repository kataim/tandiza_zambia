import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/application/get_user.dart';
import 'package:tandiza/datalayer/datasources/remote_data_provider.dart';
import 'package:tandiza/datalayer/repository/user_repository.dart';
import 'package:tandiza/presentation/application/provider.dart';
import 'package:tandiza/presentation/screens/existing_client_registration_screen.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/presentation/screens/registration_screen.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';
import 'package:tandiza/utilities/settings.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context){
          return UserServiceProvider(getUserFacade: GetUserFacade(userRepository: UserRepository(remoteDataProvider: RemoteDataProvider())));
        })
      ],
      child: const MyApp()));
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
                textStyle: TextStyle(color: Colors.white),
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
      routes: {
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ExistingClientRegistrationScreen.id: (context) => ExistingClientRegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen()
      },
    );
  }
}

