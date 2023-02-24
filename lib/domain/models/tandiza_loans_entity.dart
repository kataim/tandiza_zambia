class TandizaLoan{
  final String loanId;
  final int numberOfRepayments;
  final DateTime disbursedDate;
  final double balance;

  TandizaLoan({required this.balance, required this.disbursedDate, required this.loanId,
  required this.numberOfRepayments});

}