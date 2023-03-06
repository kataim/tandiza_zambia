import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/datalayer/models/tandiza_balance_model.dart';
import 'package:tandiza/datalayer/models/tandiza_status_model.dart';
import 'package:tandiza/domain/models/tandiza_loans_entity.dart';

part 'tandiza_loan_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TandizaLoanModel{
  @JsonKey(name: 'loan_id')
  final int ? loanId;
  @JsonKey(name: 'number_of_repayments')
  final int ? numberOfRepayments;
  @JsonKey(name: 'disbursed_date')
  final String ? disbursedDate;
  final TandizaBalanceModel ? balances;
  final TandizaStatusModel ? status;
  @JsonKey(name: 'next_instalment_date')
  final String ? nextInstalmentDate;


  TandizaLoanModel({this.balances, this.status, this.nextInstalmentDate,this.disbursedDate, this.loanId,
    this.numberOfRepayments});

  factory TandizaLoanModel.fromJson(Map<String, dynamic> json){
    return _$TandizaLoanModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaLoanModelToJson(this);
  }

}