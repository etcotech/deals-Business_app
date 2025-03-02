class MessageModel {
  int? id;
  int? postId;
  String? subject;
  String? updatedAt;
  LatestMessage? latestMessage;
  bool? pIsUnread;
  PCreator? pCreator;
  bool? pIsImportant;

  MessageModel(
      {this.id,
      this.postId,
      this.subject,
      this.updatedAt,
      this.latestMessage,
      this.pIsUnread,
      this.pCreator,
      this.pIsImportant});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    subject = json['subject'];
    updatedAt = json['updated_at'];
    latestMessage = json['latest_message'] != null
        ? LatestMessage.fromJson(json['latest_message'])
        : null;
    pIsUnread = json['p_is_unread'];
    pCreator = json['p_creator'] != null
        ? PCreator.fromJson(json['p_creator'])
        : null;
    pIsImportant = json['p_is_important'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['subject'] = subject;
    data['updated_at'] = updatedAt;
    if (latestMessage != null) {
      data['latest_message'] = latestMessage!.toJson();
    }
    data['p_is_unread'] = pIsUnread;
    if (pCreator != null) {
      data['p_creator'] = pCreator!.toJson();
    }
    data['p_is_important'] = pIsImportant;
    return data;
  }
}

class LatestMessage {
  int? id;
  int? threadId;
  int? userId;
  String? body;
  dynamic filename;
  dynamic deletedBy;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;
  PRecipient? pRecipient;

  LatestMessage(
      {this.id,
      this.threadId,
      this.userId,
      this.body,
      this.filename,
      this.deletedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted,
      this.pRecipient});

  LatestMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    threadId = json['thread_id'];
    userId = json['user_id'];
    body = json['body'];
    filename = json['filename'];
    deletedBy = json['deleted_by'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
    pRecipient = json['p_recipient'] != null
        ? PRecipient.fromJson(json['p_recipient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thread_id'] = threadId;
    data['user_id'] = userId;
    data['body'] = body;
    data['filename'] = filename;
    data['deleted_by'] = deletedBy;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_at_formatted'] = createdAtFormatted;
    if (pRecipient != null) {
      data['p_recipient'] = pRecipient!.toJson();
    }
    return data;
  }
}

class PRecipient {
  int? id;
  int? threadId;
  int? userId;
  dynamic lastRead;
  int? isImportant;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? createdAtFormatted;

  PRecipient(
      {this.id,
      this.threadId,
      this.userId,
      this.lastRead,
      this.isImportant,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.createdAtFormatted});

  PRecipient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    threadId = json['thread_id'];
    userId = json['user_id'];
    lastRead = json['last_read'];
    isImportant = json['is_important'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thread_id'] = threadId;
    data['user_id'] = userId;
    data['last_read'] = lastRead;
    data['is_important'] = isImportant;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_at_formatted'] = createdAtFormatted;
    return data;
  }
}

class PCreator {
  int? id;
  String? countryCode;
  dynamic languageCode;
  dynamic userTypeId;
  int? genderId;
  String? name;
  String? photo;
  dynamic about;
  String? authField;
  String? email;
  String? phone;
  String? phoneNational;
  String? phoneCountry;
  int? phoneHidden;
  String? username;
  dynamic isAdmin;
  int? canBeImpersonated;
  int? disableComments;
  dynamic createFromIp;
  dynamic latestUpdateIp;
  dynamic provider;
  dynamic providerId;
  dynamic emailToken;
  dynamic phoneToken;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  int? acceptTerms;
  int? acceptMarketingOffers;
  dynamic timeZone;
  int? featured;
  int? blocked;
  int? closed;
  String? lastActivity;
  String? lastLoginAt;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? phoneIntl;
  String? createdAtFormatted;
  String? photoUrl;
  String? originalUpdatedAt;
  dynamic originalLastActivity;
  bool? pIsOnline;
  String? countryFlagUrl;
  dynamic remainingPosts;

