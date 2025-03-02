class StatsModel {
  Posts? posts;
  int? savedSearch;
  Threads? threads;
  Transactions? transactions;

  StatsModel({this.posts, this.savedSearch, this.threads, this.transactions});

  StatsModel.fromJson(Map<String, dynamic> json) {
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
    savedSearch = json['savedSearch'];
    threads =
        json['threads'] != null ? new Threads.fromJson(json['threads']) : null;
    transactions = json['transactions'] != null
        ? new Transactions.fromJson(json['transactions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.toJson();
    }
    data['savedSearch'] = this.savedSearch;
    if (this.threads != null) {
      data['threads'] = this.threads!.toJson();
    }
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.toJson();
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
    published = json['published'];
    pendingApproval = json['pendingApproval'];
    archived = json['archived'];
    visits = json['visits'];
    favourite = json['favourite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['published'] = this.published;
    data['pendingApproval'] = this.pendingApproval;
    data['archived'] = this.archived;
    data['visits'] = this.visits;
    data['favourite'] = this.favourite;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['all'] = this.all;
    data['withNewMessage'] = this.withNewMessage;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['promotion'] = this.promotion;
    data['subscription'] = this.subscription;
    return data;
  }
}
