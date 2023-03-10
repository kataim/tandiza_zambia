// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_client_extended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaClientExtendedModel _$TandizaClientExtendedModelFromJson(
        Map<String, dynamic> json) =>
    TandizaClientExtendedModel(
      json['nrcnumber'] as String?,
      json['date_of_birth'] as String?,
      json['surname'] as String?,
      json['firstnames'] as String?,
      json['marital_status'] as String?,
      json['gender'] as String?,
      json['title'] as String?,
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => TandizaAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['contacts'] as List<dynamic>?)
          ?.map((e) => TandizaContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['employer_name'] as String?,
      json['employment_type'] as String?,
      json['occupation'] as String?,
      json['resident'] as String?,
      json['nok_contact_number'] as String?,
      json['employee_number'] as String?,
      json['engagement_date'] as String?,
      json['nok_fullnames'] as String?,
      json['relationship'] as String?,
      json['supervisor_name'] as String,
    );

Map<String, dynamic> _$TandizaClientExtendedModelToJson(
        TandizaClientExtendedModel instance) =>
    <String, dynamic>{
      'nrcnumber': instance.nrcNumber,
      'firstnames': instance.firstName,
      'date_of_birth': instance.dateOfBirth,
      'surname': instance.surname,
      'resident': instance.resident,
      'title': instance.title,
      'gender': instance.gender,
      'marital_status': instance.maritalStatus,
      'contacts': instance.contacts?.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses?.map((e) => e.toJson()).toList(),
      'employer_name': instance.employerName,
      'occupation': instance.occupation,
      'employment_type': instance.employmentType,
      'engagement_date': instance.engagementDate,
      'employee_number': instance.employeeNumber,
      'supervisor_name': instance.supervisorName,
      'nok_fullnames': instance.fullNames,
      'relationship': instance.relationship,
      'nok_contact_number': instance.contactNumber,
    };
