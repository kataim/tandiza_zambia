import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:tandiza/datalayer/models/firebase_user_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/presentation/state-management/service_provider.dart';

import '../models/tandiza_loan_statement_model.dart';

class FirebaseDatabaseService {
  final String ? uid;
  ServiceProvider _serviceProvider = ServiceProvider();

  FirebaseDatabaseService({this.uid});

  Future<void> saveUserData(FirebaseUserModel userData) async {
    FirebaseFirestore.instance
        .collection('tandiza_client')
        .doc(uid)
        .set(userData.toJson());
  }

  Future<void> saveClientFinancialData(TandizaClientFinancialsModel financialsModel)async {
    FirebaseFirestore.instance
        .collection('client_financial_data')
        .doc(uid)
        .set(financialsModel.toJson());
  }


  Future<FirebaseUserModel> getUserData() async {
    final userData =
    await FirebaseFirestore.instance.collection('tandiza_client').doc(uid).get();
    return FirebaseUserModel.fromJson(userData.data());
  }

  Future<TandizaLoanStatementModel?> getUserFinancialData() async {
    final userFinancialData =
    await FirebaseFirestore.instance.collection('client_financial_data').doc(uid).get();
    final userFinancialModel = TandizaClientFinancialsModel.fromJson(userFinancialData.data());
    return _serviceProvider.getLoanStatement(userFinancialModel.loans?[0].loanId);


  }

  Future<void> updateUserData(Map<String, dynamic> userJsonMap) async {
    FirebaseFirestore.instance
        .collection('tandiza_client')
        .doc(uid)
        .update(userJsonMap);
  }
}