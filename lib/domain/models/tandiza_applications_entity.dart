class TandizaApplicationEntity {
  final int ? application_id;
  final String ? application_status;
  final String ? application_datetime;
  final int ? loan_id;

  TandizaApplicationEntity({required this.application_id, required this.application_status,
    required this.loan_id,
    required this.application_datetime,
});
}