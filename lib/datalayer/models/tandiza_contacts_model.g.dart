// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_contacts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaContactModel _$TandizaContactModelFromJson(Map<String, dynamic> json) =>
    TandizaContactModel(
      contactType: json['contact_type'] as String,
      contactNumber: json['contact_number'] as String,
    );

Map<String, dynamic> _$TandizaContactModelToJson(
        TandizaContactModel instance) =>
    <String, dynamic>{
      'contact_type': instance.contactType,
      'contact_number': instance.contactNumber,
    };
