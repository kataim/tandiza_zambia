import 'package:json_annotation/json_annotation.dart';

part 'tandiza_contacts_model.g.dart';

@JsonSerializable()
class TandizaContactModel {
  @JsonKey(name: 'contact_type')
  final String ? contactType;

  @JsonKey(name: 'contact_number')
  final String ? contactNumber;

  TandizaContactModel({
    this.contactType,
    this.contactNumber,
  });

  factory TandizaContactModel.fromJson(Map<String, dynamic> json) =>
      _$TandizaContactModelFromJson(json);

  Map<String, dynamic> toJson() => _$TandizaContactModelToJson(this);
}
