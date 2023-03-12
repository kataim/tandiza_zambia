import 'package:json_annotation/json_annotation.dart';

part 'tandiza_address_model.g.dart';

@JsonSerializable()
class TandizaAddressModel {
  @JsonKey(name: 'address_type')
  final String ? addressType;

  @JsonKey(name: 'address_line_1')
  final String ? addressLine1;

  @JsonKey(name: 'address_line_2')
  final String ? addressLine2;

  @JsonKey(name: 'address_line_3')
  final String ? addressLine3;

  @JsonKey(name: 'address_line_4')
  final String ? addressLine4;

  @JsonKey(name: 'postal_code')
  final String postalCode;

  @JsonKey(name: 'owned')
  final String ? owned;

  @JsonKey(name: 'months_resided')
  final String ? monthsResided;

  TandizaAddressModel({
    this.addressType,
    this.addressLine1,
    this.addressLine2,
    this.addressLine3,
    this.addressLine4,
    required this.postalCode,
    this.owned,
    this.monthsResided,
  });

  factory TandizaAddressModel.fromJson(Map<String, dynamic> json) => _$TandizaAddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$TandizaAddressModelToJson(this);
}
