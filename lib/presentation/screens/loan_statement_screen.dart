import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/datasources/firebase_database_api.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_statement_model.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';

import '../../datalayer/models/tandiza_client_financials_model.dart';

class LoanStatementScreen extends StatefulWidget {
  const LoanStatementScreen({Key? key}) : super(key: key);
  static const String id = 'loan_statement_screen';

  @override
  State<LoanStatementScreen> createState() => _LoanStatementScreenState();
}

class _LoanStatementScreenState extends State<LoanStatementScreen> {
  late Future<TandizaClientFinancialsModel?> clientFinancials;
  void initialise () async {
    final String? uid = FirebaseAuth.instance.currentUser?.uid;
    clientFinancials = FirebaseDatabaseService(uid: uid).getUserFinancialData();
  }

  @override
  void initState() {
    initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Statement'),
        centerTitle: true,
      ),
      body: FutureBuilder<TandizaClientFinancialsModel?>(
        future: clientFinancials,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return ListView.builder(itemBuilder: (BuildContext context, int index){
              return Column(
                children: [
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10,),
                        Text('Loan ID: ${snapshot.data?.loans?[index].loanId}'),
                        const SizedBox(height: 10,),
                        Text('ZMW ${snapshot.data?.loans?[index].balances?.loanBalance}',
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w500),),
                        const SizedBox(height: 10,),
                      ],
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Due: ${snapshot.data?.loans?[index].nextInstalmentDate}', style: const TextStyle(fontSize: 16),),
                        Text('Amount: ${snapshot.data?.loans?[index].balances?.dueThisMonth}', style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  const Divider()
                ],
              );
            }, itemCount: snapshot.data?.loans?.length,);
          }
          return const Center(child: CircularProgressIndicator(),);
        }
      )
    );
  }
}
