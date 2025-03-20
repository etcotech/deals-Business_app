import 'dart:convert';

import 'package:deals_and_business/data/models/user/extra_auth_field.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/data/models/user/signup_user_model.dart';

import 'user_model.dart';

ProfileResponseModel profileResponseModelFromJson(Map<String,dynamic> str) =>
    ProfileResponseModel.fromJson(str);

String profileResponseModelToJson(ProfileResponseModel data) =>
    json.encode(data.toJson());

class ProfileResponseModel {
  final ProfileModel user;

  const ProfileResponseModel({
    required this.user,
  });

  factory ProfileResponseModel.fromJson(Map<String, dynamic> json) =>
      ProfileResponseModel(
        user: ProfileModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": user.toJson(),
      };
}