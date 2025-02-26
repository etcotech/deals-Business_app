import 'dart:convert';

import 'search_paginated_model.dart';

SearchResponseModel searchResponseModelFromJson(String str) =>
    SearchResponseModel.fromJson(json.decode(str));

String searchResponseModelToJson(SearchResponseModel data) =>
    json.encode(data.toJson());

class SearchResponseModel {
  final SearchPaginatedModel searchPaginatedModel;

  const SearchResponseModel({
    required this.searchPaginatedModel,
  });

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
        searchPaginatedModel: SearchPaginatedModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}