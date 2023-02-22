import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/presentation/screens/employment_screen.dart';
import 'package:tandiza/presentation/screens/family_information_screen.dart';
import 'package:tandiza/presentation/screens/home_address_screen.dart';
import 'package:tandiza/presentation/screens/personal_information_screen.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';

import '../../utilities/settings.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ServiceProvider _serviceProvider = ServiceProvider();

  bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Account',
            style: TextStyle(fontFamily: 'CentraNo1-Medium'),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, PersonalInformationScreen.id);
                        },
                        leading: const Icon(
                          Icons.person,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Personal Information',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Complete your person',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                        trailing: const Icon(Icons.check_circle, color: kPrimaryColour,),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, HomeAddressScreen.id);
                        },
                        leading: const Icon(
                          Icons.home,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Home Address',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Complete your home address details',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                        trailing: const Icon(Icons.check_circle, color: kPrimaryColour,),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      ListTile(
                        onTap: (){
                          Navigator.pushNamed(context, EmploymentScreen.id);
                        },
                        leading: const Icon(
                          Icons.cases_sharp,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Work Information',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Complete your work information',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                        trailing: const Icon(Icons.warning_amber, color: Colors.red,),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      ListTile(
                        onTap: () {
                          Navigator.pushNamed(context, FamilyInformationScreen.id);
                        },
                        leading: const Icon(
                          Icons.people,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Family Information',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Complete your family information',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                        trailing: const Icon(Icons.warning_amber, color: Colors.red,),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      ListTile(
                        onTap: (){
                          FirebaseAuth.instance.signOut();
                        },
                        leading: const Icon(
                          Icons.logout_outlined,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Log out',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Log out of your account',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      ListTile(
                        onTap: () async {
                          return showCupertinoDialog(context: context,
                              builder: (BuildContext context){
                                return CupertinoAlertDialog(
                                  title: const Text('Delete Account'),
                                  content: const Text('Are you sure you want to delete your account? All data will be lost and cannot be recovered'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        FirebaseAuth.instance.currentUser?.delete();
                                        Navigator.pop(context);
                                      },
                                      child: const Text('OK'),
                                    ),
                                  ],
                                );
                              });
                        },
                        leading: const Icon(
                          Icons.delete,
                          color: kSecondaryColour,
                        ),
                        title: const Text(
                          'Delete Account',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                        ),
                        subtitle: const Text(
                          'Permanently Delete Account',
                          style: TextStyle(
                              fontFamily: 'CentraNo1-Medium',
                              color: Colors.grey,
                              fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
