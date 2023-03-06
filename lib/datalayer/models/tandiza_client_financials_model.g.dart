// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_client_financials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaClientFinancialsModel _$TandizaClientFinancialsModelFromJson(
        Map<String, dynamic> json) =>
    TandizaClientFinancialsModel(
      clientId: json['client_id'] as int?,
      firstName: json['firstnames'] as String?,
      surname: json['surname'] as String?,
      loans: (json['loans'] as List<dynamic>?)
          ?.map((e) => TandizaLoanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      applications: (json['applications'] as List<dynamic>?)
          ?.map((e) =>
              TandizaApplicationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nrcNumber: json['nrcnumber'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      result: json['result'] as String?,
    );

Map<String, dynamic> _$TandizaClientFinancialsModelToJson(
        TandizaClientFinancialsModel instance) =>
    <String, dynamic>{
      'loans': instance.loans?.map((e) => e.toJson()).toList(),
      'applications': instance.applications?.map((e) => e.toJson()).toList(),
      'client_id': instance.clientId,
      'firstnames': instance.firstName,
      'surname': instance.surname,
      'nrcnumber': instance.nrcNumber,
      'date_of_birth': instance.dateOfBirth,
      'result': instance.result,
    };
