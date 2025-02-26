import 'dart:convert';

import 'post_paginate_model.dart';

PostListResponseModel postListResponseModelFromJson(String str) =>
    PostListResponseModel.fromJson(json.decode(str));

String authenticationResponseModelToJson(PostListResponseModel data) =>
    json.encode(data.toJson());

class PostListResponseModel {
  final PostPaginateModel postPaginateModel;

  const PostListResponseModel({
    required this.postPaginateModel,
  });

  factory PostListResponseModel.fromJson(Map<String, dynamic> json) =>
      PostListResponseModel(
        postPaginateModel: PostPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}