// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tandiza_client_financials_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TandizaClientFinancialsModel _$TandizaClientFinancialsModelFromJson(
        Map<String, dynamic> json) =>
    TandizaClientFinancialsModel(
      result: json['result'],
      clientId: json['client_id'] as int?,
      firstName: json['firstnames'] as String?,
      surname: json['surname'],
      nrcNumber: json['nrcnumber'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      loans: (json['loans'] as List<dynamic>?)
          ?.map((e) => TandizaLoanModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      applications: (json['applications'] as List<dynamic>?)
          ?.map((e) =>
              TandizaApplicationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TandizaClientFinancialsModelToJson(
        TandizaClientFinancialsModel instance) =>
    <String, dynamic>{
      'surname': instance.surname,
      'result': instance.result,
      'loans': instance.loans,
      'applications': instance.applications,
      'client_id': instance.clientId,
      'firstnames': instance.firstName,
      'nrcnumber': instance.nrcNumber,
      'date_of_birth': instance.dateOfBirth,
    };
