import 'package:flutter/material.dart';
import 'package:tandiza/utilities/settings.dart';

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
                    height: MediaQuery.of(context).size.height * 0.26,
                    padding: const EdgeInsets.all(15.0),
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
                              style: TextStyle(fontSize: 18,color: kWhiteColour,fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                            'Welcome to Tandiza Financial App,',
                            style: TextStyle(fontSize: 11,color: kWhiteColour),
                      ),
                      trailing: Icon(Icons.notifications_active,
                      color: kWhiteColour,
                      size:25,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0,),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 100),
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
                                      style: TextStyle(color: kPrimaryColour,fontSize: 18),
                                      ),
                                      SizedBox(height: 5.0,),
                                      Text('ZMW 0.0')
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                       Text('Loans',
                                      style: TextStyle(color: kPrimaryColour,fontSize: 18),),
                                      SizedBox(height: 5.0,),
                                      Text('ZMW 0.0')
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 35.0,
                                child: Divider(thickness: 2.0,),
                                ),
                              const FittedBox(
                                  child: Text('All you need in one App. Here you can borrow and check your repayment status',
                                  style: TextStyle(
                                    wordSpacing: 2,
                                    fontSize: 30
                                  ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                       Container(
                         child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const FittedBox(
                          child: Text('Services',
                          style: TextStyle(
                            fontSize: 15
                          ),
                          ),
                        ),
                        const SizedBox(height: 15,),
                        SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ListView(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Container(
                                      height: MediaQuery.of(context).size.height * 0.12,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Card(
                                        color: Color.fromARGB(255, 186, 226, 187),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Icon(Icons.person),
                                            SizedBox(height: 5.0,),
                                            Text('Profile',
                                            style: TextStyle(
                                              fontSize: 12
                                            ),
                                            )
                                          ],
                                        ),
                                      ),
                                     ),
                                     Container(
                                      height: MediaQuery.of(context).size.height * 0.12,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Card(
                                        color: Color.fromARGB(255, 226, 219, 219),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Icon(Icons.money),
                                            SizedBox(height: 5.0,),
                                            Text('Loans',
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
                                const SizedBox(height: 30,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                     Container(
                                      height: MediaQuery.of(context).size.height * 0.12,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Card(
                                        color: Color.fromARGB(255, 246, 161, 144),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Icon(Icons.handshake),
                                            SizedBox(height: 5.0,),
                                            Text('Apply for Loan',
                                            style: TextStyle(
                                              fontSize: 12
                                            ),
                                            )
                                          ],
                                        ),
                                      ),
                                     ),
                                     Container(
                                      height: MediaQuery.of(context).size.height * 0.12,
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Card(
                                        color: Color.fromARGB(255, 134, 155, 246),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Icon(Icons.picture_as_pdf),
                                            SizedBox(height: 5.0,),
                                            Text('Loan Statement',
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
                              ],
                            ),
                          ),
                        )
                      ],
                      ),
                  ),
                        ],
                      ),
                    ),
                  ),
                  
                  
            ],
          ),
        )
    );
  }
}


/*
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
                                        Text('Savings'),
                                        SizedBox(height: 5.0,),
                                        Text('ZMW 0.0')
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                         Text('Loans'),
                                        SizedBox(height: 5.0,),
                                        Text('ZMW 0.0')
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 35.0,
                                  child: Divider(thickness: 2.0,),
                                  ),
                                const FittedBox(
                                    child: Text('All you need in one App. Here you can borrow and check your repayment status',
                                    style: TextStyle(
                                      wordSpacing: 2,
                                      fontSize: 30
                                    ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        ),
 Padding(
                    padding: const EdgeInsets.symmetric(vertical: 200),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text('Services',
                            style: TextStyle(
                              fontSize: 15
                            ),
                            ),
                          ),
                          SingleChildScrollView(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: ListView(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Container(
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        padding: EdgeInsets.all(25),
                                        child: Card(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Icon(Icons.person),
                                              SizedBox(height: 5.0,),
                                              Text('Apply for Loan',
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                              )
                                            ],
                                          ),
                                        ),
                                       ),
                                       Container(
                                        height: MediaQuery.of(context).size.height * 0.2,
                                        width: MediaQuery.of(context).size.width * 0.5,
                                        padding: EdgeInsets.all(25),
                                        child: Card(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [
                                              Icon(Icons.person),
                                              SizedBox(height: 5.0,),
                                              Text('Apply for Loan',
                                              style: TextStyle(
                                                fontSize: 12
                                              ),
                                              )
                                            ],
                                          ),
                                        ),
                                       ),
                                       
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ) */