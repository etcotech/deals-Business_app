import 'dart:convert';

import 'category_paginate_model.dart';

CategoryListResponseModel categoryListResponseModelFromJson(String str) =>
    CategoryListResponseModel.fromJson(json.decode(str));

String categoryListResponseModelToJson(CategoryListResponseModel data) =>
    json.encode(data.toJson());

class CategoryListResponseModel {
  final CategoryPaginateModel categoryPaginateModel;

  const CategoryListResponseModel({
    required this.categoryPaginateModel,
  });

  factory CategoryListResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryListResponseModel(
        categoryPaginateModel: CategoryPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": CategoryPaginateModel.toJson(),
      };
}