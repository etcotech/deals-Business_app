import 'dart:convert';

import 'package:deals_and_business/data/models/post/post_details_model.dart';

PostDetailsResponseModel postDetailsResponseFromJson(String str) =>
    PostDetailsResponseModel.fromJson(json.decode(str));

String postDetailsResponseToJson(PostDetailsResponseModel data) =>
    json.encode(data.toJson());

class PostDetailsResponseModel {
  final PostDetailsModel postDetailsModel;

  const PostDetailsResponseModel({
    required this.postDetailsModel,
  });

  factory PostDetailsResponseModel.fromJson(Map<String, dynamic> json) =>
      PostDetailsResponseModel(
        postDetailsModel: PostDetailsModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}