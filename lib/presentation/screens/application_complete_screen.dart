import 'package:flutter/material.dart';
import 'package:tandiza/utilities/settings.dart';

class ApplicationComplete extends StatelessWidget {
  const ApplicationComplete({Key? key}) : super(key: key);

  static const String id = 'application_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Column(
                children: const [
                  Icon(Icons.check_circle_rounded, size: 100, color: kPrimaryColour,),
                  SizedBox(height: 30,),
                  Text('Application Complete', style: TextStyle(fontSize: 20),),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.popUntil(context, (route) => route.isFirst);
                  }, child: const Text('Proceed', style: TextStyle(color: kWhiteColour, fontSize: 30, fontWeight: FontWeight.w500),)),
                ),
              ],
            ),
            const SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
