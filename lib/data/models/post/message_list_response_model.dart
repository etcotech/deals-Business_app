import 'dart:convert';

import 'package:deals_and_business/data/models/post/message_list_paginate_model.dart';

import 'post_paginate_model.dart';

MessageListResponseModel messageListResponseModelFromJson(String str) =>
    MessageListResponseModel.fromJson(json.decode(str));

String messageListResponseModelToJson(MessageListResponseModel data) =>
    json.encode(data.toJson());

class MessageListResponseModel {
  final MessageListPaginateModel messageListPaginateModel;

  const MessageListResponseModel({
    required this.messageListPaginateModel,
  });

  factory MessageListResponseModel.fromJson(Map<String, dynamic> json) =>
      MessageListResponseModel(
        messageListPaginateModel: MessageListPaginateModel.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        // "result": PostPaginateModel.toJson(),
      };
}