// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_loan_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaLoanModel _$TandizaLoanModelFromJson(Map<String, dynamic> json) =>
    TandizaLoanModel(
      balances: json['balances'] == null
          ? null
          : TandizaBalanceModel.fromJson(
              json['balances'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : TandizaStatusModel.fromJson(json['status'] as Map<String, dynamic>),
      nextInstalmentDate: json['next_instalment_date'] as String?,
      disbursedDate: json['disbursed_date'] as String?,
      loanId: json['loan_id'] as int?,
      numberOfRepayments: json['number_of_repayments'] as int?,
    );

Map<String, dynamic> _$TandizaLoanModelToJson(TandizaLoanModel instance) =>
    <String, dynamic>{
      'loan_id': instance.loanId,
      'number_of_repayments': instance.numberOfRepayments,
      'disbursed_date': instance.disbursedDate,
      'balances': instance.balances?.toJson(),
      'status': instance.status?.toJson(),
      'next_instalment_date': instance.nextInstalmentDate,
    };
