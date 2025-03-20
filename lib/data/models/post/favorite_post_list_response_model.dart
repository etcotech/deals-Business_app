import 'dart:convert';

import 'package:deals_and_business/data/models/post/favorite_post_paginate_model.dart';

import 'post_paginate_model.dart';

FavoritePostListResponseModel favPostListResponseModelFromJson(Map<String,dynamic> str) =>
    FavoritePostListResponseModel.fromJson(str);

String favPostListResponseModelToJson(FavoritePostListResponseModel data) =>
    json.encode(data.toJson());

class FavoritePostListResponseModel {
  final FavoritePostPaginateModel favoritePostPaginateModel;

  const FavoritePostListResponseModel({
    required this.favoritePostPaginateModel,
  });

  factory FavoritePostListResponseModel.fromJson(Map<String, dynamic> json) =>
      FavoritePostListResponseModel(
        favoritePostPaginateModel: FavoritePostPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}