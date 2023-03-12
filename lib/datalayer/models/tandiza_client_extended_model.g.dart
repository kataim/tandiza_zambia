// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_client_extended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaClientExtendedModel _$TandizaClientExtendedModelFromJson(
        Map<String, dynamic> json) =>
    TandizaClientExtendedModel(
      nrcNumber: json['nrcnumber'] as String,
      dateOfBirth: json['date_of_birth'] as String,
      surname: json['surname'] as String,
      firstName: json['firstnames'] as String,
      maritalStatus: json['marital_status'] as String,
      gender: json['gender'] as String,
      title: json['title'] as String,
      addresses: (json['addresses'] as List<dynamic>)
          .map((e) => TandizaAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      contacts: (json['contacts'] as List<dynamic>)
          .map((e) => TandizaContactModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      employerName: json['employer_name'] as String,
      employmentType: json['employment_type'] as String,
      occupation: json['occupation'] as String,
      resident: json['resident'] as String,
      contactNumber: json['nok_contact_number'] as String,
      employeeNumber: json['employee_number'] as String,
      engagementDate: json['engagement_date'] as String,
      fullNames: json['nok_fullnames'] as String,
      relationship: json['nok_relationship'] as String,
      supervisorName: json['supervisor_name'] as String,
      postalCode: json['postal_code'] as String,
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
      'contacts': instance.contacts.map((e) => e.toJson()).toList(),
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
      'employer_name': instance.employerName,
      'occupation': instance.occupation,
      'employment_type': instance.employmentType,
      'engagement_date': instance.engagementDate,
      'employee_number': instance.employeeNumber,
      'supervisor_name': instance.supervisorName,
      'nok_fullnames': instance.fullNames,
      'nok_relationship': instance.relationship,
      'nok_contact_number': instance.contactNumber,
      'postal_code': instance.postalCode,
    };
