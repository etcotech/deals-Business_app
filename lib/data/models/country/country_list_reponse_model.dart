import 'dart:convert';

import 'country_list_paginate_model.dart';

CountryListResponseModel countryListResponseModelFromJson(String str) =>
    CountryListResponseModel.fromJson(json.decode(str));

StringcountryListResponseModelToJson(CountryListResponseModel data) =>
    json.encode(data.toJson());

class CountryListResponseModel {
  final CountryListPaginateModel countryListPaginateModel;

  const CountryListResponseModel({
    required this.countryListPaginateModel,
  });

  factory CountryListResponseModel.fromJson(Map<String, dynamic> json) =>
      CountryListResponseModel(
        countryListPaginateModel: CountryListPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}