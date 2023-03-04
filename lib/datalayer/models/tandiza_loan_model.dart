import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_balance_model.dart';
import 'package:tandiza/datalayer/models/tandiza_status_model.dart';
import 'package:tandiza/domain/models/tandiza_loans_entity.dart';

part 'tandiza_loan_model.g.dart';

@JsonSerializable()
class TandizaLoanModel extends TandizaLoanEntity{

  @JsonKey(name: 'loan_id')
  final String loanId;
  @JsonKey(name: 'disbursed_date')
  final String disbursedDate;
  @JsonKey(name: 'number_of_repayments')
  final int numberOfRepayments;
  @JsonKey(name: 'next_instalment_date')
  final String nextInstalmentDate;

  final TandizaBalanceModel balances;
  final TandizaStatusModel status;

  TandizaLoanModel({required this.balances, required this.status, required this.nextInstalmentDate,required this.disbursedDate, required this.loanId,
    required this.numberOfRepayments}) : super(balances: balances, disbursedDate: disbursedDate,
  loanId: loanId, numberOfRepayments: numberOfRepayments, nextInstalmentDate: nextInstalmentDate);

  factory TandizaLoanModel.fromJson(Map<String, dynamic> json){
    return _$TandizaLoanModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaLoanModelToJson(this);
  }

}