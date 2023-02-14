import 'package:flutter/material.dart';
import 'package:tandiza/screens/loan_application.dart';
import 'package:tandiza/screens/profile_details_screen.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:tandiza/widgets/service_card.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            fit: StackFit.loose,
            children: [
                  Container(
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height * 0.23,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8.0),
                        bottomRight: Radius.circular(8.0)
                        ),
                      color: kPrimaryColour
                    ),
                    child: const ListTile(
                      title: Text(
                              'Hello Erick,',
                              style: TextStyle(fontSize: 19,color: kWhiteColour, fontFamily: "Texta Alt",fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                            'Welcome to Tandiza Financial App,',
                            style: TextStyle(fontSize: 12,color: kWhiteColour,fontFamily: "Texta Alt",),
                      ),
                      trailing: Icon(Icons.notifications_active,
                      color: kWhiteColour,
                      size:27,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 80),
                    child: Column(
                      children: [
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: const [
                                    Text('Savings',
                                    style: TextStyle(color: kPrimaryColour,fontSize: 15,fontFamily: "Texta Alt",),
                                    ),
                                    SizedBox(height: 5.0,),
                                    Text('ZMW 0.0',
                                    style: TextStyle(
                                      fontSize: 12
                                    ),
                                    )
                                  ],
                                ),
                                Column(
                                  children: const [
                                     Text('Loans',
                                    style: TextStyle(color: kPrimaryColour,fontSize: 15,fontFamily: "Texta Alt",),),
                                    SizedBox(height: 5.0,),
                                    Text('ZMW 0.0',
                                    style: TextStyle(
                                      fontSize: 12
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 35.0,
                              child: Divider(thickness: 2.0,),
                              ),
                            const Text('All you need in one App. ',
                            style: TextStyle(
                              fontSize: 12
                            ),
                            )
                          ],
                        ),
                      ),
                    ),                            
                   ],
                  ),
                                ),
               const SizedBox(height: 5.0,),
                  Padding(
                    padding: const EdgeInsets.only(top: 190.0),
                    child: Container(
                          child: Padding(
                                    padding: const EdgeInsets.all(28.0),
                                    child: GridView(
                                      padding: EdgeInsets.all(10),
                                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 25,crossAxisSpacing: 25),
                                      children: [
                                           GestureDetector(
                                            onTap: (() {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileDetails()));
                                            }),
                                             child: const ServicesCard(
                                              icon: Icons.person, 
                                              color: Color.fromARGB(255, 220, 246, 232), 
                                              text: 'Personal Info'),
                                           ),
                                            GestureDetector(
                                              onTap: () {
                                                
                                              },
                                              child: const ServicesCard(
                                                color: Color.fromARGB(255, 247, 172, 241),
                                                icon: Icons.money,
                                                text: 'Loans',
                                                
                                               ),
                                            ),
                                             GestureDetector(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoanApplication()));
                                              },
                                               child: const ServicesCard(
                                                icon: Icons.handshake, 
                                               color: Color.fromARGB(255, 238, 146, 131), 
                                               text: 'Apply for Loan')
                                             ),
                                         GestureDetector(
                                          onTap: (){},
                                           child: const ServicesCard(icon: Icons.picture_as_pdf, 
                                           color: Color.fromARGB(106, 171, 214, 221),
                                           text: 'Loan Statements',)
                                         ),
                                            GestureDetector(
                                              onTap: (){},
                                              child: const ServicesCard(icon: Icons.mobile_friendly, 
                                              color: Color.fromARGB(106, 113, 139, 210), 
                                              text: 'Ndalama')
                                            ),
                                      ],
                                      ),
                                  ),
                                ),
                  )
            ],
          ),
        )
    );
  }
}



