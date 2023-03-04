import 'package:tandiza/datalayer/models/tandiza_balance_model.dart';

class TandizaLoanEntity{
  final String loanId;
  final int numberOfRepayments;
  final String disbursedDate;
  final TandizaBalanceModel balances;
  final String nextInstalmentDate;

  TandizaLoanEntity({required this.balances, required this.nextInstalmentDate,required this.disbursedDate, required this.loanId,
  required this.numberOfRepayments});

}