  PCreator(
      {this.id,
      this.countryCode,
      this.languageCode,
      this.userTypeId,
      this.genderId,
      this.name,
      this.photo,
      this.about,
      this.authField,
      this.email,
      this.phone,
      this.phoneNational,
      this.phoneCountry,
      this.phoneHidden,
      this.username,
      this.isAdmin,
      this.canBeImpersonated,
      this.disableComments,
      this.createFromIp,
      this.latestUpdateIp,
      this.provider,
      this.providerId,
      this.emailToken,
      this.phoneToken,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.acceptTerms,
      this.acceptMarketingOffers,
      this.timeZone,
      this.featured,
      this.blocked,
      this.closed,
      this.lastActivity,
      this.lastLoginAt,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.phoneIntl,
      this.createdAtFormatted,
      this.photoUrl,
      this.originalUpdatedAt,
      this.originalLastActivity,
      this.pIsOnline,
      this.countryFlagUrl,
      this.remainingPosts});

  PCreator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    languageCode = json['language_code'];
    userTypeId = json['user_type_id'];
    genderId = json['gender_id'];
    name = json['name'];
    photo = json['photo'];
    about = json['about'];
    authField = json['auth_field'];
    email = json['email'];
    phone = json['phone'];
    phoneNational = json['phone_national'];
    phoneCountry = json['phone_country'];
    phoneHidden = json['phone_hidden'];
    username = json['username'];
    isAdmin = json['is_admin'];
    canBeImpersonated = json['can_be_impersonated'];
    disableComments = json['disable_comments'];
    createFromIp = json['create_from_ip'];
    latestUpdateIp = json['latest_update_ip'];
    provider = json['provider'];
    providerId = json['provider_id'];
    emailToken = json['email_token'];
    phoneToken = json['phone_token'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    acceptTerms = json['accept_terms'];
    acceptMarketingOffers = json['accept_marketing_offers'];
    timeZone = json['time_zone'];
    featured = json['featured'];
    blocked = json['blocked'];
    closed = json['closed'];
    lastActivity = json['last_activity'];
    lastLoginAt = json['last_login_at'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    phoneIntl = json['phone_intl'];
    createdAtFormatted = json['created_at_formatted'];
    photoUrl = json['photo_url'];
    originalUpdatedAt = json['original_updated_at'];
    originalLastActivity = json['original_last_activity'];
    pIsOnline = json['p_is_online'];
    countryFlagUrl = json['country_flag_url'];
    remainingPosts = json['remaining_posts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['language_code'] = languageCode;
    data['user_type_id'] = userTypeId;
    data['gender_id'] = genderId;
    data['name'] = name;
    data['photo'] = photo;
    data['about'] = about;
    data['auth_field'] = authField;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_national'] = phoneNational;
    data['phone_country'] = phoneCountry;
    data['phone_hidden'] = phoneHidden;
    data['username'] = username;
    data['is_admin'] = isAdmin;
    data['can_be_impersonated'] = canBeImpersonated;
    data['disable_comments'] = disableComments;
    data['create_from_ip'] = createFromIp;
    data['latest_update_ip'] = latestUpdateIp;
    data['provider'] = provider;
    data['provider_id'] = providerId;
    data['email_token'] = emailToken;
    data['phone_token'] = phoneToken;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['accept_terms'] = acceptTerms;
    data['accept_marketing_offers'] = acceptMarketingOffers;
    data['time_zone'] = timeZone;
    data['featured'] = featured;
    data['blocked'] = blocked;
    data['closed'] = closed;
    data['last_activity'] = lastActivity;
    data['last_login_at'] = lastLoginAt;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['phone_intl'] = phoneIntl;
    data['created_at_formatted'] = createdAtFormatted;
    data['photo_url'] = photoUrl;
    data['original_updated_at'] = originalUpdatedAt;
    data['original_last_activity'] = originalLastActivity;
    data['p_is_online'] = pIsOnline;
    data['country_flag_url'] = countryFlagUrl;
    data['remaining_posts'] = remainingPosts;
    return data;
  }
}
