// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_balance_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaBalanceModel _$TandizaBalanceModelFromJson(Map<String, dynamic> json) =>
    TandizaBalanceModel(
      id: json['id'] as int,
      principalDisbursed: json['principal_disbursed'] as String,
      principalOutstanding: json['principal_outstanding'] as String,
      originationFees: json['origination_fees'] as String,
      originationFeesOutstanding:
          json['origination_fees_outstanding'] as String,
      totalOverpaid: json['total_overpaid'] as String,
      interestOutstanding: json['interest_outstanding'] as String,
      totalReceivable: json['total_receivable'] as String,
      dueThisMonth: json['due_this_month'] as int,
      arrearsBalance: json['arrears_balance'] as int,
      paidInAdvance: json['paid_in_advance'] as int,
      numberOfPayments: json['number_of_payments'] as int,
      totalPayments: json['total_payments'] as String,
      instalmentsRemaining: json['instalments_remaining'] as int,
      totalInterestReceivable: json['total_interest_receivable'] as String,
      loanBalance: json['loan_balance'] as int,
    );

Map<String, dynamic> _$TandizaBalanceModelToJson(
        TandizaBalanceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'principal_disbursed': instance.principalDisbursed,
      'principal_outstanding': instance.principalOutstanding,
      'origination_fees': instance.originationFees,
      'origination_fees_outstanding': instance.originationFeesOutstanding,
      'total_overpaid': instance.totalOverpaid,
      'interest_outstanding': instance.interestOutstanding,
      'total_receivable': instance.totalReceivable,
      'due_this_month': instance.dueThisMonth,
      'arrears_balance': instance.arrearsBalance,
      'paid_in_advance': instance.paidInAdvance,
      'number_of_payments': instance.numberOfPayments,
      'total_payments': instance.totalPayments,
      'instalments_remaining': instance.instalmentsRemaining,
      'total_interest_receivable': instance.totalInterestReceivable,
      'loan_balance': instance.loanBalance,
    };
