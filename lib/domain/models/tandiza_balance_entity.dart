import 'package:json_annotation/json_annotation.dart';

class TandizaBalanceEntity {

  final int id;

  @JsonKey(name: 'principal_disbursed')
  String ? principalDisbursed;

  @JsonKey(name: 'principal_outstanding')
  String ? principalOutstanding;

  @JsonKey(name: 'origination_fees')
  String ? originationFees;

  @JsonKey(name: 'origination_fees_outstanding')
  String ? originationFeesOutstanding;

  @JsonKey(name: 'total_overpaid')
  String ? totalOverpaid;

  @JsonKey(name: 'interest_outstanding')
  String ? interestOutstanding;

  @JsonKey(name: 'total_receivable')
  String ? totalReceivable;

  @JsonKey(name: 'due_this_month')
  int ? dueThisMonth;

  @JsonKey(name: 'arrears_balance')
  int ? arrearsBalance;

  @JsonKey(name: 'paid_in_advance')
  int ? paidInAdvance;

  @JsonKey(name: 'number_of_payments')
  int ? numberOfPayments;

  @JsonKey(name: 'total_payments')
  String ? totalPayments;

  @JsonKey(name: 'instalments_remaining')
  int ? instalmentsRemaining;

  @JsonKey(name: 'total_interest_receivable')
  String ? totalInterestReceivable;

  @JsonKey(name: 'loan_balance')
  int ? loanBalance;


  TandizaBalanceEntity({
    required this.id,
    required this.principalDisbursed,
    required this.principalOutstanding,
    required this.originationFees,
    required this.originationFeesOutstanding,
    required this.totalOverpaid,
    required this.interestOutstanding,
    required this.totalReceivable,
    required this.dueThisMonth,
    required this.arrearsBalance,
    required this.paidInAdvance,
    required this.numberOfPayments,
    required this.totalPayments,
    required this.instalmentsRemaining,
    required this.totalInterestReceivable,
    required this.loanBalance,
  });}