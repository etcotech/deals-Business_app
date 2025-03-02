import 'dart:convert';

import 'package:deals_and_business/data/models/user/extra_auth_field.dart';
import 'package:deals_and_business/data/models/user/profile_model.dart';
import 'package:deals_and_business/data/models/user/signup_user_model.dart';
import 'package:deals_and_business/data/models/user/user_stats_model.dart';

import 'user_model.dart';

StatsResponseModel statsResponseModelFromJson(String str) =>
    StatsResponseModel.fromJson(json.decode(str));

String statsResponseModelToJson(StatsResponseModel data) =>
    json.encode(data.toJson());

class StatsResponseModel {
  final StatsModel statsModel;

  const StatsResponseModel({
    required this.statsModel,
  });

  factory StatsResponseModel.fromJson(Map<String, dynamic> json) =>
      StatsResponseModel(
        statsModel: StatsModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "result": statsModel.toJson(),
      };
}