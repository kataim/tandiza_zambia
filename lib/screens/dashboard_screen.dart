import 'package:flutter/material.dart';
import 'package:tandiza/utilities/settings.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            
            children: [
               Container(
                  width: double.infinity,
                  height: 230.0,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(10.0)
                      ),
                      color: kPrimaryColour
                  ),
                  child: const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.0, vertical: 25),
                    child: ListTile(
                      title: Text('Hi Erick,',
                      style: TextStyle(
                        color: kWhiteColour,
                        fontSize: 18,
                        fontFamily: "Texta Alt",
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                      subtitle: Text('Welcome to Tandiza',
                      style: TextStyle(
                        fontFamily: "Texta Alt",
                         fontSize: 13,
                         color: kWhiteColour
                      ),
                      ),
                      trailing:  Icon(Icons.notification_add_sharp,
                      size: 30,
                      color: kWhiteColour,
                      ),        
                    ),
                  )
                ),
                 Align(
                  alignment: Alignment.center,
                   child: Container(
                     padding: const EdgeInsets.symmetric(horizontal: 16,vertical:100),
                     child:  Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Card(
                           child: Column(
                             children: [
                                 Padding(
                                   padding: const EdgeInsets.all(15.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       Column(
                                         children: const [
                                           Text('Savings',
                                           style: TextStyle(
                                             color: kBackgroundColour,
                                             fontSize: 15
                                           ),
                                           ),
                                           Text('ZMW 0.0',
                                           style: TextStyle(
                                             color: kPrimaryColour,
                                             fontWeight: FontWeight.w500,
                                             fontSize: 16
                                           ),
                                           )
                                         ],
                                       ),
                                       Column(
                                         children: const [
                                           Text('Loans',
                                           style: TextStyle(
                                             color: kBackgroundColour,
                                             fontSize: 15
                                           ),),
                                           Text('ZMW 0.0',
                                           style: TextStyle(
                                             color: kPrimaryColour,
                                             fontWeight: FontWeight.w500,
                                             fontSize: 16
                                           ),)
                                         ],
                                       ),
                                     ],
                                   ),
                                 ),
                                 const Divider(thickness: 2.0),
                                 const Padding(
                                   padding: EdgeInsets.all(15.0),
                                   child: Text('All you need is in one app. Here you can borrow and repay back!'),
                                 )
                             ],
                           ),
                         ),
                         const SizedBox(height: 15.0,),
                         const Text('Services',
                         style: TextStyle(
                           color: kBackgroundColour,
                           fontSize: 20
                         ),
                         ),
                        const SizedBox(height: 15,),
                         Expanded(
                           child: ListView(
                             children: [
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     width: 180.0,
                                     height: 80.0,
                                     child: Card(
                                       color: Color.fromARGB(255, 224, 243, 224),
                                       child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const [
                                                Icon(Icons.person),
                                                SizedBox(height: 4.0,),
                                                Text('Personal info')
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   Container(
                                     width: 180.0,
                                     height: 80.0,
                                     child: Card(
                                       color: Color.fromARGB(255, 241, 232, 243),
                                       child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const [
                                                Icon(Icons.money),
                                                SizedBox(height: 4.0,),
                                                Text('Loans')
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               const SizedBox(height: 15.0,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     width: 180.0,
                                     height: 80.0,
                                     child: Card(
                                       color: Color.fromARGB(255, 238, 175, 175),
                                       child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const [
                                                Icon(Icons.handshake),
                                                SizedBox(height: 4.0,),
                                                Text('Apply Loan')
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                   Container(
                                     width: 180.0,
                                     height: 80.0,
                                     child: Card(
                                       color: Color.fromRGBO(250, 252, 249, 0.46),
                                       child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const [
                                                Icon(Icons.picture_as_pdf_rounded),
                                                SizedBox(height: 4.0,),
                                                Text('Loan Statements')
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               const SizedBox(height: 15.0,),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     width: 180.0,
                                     height: 80.0,
                                     child: Card(
                                       color: Color.fromARGB(255, 238, 175, 175),
                                       child: Padding(
                                         padding: const EdgeInsets.all(10.0),
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: const [
                                                Icon(Icons.handshake),
                                                SizedBox(height: 4.0,),
                                                Text('Ndalama')
                                           ],
                                         ),
                                       ),
                                     ),
                                   ),
                                 ],
                               )
                             ],
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
            ],
          ),
        ),
    );
  }
}
