import 'dart:convert';

import 'package:deals_and_business/data/models/user/extra_auth_field.dart';
import 'package:deals_and_business/data/models/user/signup_user_model.dart';

import 'user_model.dart';

SignupResponseModel signupResponseModelFromJson(String str) =>
    SignupResponseModel.fromJson(json.decode(str));

String signupResponseModelToJson(SignupResponseModel data) =>
    json.encode(data.toJson());

class SignupResponseModel {
  final SignupUserModel user;

  const SignupResponseModel({
    required this.user,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      SignupResponseModel(
        user: SignupUserModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": user.toJson(),
      };
}