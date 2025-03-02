import 'dart:convert';

import 'package:deals_and_business/data/models/category/category_subcategory_paginate_model.dart';

import 'category_paginate_model.dart';

CategorySubCategoryListResponseModel categorySubCategoryListResponseModelFromJson(String str) =>
    CategorySubCategoryListResponseModel.fromJson(json.decode(str));

String categorySubCategoryResponseModelToJson(CategorySubCategoryListResponseModel data) =>
    json.encode(data.toJson());

class CategorySubCategoryListResponseModel {
  final CategorySubcategoryPaginateModel categoryPaginateModel;

  const CategorySubCategoryListResponseModel({
    required this.categoryPaginateModel,
  });

  factory CategorySubCategoryListResponseModel.fromJson(Map<String, dynamic> json) =>
      CategorySubCategoryListResponseModel(
        categoryPaginateModel: CategorySubcategoryPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": CategoryPaginateModel.toJson(),
      };
}