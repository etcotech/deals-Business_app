import 'dart:convert';
import 'dart:developer';

import 'post_paginate_model.dart';

PostListResponseModel postListResponseModelFromJson(Map<String,dynamic> str) =>
    PostListResponseModel.fromJson(str);

String  postListResponseModelToJson(PostListResponseModel data) =>
    json.encode(data.toJson());

class PostListResponseModel {
  final PostPaginateModel postPaginateModel;

  const PostListResponseModel({
    required this.postPaginateModel,
  });

  factory PostListResponseModel.fromJson(Map<String, dynamic> json) {

    log("NO PREOM REPSONE MODEL");
    return PostListResponseModel(
        postPaginateModel: PostPaginateModel.fromJson(json["result"]),
      );
  }

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}