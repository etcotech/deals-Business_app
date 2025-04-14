import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/data/models/post/post_model.dart';

import 'post_paginate_model.dart';

SubcategoryPostResponse subCategoryPostListResponseModelFromJson(Map<String,dynamic> str) =>
    SubcategoryPostResponse.fromJson(str);

String  subCategoryPostListResponseModelToJson(SubcategoryPostResponse data) =>
    json.encode(data.toJson());

class SubcategoryPostResponse {
  final List<PostModel> posts;

  const SubcategoryPostResponse({
    required this.posts,
  });

  factory SubcategoryPostResponse.fromJson(Map<String, dynamic> json) {

    log("NO PREOM REPSONE MODEL ${ json["result"]['posts'].runtimeType}");
    return SubcategoryPostResponse(
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