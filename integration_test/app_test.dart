//import 'dart:io';
import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


import 'package:tandiza/main.dart' as app;
import 'package:tandiza/utilities/settings.dart';

//import 'Robots/welcome_robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();


  group('end-to-end test', () {
//All finders go here

    testWidgets('test whole app',
        (tester) async {
         
      app.main();

       await tester.pumpAndSettle(const Duration(seconds: 3));

      
      expect(find.text('Tandiza Finance'), findsOneWidget);
      sleep(const Duration(seconds: 2));

      //click first button
     final btnLoginFinder = find.byKey(const Key('startedBtn'));

      await tester.ensureVisible(btnLoginFinder);
      await tester.tap(btnLoginFinder);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      
      //Enter texts into the texts fields
      final nrcOne = find.byKey(const Key('nrcOne'));
      final nrcTwo = find.byKey(const Key('nrcTwo'));
      final nrcThree = find.byKey(const Key('nrcThree'));
      final phoneNumber = find.byKey(const Key('phoneNumber'));
     

      await tester.tap(nrcOne);
      await tester.enterText(nrcOne, '252429');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(nrcTwo);
      await tester.enterText(nrcTwo, '81');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(nrcThree);
      await tester.enterText(nrcThree, '1');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(phoneNumber);
      await tester.enterText(phoneNumber, '77123456789');
      await tester.pumpAndSettle(const Duration(seconds: 3));


    //  click on next button
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('btnKey')));
      await tester.pumpAndSettle(const Duration(seconds: 8));
      
      //finders for page two input fields
      final firstName = find.byKey(const Key('firstName'));
      final lastName = find.byKey(const Key('lastName'));
      final date = find.byKey(const Key('Date'));


      await tester.tap(firstName);
      await tester.enterText(firstName, 'Erick');
      await tester.pumpAndSettle(const Duration(seconds: 2));


      await tester.tap(lastName);
      await tester.enterText(lastName, 'Njekwa');
      await tester.pumpAndSettle(const Duration(seconds: 5));


      await tester.tap(date);
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.text('OK'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle(const Duration(seconds: 8));
     

      //  click on next button
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('btnKey')));
      await tester.pumpAndSettle(const Duration(seconds: 8));


      //find input fields for page 3
      final plotNumber = find.byKey(const Key('plotNumber'));
      final streetAddress = find.byKey(const Key('streetAddress'));
       final city = find.byKey(const Key('city'));


      await tester.tap(plotNumber);
      await tester.enterText(plotNumber, '25538');
      await tester.pumpAndSettle(const Duration(seconds: 2));


      await tester.tap(streetAddress);
      await tester.enterText(streetAddress, 'Luagwa,Garden');
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await tester.tap(city);
      await tester.enterText(city, 'Lusaka');
      await tester.pumpAndSettle(const Duration(seconds: 8));




      final checkboxFinder = find.byKey(const Key('check'));
       tester.firstWidget<Checkbox>(checkboxFinder);
     // expect(checkbox.value, false);
     
      await tester.ensureVisible(find.byType(Checkbox));
      await tester.tap(checkboxFinder);
      await tester.pump(const Duration(seconds: 20));

     
      

      //  click on next button
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('btnKey')),warnIfMissed: false);
      await tester.pumpAndSettle(const Duration(seconds: 8));

    });

    


  });
}