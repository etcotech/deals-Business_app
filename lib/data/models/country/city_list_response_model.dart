import 'dart:convert';

import 'package:deals_and_business/data/models/country/city_list_paginate_model.dart';

CityListResponseModel cityListResponseModelFromJson(String str) =>
    CityListResponseModel.fromJson(json.decode(str));

cityListResponseModelToJson(CityListResponseModel data) =>
    json.encode(data.toJson());

class CityListResponseModel {
  final CityPaginateModel cityPaginateModel;

  const CityListResponseModel({
    required this.cityPaginateModel,
  });

  factory CityListResponseModel.fromJson(Map<String, dynamic> json) =>
      CityListResponseModel(
        cityPaginateModel: CityPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}