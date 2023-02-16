import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ServiceProvider serviceProvider = Provider.of(context, listen: false);
    return Center(
      child: ElevatedButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
      },
      child:  Text('Sign Out')),
    );
  }
}
