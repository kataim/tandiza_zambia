import 'package:json_annotation/json_annotation.dart';

part 'tandiza_client_created_model.g.dart';

@JsonSerializable(explicitToJson: true)
class TandizaClientCreatedModel {
  @JsonKey(name: 'client_id')
  final int ? clientId;
  TandizaClientCreatedModel({this.clientId});

  factory TandizaClientCreatedModel.fromJson(Map<String, dynamic> json){
    return _$TandizaClientCreatedModelFromJson(json);
  }

  Map<String, dynamic> toJson(){
    return _$TandizaClientCreatedModelToJson(this);
  }
}