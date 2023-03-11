import 'package:flutter/cupertino.dart';
import 'package:tandiza/datalayer/models/tandiza_address_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_created_model.dart';
import 'package:tandiza/datalayer/models/tandiza_client_financials_model.dart';
import 'package:tandiza/datalayer/models/tandiza_contacts_model.dart';
import 'package:tandiza/datalayer/models/tandiza_loan_statement_model.dart';
import 'package:tandiza/domain/models/firebase_user_entity.dart';
import 'package:tandiza/domain/repository/repository_interface.dart';
import '../datalayer/models/firebase_user_model.dart';
import '../datalayer/repository/repository.dart';
import '../domain/models/tandiza_client_entity.dart';
import '../domain/models/tandiza_client_financials_entity.dart';
import '../domain/usecases/application_interface.dart';
import '../utilities/settings.dart';

class ApplicationFacade implements IUserInterface{
  final Repository  userRepository;

  ApplicationFacade({required this.userRepository});

  @override
  Future<TandizaClient?> getUserByNrc(String ? id) async {
    // TODO: implement getUser
    return userRepository.getUserByNrc(id);
  }

  /*@override
  Future<FirebaseUserEntity?> signInWithPhone(String phoneNumber, BuildContext context, TandizaClient ? tandizaClient) async {
    return userRepository.signInWithPhone(phoneNumber, context, tandizaClient);
  }*/

  @override
  Stream<FirebaseUserEntity?>? authStateChanges() {
    // TODO: implement authStateChanges
    return userRepository.authStateChanges();
  }

  @override
  Future<void> signOut() async {
    userRepository.signOut();
  }

  @override
  Future<void>? saveFirebaseUserData(FirebaseUserModel userModel) {
    // TODO: implement updateFirebaseUserData
    userRepository.saveFirebaseUserData(userModel);
  }

  @override
  Future<FirebaseUserEntity?> signInWithPhone({
    String ? phoneNumber,
    required BuildContext context,
    TandizaClientFinancialsModel? tandizaClientFinancials,
    int ? clientId,
    String? firstName,
    String? result,
    String? surname,
    String? nrcNumber,
    String? dateOfBirth}) async {
    // TODO: implement signInWithPhone
    return userRepository.signInWithPhone(
      phoneNumber : phoneNumber,
      context: context,
        tandizaClientFinancials: tandizaClientFinancials,
      clientId: clientId,
      firstName: firstName,
      result: result,
      surname: surname,
      nrcNumber: nrcNumber,
      dateOfBirth: dateOfBirth
    );
  }

  @override
  Future<FirebaseUserModel?> getFirebaseUserData() async {
    // TODO: implement getFirebaseUserData
    return userRepository.getFirebaseUserData();
  }

  @override
  Future<void>? updateFirebaseUserData(Map<String, dynamic> userJsonMap) {
    userRepository.updateFirebaseUserData(userJsonMap);
  }

  // set the qualify variable

  // val check_eligibility = can_client_afford_loan(loan_repayment, disposable_income, net_income)

  @override
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

  @override
  bool checkAffordabilityRatio1(int loanRepayment, int disposableIncome) {
    final affordabilityRatio1 = loanRepayment.toDouble() / disposableIncome.toDouble();
    var affordable = false;

    if (affordabilityRatio1 < MIN_AFFORDABILITY_RATIO_DISPOSABLE_INCOME) {
      affordable = true;
    }
    return affordable;
  }

  @override
  bool checkAffordabilityRatio2(int loanRepayment, int netIncome) {
    final affordabilityRatio2 = loanRepayment.toDouble() / netIncome.toDouble();
    var affordable = false;

    if (affordabilityRatio2 < MIN_AFFORDABILITY_RATIO_NETPAY) {
      affordable = true;
    }
    return affordable;
  }

  @override
  Future<void> loanStatement(String loanId) {
    // TODO: implement loanStatement
    throw UnimplementedError();
  }

  @override
  Future<void> saveClientFinancials(TandizaClientFinancialsModel financialsModel) async {
    userRepository.saveClientFinancials(financialsModel);
  }

  @override
  Future<TandizaClientFinancialsModel?> getClientFinancials(int ? clientId) async {
    return userRepository.getClientFinancials(clientId);
  }

  @override
  Future<TandizaLoanStatementModel?> getLoanStatement(int? loanId) {
    return userRepository.getLoanStatement(loanId);
  }

  @override
  Future<void> verifyPhoneNumber(String? phoneNumber, String ? verificationCode) async {
    userRepository.verifyPhoneNumber(phoneNumber, verificationCode);
  }

  @override
  Future<TandizaClientCreatedModel?> createTandizaClient(
      {String? nrcnumber, String? firstName,
        String? surname, String? dateOfBirth,
        String? phoneNumber, String? phoneProvider,
        String? title, String? gender, String? addressType,
        String? nokFullNames, String? nokRelationship, String? nokPhoneNumber,
        String? maritalStatus, List<TandizaContactModel>? contacts,
        List<TandizaAddressModel>? address, String? plotNumber,
        String? streetAddress, String? monthsResided,
        String? city, bool? isOwned, bool? isResident, String ? employerName,
        String ? employmentType,
        String ? occupation, String ? contactNumber,
        String ? employeeNumber, String ? engagementDate,}) async {
    return userRepository.createTandizaClient(
      nrcnumber: nrcnumber, firstName: firstName,
      surname: surname, dateOfBirth: dateOfBirth,
      phoneNumber: phoneNumber, phoneProvider: phoneProvider,
      title: title, gender: gender, addressType: addressType,
      nokFullNames: nokFullNames, nokRelationship: nokRelationship,
      nokPhoneNumber: nokPhoneNumber, maritalStatus: maritalStatus,
      contacts: [TandizaContactModel(contactNumber: phoneNumber, contactType: phoneProvider)],
      address: [TandizaAddressModel(addressType: addressType,
          addressLine1: plotNumber, addressLine2: streetAddress, addressLine3: city,
          addressLine4: null, postalCode: null, owned: isOwned! ? 'Yes': 'No', monthsResided: monthsResided)],
        employerName : employerName, employmentType : employmentType,
        occupation : occupation, contactNumber : contactNumber ,
        employeeNumber : employeeNumber, engagementDate : engagementDate
    );
  }
}