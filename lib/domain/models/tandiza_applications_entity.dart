class TandizaApplication {
  final String application_id;
  final String application_status;
  final String application_datetime;
  final String loan_id;

  TandizaApplication(this.application_id, this.application_status, this.loan_id, {
    required this.application_datetime,
});
}