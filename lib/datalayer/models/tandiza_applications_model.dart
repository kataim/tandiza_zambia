import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_applications_entity.dart';

part 'tandiza_applications_model.g.dart';

@JsonSerializable()
class TandizaApplicationModel {
  final int ? application_id;
  final String ? application_status;
  final String ? application_datetime;
  final int ? loan_id;


  TandizaApplicationModel({this.application_id, this.application_status, this.loan_id, this.application_datetime, });


  factory TandizaApplicationModel.fromJson(Map<String, dynamic> json){
    return _$TandizaApplicationModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaApplicationModelToJson(this);
  }
}