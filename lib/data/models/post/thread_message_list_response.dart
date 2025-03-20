import 'dart:convert';

import 'package:deals_and_business/data/models/post/favorite_post_paginate_model.dart';
import 'package:deals_and_business/data/models/post/thread_message_paginate.dart';

import 'post_paginate_model.dart';

ThreadMessageListResponse threadMessagesListResponseModelFromJson(Map<String,dynamic> str) =>
    ThreadMessageListResponse.fromJson(str);

String threadMessagesListResponseModelToJson(ThreadMessageListResponse data) =>
    json.encode(data.toJson());

class ThreadMessageListResponse {
  final ThreadMessagePaginate threadMessagePaginate;

  const ThreadMessageListResponse({
    required this.threadMessagePaginate,
  });

  factory ThreadMessageListResponse.fromJson(Map<String, dynamic> json) =>
      ThreadMessageListResponse(
        threadMessagePaginate: ThreadMessagePaginate.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}