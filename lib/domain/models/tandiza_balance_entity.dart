class TandizaBalanceEntity {

  final int id;

  final double principalDisbursed;

  final double principalOutstanding;

  final double originationFees;

  final double originationFeesOutstanding;

  final double totalOverpaid;

  final double interestOutstanding;

  final double totalReceivable;

  final int dueThisMonth;

  final int arrearsBalance;

  final int paidInAdvance;

  final int numberOfPayments;

  final double totalPayments;

  final int instalmentsRemaining;

  final double totalInterestReceivable;

  final double loanBalance;

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