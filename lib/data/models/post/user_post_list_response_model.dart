import 'dart:convert';
import 'dart:developer';

import 'package:deals_and_business/data/models/post/post_model.dart';

import 'post_paginate_model.dart';

UserPostListResponseModel userPostListResponseModelFromJson(Map<String,dynamic> str) =>
    UserPostListResponseModel.fromJson(str);

String  userPostListResponseModelToJson(UserPostListResponseModel data) =>
    json.encode(data.toJson());

class UserPostListResponseModel {
  final List<PostModel> posts;

  const UserPostListResponseModel({
    required this.posts,
  });

  factory UserPostListResponseModel.fromJson(Map<String, dynamic> json) {

    log("NO PREOM REPSONE MODEL ${ json["result"]['posts'].runtimeType}");
    return UserPostListResponseModel(
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