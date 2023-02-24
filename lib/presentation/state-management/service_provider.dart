import 'package:flutter/cupertino.dart';
import 'package:tandiza/application/application_facade.dart';
import 'package:tandiza/domain/models/tandiza_client_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../domain/models/firebase_user_entity.dart';
import '../../domain/models/tandiza_client_expenses.dart';
import '../../domain/models/tandiza_client_income.dart';
import '../../utilities/settings.dart';
import '../../utilities/utils.dart';

class ServiceProvider extends ChangeNotifier {
  final ApplicationFacade ? applicationFacade;
  ServiceProvider({this.applicationFacade});

  TandizaClient ? tandizaClient = TandizaClient();
  FirebaseUserEntity ? firebaseUserEntity = FirebaseUserEntity();

  TandizaClientExpenses clientExpenses = TandizaClientExpenses();
  TandizaClientIncome clientIncome = TandizaClientIncome();
  int requestedAmount = 0;
  bool qualify = false;

    // Determine if Client can afford the amount requested.
    // takes a TandizaClientExpenses object
    // calculates affordability ratio from it.

    // Min possible loan amount as place holder
    /*int amountRequested = requestedAmount < MIN_LOAN_REQUEST_AMOUNT ? MIN_LOAN_REQUEST_AMOUNT : requestedAmount;


    final netIncome = clientIncome.net_pay; // + clientExpenses.oneOffDeductible
    // client won't know this.

    // If net expenses greater than min, set to sum, else set to min
    final totalExpenses =
        clientExpenses.monthly_rent + clientExpenses.monthlyWater + clientExpenses.monthlyElectricity + clientExpenses.monthlyFoodGroceries;

    final netExpenses = totalExpenses < MIN_EXPENSES ? MIN_EXPENSES : totalExpenses;
    final disposableIncome = netIncome - netExpenses;
    final loanRepayment = (amountRequested + PERCENT_LOAN_INTEREST * amountRequested + MIN_FEES).toInt();
    qualify = canClientAffordLoan(loanRepayment, disposableIncome, netIncome);*/


  // set the qualify variable

  // val check_eligiblity = can_client_afford_loan(loan_repayment, disposable_income, net_income)

  bool canClientAffordLoan(int loanRepayment, int disposableIncome, int netIncome) {
    var affordability = false;
    if (checkAffordabilityRatio1(loanRepayment, disposableIncome) && (checkAffordabilityRatio2(loanRepayment, netIncome))) {
      affordability = true;
    }
    return affordability;
  }

  // calculate
  // 1. Affordability ratio 1 After expenses
  // 2. Affordability ratio 2 Before expenses

  // After expenses
  bool checkAffordabilityRatio1(int loanRepayment, int disposableIncome) {
    final affordabilityRatio1 = loanRepayment.toDouble() / disposableIncome.toDouble();
    var affordable = false;

    if (affordabilityRatio1 < MIN_AFFORDABILITY_RATIO_DISPOSABLE_INCOME) {
      affordable = true;
    }
    return affordable;
  }

  // Before expenses
  bool checkAffordabilityRatio2(int loanRepayment, int netIncome) {
    final affordabilityRatio2 = loanRepayment.toDouble() / netIncome.toDouble();
    var affordable = false;

    if (affordabilityRatio2 < MIN_AFFORDABILITY_RATIO_NETPAY) {
      affordable = true;
    }
    return affordable;
  }


  Future<TandizaClient?> getClientData (String id) async {
    tandizaClient = await applicationFacade?.getUserByNrc(id);
    notifyListeners();
    return tandizaClient;
  }

  Future<FirebaseUserEntity?> signInWithPhone(
      {String ? phoneNumber,
        required BuildContext context,
        TandizaClient ? tandizaClient,
        int ? clientId,
        String ? firstName,
        String ? result,
        String ? surname,
        String ? nrcNumber,
        String ? dateOfBirth}) async {
    firebaseUserEntity = await applicationFacade?.signInWithPhone(
        phoneNumber: phoneNumber,
        context : context,
        tandizaClient: tandizaClient,
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

class AffordabilityCheck {

}
