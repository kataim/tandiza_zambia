import 'package:flutter/cupertino.dart';
import 'package:tandiza/datalayer/models/tandiza_client_created_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_statement_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';

import '../../datalayer/models/firebase_user_model.dart';
import '../../datalayer/models/tandiza_address_model.dart';
import '../../datalayer/models/tandiza_client_model.dart';
import '../../datalayer/models/tandiza_contacts_model.dart';
import '../models/tandiza_client_entity.dart';
import '../models/tandiza_client_financials_entity.dart';

abstract class IUserInterface {
  Future<TandizaClient?> getUserByNrc(String ? id);
  Future<TandizaClientCreatedModel?> createTandizaClient(
  {String? nrcnumber,
    String? firstName, String ? employerName, String ? employmentType,
    String ? occupation, String ? contactNumber,
    String ? employeeNumber, String ? engagementDate,
    String? surname, String? dateOfBirth, String? phoneNumber,
    String? phoneProvider, String? title, String? gender,
    String? addressType, String? nokFullNames, String? nokRelationship,
    String? nokPhoneNumber, String? maritalStatus,
    List<TandizaContactModel>? contacts, List<TandizaAddressModel>? address,
    String ? plotNumber, String ? streetAddress, String ? monthsResided, String ? city,
    bool ? isOwned, bool ? isResident}
      );
  Future<TandizaLoanStatementModel?> getLoanStatement(int ? loanId);
  Future<TandizaClientFinancialsModel?> getClientFinancials(int ? clientId);
  Future<FirebaseUserEntity?> signInWithPhone({String phoneNumber,
    required BuildContext context,
    TandizaClientFinancialsModel ? tandizaClientFinancials,
    int clientId,
    String ? firstName,
    String ? result,
    String ? surname,
    String ? nrcNumber,
    String ? dateOfBirth});
  Stream<FirebaseUserEntity?> ? authStateChanges();
  Future<void> signOut();
  Future<void> ? saveFirebaseUserData(FirebaseUserModel userModel);
  Future<FirebaseUserModel?> getFirebaseUserData();
  Future<void> ? updateFirebaseUserData(Map<String, dynamic> userJsonMap);
  bool canClientAffordLoan(int loanRepayment, int disposableIncome, int netIncome);
  bool checkAffordabilityRatio1(int loanRepayment, int disposableIncome);
  bool checkAffordabilityRatio2(int loanRepayment, int netIncome);
  Future<void> loanStatement (String loanId);
  Future<void> verifyPhoneNumber(String ? phoneNumber, String ? verificationCode);
  Future<void> saveClientFinancials(TandizaClientFinancialsModel financialsModel);
}

