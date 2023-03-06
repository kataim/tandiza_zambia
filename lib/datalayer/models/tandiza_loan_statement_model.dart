
import 'package:json_annotation/json_annotation.dart';

part 'tandiza_loan_statement_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TandizaLoanStatementModel {
  final String ? pdf;

  TandizaLoanStatementModel({this.pdf});

  factory TandizaLoanStatementModel.fromJson(Map<String, dynamic> ? json){
    return _$TandizaLoanStatementModelFromJson(json!);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaLoanStatementModelToJson(this);
  }
}