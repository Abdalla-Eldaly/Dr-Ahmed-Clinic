import 'package:json_annotation/json_annotation.dart';
part 'responses.g.dart' ;


@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;

  @JsonKey(name: 'message')
  String? message;


}

@JsonSerializable()
class CustomerResponse {
  @JsonKey(name: 'id')
  String? id;

  @JsonKey(name: 'name')
  String? name;

  @JsonKey(name: 'email')
  int? numberOfNotification;

CustomerResponse(this.id,this.name,this.numberOfNotification);

  factory CustomerResponse.fromJson(Map<String,dynamic>json) => _$CustomerResponseFromJson(json);

  Map<String,dynamic> toJson() => _$CustomerResponseToJson(this);

}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: 'phone')
  String? phone;

  @JsonKey(name: 'email')
  String? email;

  ContactsResponse(this.phone,this.email);
  factory ContactsResponse.fromJson(Map<String,dynamic>json) => _$ContactsResponseFromJson(json);

  Map<String,dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class AuthenticationResponse extends BaseResponse{
  @JsonKey(name: 'customer')
  CustomerResponse? customer;

  @JsonKey(name: 'contacts')
  ContactsResponse? contacts;

  AuthenticationResponse(this.customer,this.contacts);

  factory AuthenticationResponse.fromJson(Map<String,dynamic>json) => _$AuthenticationResponseFromJson(json);

  Map<String,dynamic> toJson() => _$AuthenticationResponseToJson(this);
}
