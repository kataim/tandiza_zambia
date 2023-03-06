import 'package:json_annotation/json_annotation.dart';

part 'tandiza_status_model.g.dart';
@JsonSerializable(explicitToJson: true)
class TandizaStatusModel{
  final String ? id;
  final String ? description;
  @JsonKey(name: 'active_status')
  final int ? activeStatus;


  TandizaStatusModel({this.id, this.activeStatus, this.description});

  factory TandizaStatusModel.fromJson(Map<String, dynamic> json){
    return _$TandizaStatusModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaStatusModelToJson(this);
  }
}