import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_balance_entity.dart';
import 'package:tandiza/domain/models/tandiza_status_entity.dart';

import '../../datalayer/models/tandiza_balance_model.dart';
import '../../datalayer/models/tandiza_status_model.dart';

class TandizaLoanEntity{
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

  TandizaLoanEntity({this.balances, this.status, this.nextInstalmentDate,this.disbursedDate, this.loanId,
  this.numberOfRepayments});

}
