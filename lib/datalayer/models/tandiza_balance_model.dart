import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_balance_entity.dart';

part 'tandiza_balance_model.g.dart';

@JsonSerializable()
class TandizaBalanceModel{
  final int ? id;

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

  TandizaBalanceModel({
    this.id,
    this.principalDisbursed,
    this.principalOutstanding,
    this.originationFees,
    this.originationFeesOutstanding,
    this.totalOverpaid,
    this.interestOutstanding,
    this.totalReceivable,
    this.dueThisMonth,
    this.arrearsBalance,
    this.paidInAdvance,
    this.numberOfPayments,
    this.totalPayments,
    this.instalmentsRemaining,
    this.totalInterestReceivable,
    this.loanBalance,
  });

  factory TandizaBalanceModel.fromJson(Map<String, dynamic> json){
    return _$TandizaBalanceModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaBalanceModelToJson(this);
  }
}
