import 'dart:developer';

class StatsModel {
  Posts? posts;
  int? savedSearch;
  Threads? threads;
  Transactions? transactions;

  StatsModel({this.posts, this.savedSearch, this.threads, this.transactions});

  StatsModel.fromJson(Map<String, dynamic> json) {
    posts = json['posts'] != null ? Posts.fromJson(json['posts']) : null;
    savedSearch = json['savedSearch'];
    threads =
        json['threads'] != null ? Threads.fromJson(json['threads']) : null;
    transactions = json['transactions'] != null
        ? Transactions.fromJson(json['transactions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (posts != null) {
      data['posts'] = posts!.toJson();
    }
    data['savedSearch'] = savedSearch;
    if (threads != null) {
      data['threads'] = threads!.toJson();
    }
    if (transactions != null) {
      data['transactions'] = transactions!.toJson();
    }
    return data;
  }
}

class Posts {
  int? published;
  int? pendingApproval;
  int? archived;
  int? visits;
  int? favourite;

  Posts(
      {this.published,
      this.pendingApproval,
      this.archived,
      this.visits,
      this.favourite});

  Posts.fromJson(Map<String, dynamic> json) {

    published = int.parse(json['published']?.toString()??'0');
    pendingApproval =int.parse( json['pendingApproval']?.toString()??'0');
    archived = int.parse(json['archived']?.toString()??'0');
    visits =int.parse( json['visits']?.toString()??'0');
    favourite = int.parse(json['favourite']?.toString()??'0');
                        log("HERe");

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['published'] = published;
    data['pendingApproval'] = pendingApproval;
    data['archived'] = archived;
    data['visits'] = visits;
    data['favourite'] = favourite;
    return data;
  }
}

class Threads {
  int? all;
  int? withNewMessage;

  Threads({this.all, this.withNewMessage});

  Threads.fromJson(Map<String, dynamic> json) {
    all = json['all'];
    withNewMessage = json['withNewMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['all'] = all;
    data['withNewMessage'] = withNewMessage;
    return data;
  }
}

class Transactions {
  int? promotion;
  int? subscription;

  Transactions({this.promotion, this.subscription});

  Transactions.fromJson(Map<String, dynamic> json) {
    promotion = json['promotion'];
    subscription = json['subscription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['promotion'] = promotion;
    data['subscription'] = subscription;
    return data;
  }
}
