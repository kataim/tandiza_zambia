import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/datalayer/datasources/firebase_auth_api.dart';
import 'package:tandiza/datalayer/datasources/loan_management_api.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/datalayer/repository/repository.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/presentation/application/service_provider.dart';
import 'package:tandiza/presentation/screens/existing_client_registration_screen.dart';
import 'package:tandiza/presentation/screens/home_screen.dart';
import 'package:tandiza/presentation/screens/registration_screen.dart';
import 'package:tandiza/presentation/screens/welcome_screen.dart';
import 'package:tandiza/utilities/settings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context){
          return ServiceProvider(
              applicationFacade: ApplicationFacade(
                  userRepository: Repository(
                      loanManagementApi: LoanManagementApi(),
                      firebaseAuthApi: FirebaseAuthApi())));
        }),
        
        StreamProvider.value(value: ServiceProvider(applicationFacade: ApplicationFacade(
            userRepository: Repository(
                loanManagementApi: LoanManagementApi(),
                firebaseAuthApi: FirebaseAuthApi()))).onAuthStateChanges(), initialData: FirebaseUserModel.fromJson({}))
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
      home: StreamBuilder<FirebaseUserEntity?>(
        stream:  ServiceProvider().onAuthStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return const HomeScreen();
          return const WelcomeScreen();
        }else{
            return const WelcomeScreen();
      }}
      ),
      routes: {
        RegistrationScreen.id : (context) => RegistrationScreen(),
        ExistingClientRegistrationScreen.id: (context) => ExistingClientRegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen()
      },
    );
  }
}

