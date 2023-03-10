// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaAddressModel _$TandizaAddressModelFromJson(Map<String, dynamic> json) =>
    TandizaAddressModel(
      addressType: json['address_type'] as String,
      addressLine1: json['address_line_1'] as String,
      addressLine2: json['address_line_2'] as String,
      addressLine3: json['address_line_3'] as String,
      addressLine4: json['address_line_4'] as String,
      postalCode: json['postal_code'] as String,
      owned: json['owned'] as String,
      monthsResided: json['months_resided'] as String,
    );

Map<String, dynamic> _$TandizaAddressModelToJson(
        TandizaAddressModel instance) =>
    <String, dynamic>{
      'address_type': instance.addressType,
      'address_line_1': instance.addressLine1,
      'address_line_2': instance.addressLine2,
      'address_line_3': instance.addressLine3,
      'address_line_4': instance.addressLine4,
      'postal_code': instance.postalCode,
      'owned': instance.owned,
      'months_resided': instance.monthsResided,
    };
