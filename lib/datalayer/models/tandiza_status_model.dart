import 'package:json_annotation/json_annotation.dart';
import 'package:tandiza/domain/models/tandiza_status_entity.dart';

part 'tandiza_status_model.g.dart';
@JsonSerializable()
class TandizaStatusModel extends TandizaStatusEntity{
  final String id;
  final String description;
  @JsonKey(name: 'active_status')
  final int activeStatus;

  TandizaStatusModel({required this.id, required this.description, required this.activeStatus,}) :super(activeStatus: activeStatus, id: id, description: description);

  factory TandizaStatusModel.fromJson(Map<String, dynamic> json){
    return _$TandizaStatusModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaStatusModelToJson(this);
  }
}