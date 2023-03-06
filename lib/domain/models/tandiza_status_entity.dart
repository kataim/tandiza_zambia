import 'package:json_annotation/json_annotation.dart';

class TandizaStatusEntity {
  final String ? id;
  final String ? description;
  @JsonKey(name: 'active_status')
  final int ? activeStatus;

  TandizaStatusEntity({this.id, this.activeStatus, this.description});
}