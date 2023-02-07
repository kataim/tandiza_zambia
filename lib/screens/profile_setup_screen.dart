import 'package:flutter/material.dart';
import 'package:tandiza/screens/profile_details_screen.dart';
import 'package:tandiza/utilities/settings.dart';


class ProfileSetup extends StatelessWidget {
  const ProfileSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Personal Profile'),
        centerTitle: true,
        
      ),
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
        //  Spacer(),
         const  Center(
            child: SizedBox(
              height: 50,
              width: 200,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, ExistingClientRegistrationScreen.id);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetails()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColour,
              fixedSize: const Size(252, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Personal Details 1",
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
          ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, RegistrationScreen.id);
               Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetails()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColour,
              fixedSize: const Size(252, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Personal Details 2",
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
          ElevatedButton(
            onPressed: () {
              //Navigator.pushNamed(context, RegistrationScreen.id);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetails()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColour,
              fixedSize: const Size(252, 56),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              "Employement Details",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: "Texta Alt",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          /* SizedBox(height: 35.0,),
          Divider(thickness: 1.0,),
          SizedBox(height: 35.0,),
           OutlinedButton(
            onPressed: () {

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
              "Submit",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kPrimaryColour,
                fontSize: 16,
                fontFamily: "Texta Alt",
                fontWeight: FontWeight.w500,
              ),
            ),
          ), */
        ],
      )
    );
  }
}