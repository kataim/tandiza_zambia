// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_applications_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaApplicationModel _$TandizaApplicationModelFromJson(
        Map<String, dynamic> json) =>
    TandizaApplicationModel(
      application_id: json['application_id'],
      application_status: json['application_status'],
      loan_id: json['loan_id'],
      application_datetime: json['application_datetime'],
    );

Map<String, dynamic> _$TandizaApplicationModelToJson(
        TandizaApplicationModel instance) =>
    <String, dynamic>{
      'application_id': instance.application_id,
      'application_status': instance.application_status,
      'application_datetime': instance.application_datetime,
      'loan_id': instance.loan_id,
    };
