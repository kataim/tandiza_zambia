import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.person,
                            color: kSecondaryColour,
                          ),
                          title: Text(
                            'Personal Information',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                          ),
                          subtitle: Text(
                            'Complete your person',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                color: Colors.grey,
                                fontSize: 13.0),
                          ),
                          trailing: Icon(Icons.check_circle, color: kPrimaryColour,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.cases_sharp,
                            color: kSecondaryColour,
                          ),
                          title: Text(
                            'Work Information',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                          ),
                          subtitle: Text(
                            'Complete your work information',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                color: Colors.grey,
                                fontSize: 13.0),
                          ),
                          trailing: Icon(Icons.warning_amber, color: Colors.red,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.people,
                            color: kSecondaryColour,
                          ),
                          title: Text(
                            'Family Information',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                          ),
                          subtitle: Text(
                            'Complete your family information',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                color: Colors.grey,
                                fontSize: 13.0),
                          ),
                          trailing: Icon(Icons.warning_amber, color: Colors.red,),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      GestureDetector(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: const ListTile(
                          leading: Icon(
                            Icons.logout_outlined,
                            color: kSecondaryColour,
                          ),
                          title: Text(
                            'Log out',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                          ),
                          subtitle: Text(
                            'Log out of your account',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                color: Colors.grey,
                                fontSize: 13.0),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5,),
                      const Divider(color: kPrimaryColour, thickness: 0.5,),
                      const SizedBox(height: 5,),
                      GestureDetector(
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
                        child: const ListTile(
                          leading: Icon(
                            Icons.delete,
                            color: kSecondaryColour,
                          ),
                          title: Text(
                            'Delete Account',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium', fontSize: 15.0),
                          ),
                          subtitle: Text(
                            'Permanently Delete Account',
                            style: TextStyle(
                                fontFamily: 'CentraNo1-Medium',
                                color: Colors.grey,
                                fontSize: 13.0),
                          ),
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
