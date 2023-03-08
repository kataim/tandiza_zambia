import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/datasources/firebase_database_api.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';
import 'package:tandiza/presentation/screens/loan_application_screen.dart';
import 'package:tandiza/screens/profile_details_screen.dart';
import 'package:tandiza/utilities/settings.dart';
import 'package:tandiza/widgets/service_card.dart';

import '../../datalayer/models/tandiza_loan_statement_model.dart';
import 'loan_statement_screen.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {

  late ServiceProvider serviceProvider;
  late Future<FirebaseUserModel> getUsers;
  late Future<TandizaLoanStatementModel> loanStatement;
  late Future<TandizaClientFinancialsModel?> clientFinancials;

  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    getUsers = FirebaseDatabaseService(uid: uid).getUserData();
    clientFinancials = FirebaseDatabaseService(uid: uid).getUserFinancialData();
  }

  void openPdf() async {
    String ? uid = FirebaseAuth.instance.currentUser?.uid;
    loanStatement = FirebaseDatabaseService(uid: uid).getFirebaseLoanStatement();
    var base64 = await loanStatement;
    var bytes = base64Decode(base64.pdf??'');
    final output = await getTemporaryDirectory();
    final file = File("${output.path}/loan_statement.pdf");
    await file.writeAsBytes(bytes.buffer.asUint8List());
    debugPrint("${output.path}/loan_statement.pdf");
    await OpenFilex.open("${output.path}/loan_statement.pdf");
  }

  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    return Scaffold(
        body: Stack(
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
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15),
                      child: FutureBuilder<FirebaseUserModel?>(
                        future: getUsers,
                        builder: (context, snapshot) {
                          if(snapshot.hasData){
                            return ListTile(
                              title: Text(
                                '${snapshot.data?.firstName} ${snapshot.data?.surname}',
                                style: const TextStyle(fontSize: 23,color: kWhiteColour, fontFamily: "Texta Alt",fontWeight: FontWeight.w500),
                              ),
                            );
                          }
                          return const Center(child: CircularProgressIndicator(),);
                        }
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
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Text('Balance', style: TextStyle(fontSize: 15),),
                                FutureBuilder<TandizaClientFinancialsModel?>(
                                  future: clientFinancials,
                                    builder: (context, snapshot){
                                      if(snapshot.hasData){
                                        return Column(
                                          children: [
                                            SizedBox(height: 5,),
                                            Text('ZMW ${snapshot.data?.loans?[0].balances?.loanBalance}', style: const TextStyle(
                                              fontSize: 35, fontWeight: FontWeight.bold
                                            ),),
                                            SizedBox(height: 5,),
                                            const Divider(thickness: 1.0,),
                                            SizedBox(height: 5,),
                                            Padding(
                                              padding: const EdgeInsets.only(left: 10, right: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Due: ${snapshot.data?.loans?[0].nextInstalmentDate}', style: TextStyle(fontSize: 16),),
                                                  Text('Amount: ${snapshot.data?.loans?[0].balances?.dueThisMonth}', style: TextStyle(fontSize: 16)),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 2,)
                                          ],
                                        );
                                      }
                                      return const Center(child: CircularProgressIndicator(),);
                                    }),


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
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: GridView(
                        padding: const EdgeInsets.all(10),
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 0,crossAxisSpacing: 0),
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoanApplication()));
                              },
                              child: const ServicesCard(
                                  leftWidth: 1,
                                  topWidth: 1,
                                  bottomWidth: 0.5,
                                  rightWidth: 0.5,
                                  icon: Icons.check_circle_rounded,
                                  text: 'Apply for Loan')
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, LoanStatementScreen.id);
                            },
                            child: const ServicesCard(
                              leftWidth: 0.5,
                              topWidth: 1,
                              bottomWidth: 0.5,
                              rightWidth: 1,
                              icon: Icons.account_balance,
                              text: 'Loans',
                            ),
                          ),
                          GestureDetector(
                              onTap: () async{
                                openPdf();
                              },
                              child: const ServicesCard(
                                leftWidth: 1,
                                topWidth: 0.5,
                                bottomWidth: 1,
                                rightWidth: 0.5,
                                icon: Icons.picture_as_pdf,
                                text: 'Loan Statements',)
                          ),
                          GestureDetector(
                              onTap: (){},
                              child: const ServicesCard(
                                  leftWidth: 0.5,
                                  topWidth: 0.5,
                                  bottomWidth: 1,
                                  rightWidth: 1,
                                  icon: Icons.mobile_friendly,
                                  text: 'Ndalama')
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
        );
  }
}



