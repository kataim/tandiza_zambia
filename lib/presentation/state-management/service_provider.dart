import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../domain/models/firebase_user_entity.dart';
import '../../domain/models/tandiza_client_expenses.dart';
import '../../domain/models/tandiza_client_financials_entity.dart';
import '../../domain/models/tandiza_client_income.dart';
import '../../utilities/settings.dart';
import '../../utilities/utils.dart';

class ServiceProvider extends ChangeNotifier {
  final ApplicationFacade ? applicationFacade;
  ServiceProvider({this.applicationFacade});

  TandizaClient ? tandizaClient = TandizaClient();
  TandizaClientFinancialsModel ? clientFinancialsModel = TandizaClientFinancialsModel();
  FirebaseUserEntity ? firebaseUserEntity = FirebaseUserEntity();

  TandizaClientExpenses clientExpenses = TandizaClientExpenses();
  TandizaClientIncome clientIncome = TandizaClientIncome();
  bool ? canAffordLoan = false;

  bool? checkQualification ({required int requestAmount, required int netIncome, required int monthly_rent,
  required int monthly_water, required int monthly_electricity, required int monthlyFood}) {
    int amountRequested = requestAmount < MIN_LOAN_REQUEST_AMOUNT ? MIN_LOAN_REQUEST_AMOUNT : requestAmount;
    final totalExpenses =
        monthly_rent + monthly_water + monthly_electricity + monthlyFood;
    final netExpenses = totalExpenses < MIN_EXPENSES ? MIN_EXPENSES : totalExpenses;
    final disposableIncome = netIncome - netExpenses;
    final loanRepayment = (amountRequested + PERCENT_LOAN_INTEREST * amountRequested + MIN_FEES).toInt();
    canAffordLoan = applicationFacade?.canClientAffordLoan(loanRepayment, disposableIncome, netIncome);
    notifyListeners();
    return canAffordLoan;
  }



  Future<TandizaClient?> getClientData (String id) async {
    tandizaClient = await applicationFacade?.getUserByNrc(id);
    notifyListeners();
    return tandizaClient;
  }

  Future<TandizaClientFinancialsModel?> getClientFinancials (int ? clientId) async {
    clientFinancialsModel = await applicationFacade?.getClientFinancials(clientId);
    notifyListeners();
    return clientFinancialsModel;
  }

  Future<FirebaseUserEntity?> signInWithPhone(
      {String ? phoneNumber,
        required BuildContext context,
        TandizaClientFinancialsModel ? tandizaClientFinancials,
        int ? clientId,
        String ? firstName,
        String ? result,
        String ? surname,
        String ? nrcNumber,
        String ? dateOfBirth}) async {
    firebaseUserEntity = await applicationFacade?.signInWithPhone(
        phoneNumber: phoneNumber,
        context : context,
        tandizaClientFinancials: tandizaClientFinancials,
        clientId: clientId,
    firstName: firstName,
    result: result,
    surname: surname,
    nrcNumber: nrcNumber,
    dateOfBirth: dateOfBirth);
    notifyListeners();
    return firebaseUserEntity;
  }

  Future<void> saveFirebaseUser(FirebaseUserModel userModel) async {
    applicationFacade?.saveFirebaseUserData(userModel);
  }

  Future<void> saveClientFinancialData(TandizaClientFinancialsModel financialsModel) async {
    applicationFacade?.saveClientFinancials(financialsModel);
}

  Future<void> updateFirebaseUser(Map<String, dynamic> userJsonMap) async {
    applicationFacade?.updateFirebaseUserData(userJsonMap);
  }

  Stream<FirebaseUserEntity?>? onAuthStateChanges () {
    return applicationFacade?.authStateChanges();
  }

  Future<void> signOut () async {
    applicationFacade?.signOut();
  }

  Future<FirebaseUserModel?> getFirebaseUser() async {
    return applicationFacade?.getFirebaseUserData();
  }

}

