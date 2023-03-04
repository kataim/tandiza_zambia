import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_applications_entity.dart';

part 'tandiza_applications_model.g.dart';

@JsonSerializable()
class TandizaApplicationModel extends TandizaApplication{


  TandizaApplicationModel({application_id, application_status, loan_id, application_datetime, }) :
        super(application_datetime: application_datetime,
      application_id: application_id, loan_id: loan_id,
      application_status:application_status);

  factory TandizaApplicationModel.fromJson(Map<String, dynamic> json){
    return _$TandizaApplicationModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaApplicationModelToJson(this);
  }
}