// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaStatusModel _$TandizaStatusModelFromJson(Map<String, dynamic> json) =>
    TandizaStatusModel(
      id: json['id'] as String?,
      activeStatus: json['active_status'] as int?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$TandizaStatusModelToJson(TandizaStatusModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'active_status': instance.activeStatus,
    };
