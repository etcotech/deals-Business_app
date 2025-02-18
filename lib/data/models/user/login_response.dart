import 'dart:convert';

import 'package:deals_and_business/data/models/user/extra_auth_field.dart';

import 'user_model.dart';

LoginResponseModel authenticationResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String authenticationResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

class LoginResponseModel {
  final ExtraAuthModel extraAuthModel;
  final UserModel user;

  const LoginResponseModel({
    required this.extraAuthModel,
    required this.user,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        extraAuthModel: ExtraAuthModel.fromJson(json["extra"]),
        user: UserModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "extra": extraAuthModel.toJson(),
        "result": user.toJson(),
      };
}