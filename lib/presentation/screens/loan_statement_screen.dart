import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tandiza/datalayer/datasources/firebase_database_api.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_statement_model.dart';

class LoanStatementScreen extends StatefulWidget {
  const LoanStatementScreen({Key? key}) : super(key: key);
  static const String id = 'loan_statement_screen';

  @override
  State<LoanStatementScreen> createState() => _LoanStatementScreenState();
}

class _LoanStatementScreenState extends State<LoanStatementScreen> {
  late Future<TandizaLoanStatementModel?> getUserFinancialData;

  void initialise() async {
    String ? uid = FirebaseAuth.instance.currentUser?.uid;
    getUserFinancialData = FirebaseDatabaseService(uid: uid).getUserFinancialData();
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
      body: FutureBuilder<TandizaLoanStatementModel?>(
        future: getUserFinancialData,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Text(snapshot.data?.pdf ?? '');
          }
            return const Center(child: CircularProgressIndicator(),);
        }
      ),
    );
  }
}
