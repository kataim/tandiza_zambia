import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/datasources/firebase_database_api.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';
import 'package:tandiza/screens/loan_application.dart';
import 'package:tandiza/screens/profile_details_screen.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:tandiza/widgets/service_card.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  late ServiceProvider serviceProvider;
  late Future<FirebaseUserModel> getUsers;

  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    getUsers = FirebaseDatabaseService(uid: uid).getUserData();
  }

  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: FutureBuilder<FirebaseUserModel?>(
            future: getUsers,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Stack(
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
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          title: Text(
                            'Hello ${snapshot.data?.firstName} ${snapshot.data?.surname}',
                            style: const TextStyle(fontSize: 19,color: kWhiteColour, fontFamily: "Texta Alt",fontWeight: FontWeight.w500),
                          ),
                          subtitle: const Text(
                            'Welcome to Tandiza Financial App,',
                            style: TextStyle(fontSize: 12,color: kWhiteColour,fontFamily: "Texta Alt",),
                          ),
                          trailing: const CircleAvatar(
                            backgroundColor: kWhiteColour,
                            child: Icon(Icons.person),
                          ),
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
                );
              }else{
                return const Center(child: CircularProgressIndicator(),);
              }
            }
          ),
        )
    );
  }
}



