// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaLoanModel _$TandizaLoanModelFromJson(Map<String, dynamic> json) =>
    TandizaLoanModel(
      balances: TandizaBalanceModel.fromJson(
          json['balances'] as Map<String, dynamic>),
      status:
          TandizaStatusModel.fromJson(json['status'] as Map<String, dynamic>),
      nextInstalmentDate: json['next_instalment_date'] as String,
      disbursedDate: json['disbursed_date'] as String,
      loanId: json['loan_id'] as String,
      numberOfRepayments: json['number_of_repayments'] as int,
    );

Map<String, dynamic> _$TandizaLoanModelToJson(TandizaLoanModel instance) =>
    <String, dynamic>{
      'loan_id': instance.loanId,
      'disbursed_date': instance.disbursedDate,
      'number_of_repayments': instance.numberOfRepayments,
      'next_instalment_date': instance.nextInstalmentDate,
      'balances': instance.balances,
      'status': instance.status,
    };
