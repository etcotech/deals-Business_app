import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/data/models/post/post_model.dart';

import 'post_paginate_model.dart';

CategoryPostResponse categoryPostListResponseModelFromJson(Map<String,dynamic> str) =>
    CategoryPostResponse.fromJson(str);

String  categoryPostListResponseModelToJson(CategoryPostResponse data) =>
    json.encode(data.toJson());

class CategoryPostResponse {
  final List<PostModel> posts;

  const CategoryPostResponse({
    required this.posts,
  });

  factory CategoryPostResponse.fromJson(Map<String, dynamic> json) {

    log("NO PREOM REPSONE MODEL ${ json["result"]['posts'].runtimeType}");
    return CategoryPostResponse(
        posts: json["result"]['posts'] != null
            ? List<PostModel>.from(json["result"]['posts'].map((x) => 
              PostModel.fromJson(x)))       
            : [],
  
        
      );
  }

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}