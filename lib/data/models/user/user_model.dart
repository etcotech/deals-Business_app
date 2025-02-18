class UserModel {
  int? id;
  String? name;
  String? username;
  String? updatedAt;
  String? originalUpdatedAt;
  dynamic originalLastActivity;
  String? createdAtFormatted;
  String? photoUrl;
  bool? pIsOnline;
  String? countryFlagUrl;
  String? countryCode;
  dynamic languageCode;
  dynamic userTypeId;
  int? genderId;
  dynamic photo;
  dynamic about;
  String? authField;
  String? email;
  String? phone;
  String? phoneNational;
  String? phoneCountry;
  int? phoneHidden;
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
  String? phoneIntl;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.updatedAt,
      this.originalUpdatedAt,
      this.originalLastActivity,
      this.createdAtFormatted,
      this.photoUrl,
      this.pIsOnline,
      this.countryFlagUrl,
      this.countryCode,
      this.languageCode,
      this.userTypeId,
      this.genderId,
      this.photo,
      this.about,
      this.authField,
      this.email,
      this.phone,
      this.phoneNational,
      this.phoneCountry,
      this.phoneHidden,
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
      this.phoneIntl});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    updatedAt = json['updated_at'];
    originalUpdatedAt = json['original_updated_at'];
    originalLastActivity = json['original_last_activity'];
    createdAtFormatted = json['created_at_formatted'];
    photoUrl = json['photo_url'];
    pIsOnline = json['p_is_online'];
    countryFlagUrl = json['country_flag_url'];
    countryCode = json['country_code'];
    languageCode = json['language_code'];
    userTypeId = json['user_type_id'];
    genderId = json['gender_id'];
    photo = json['photo'];
    about = json['about'];
    authField = json['auth_field'];
    email = json['email'];
    phone = json['phone'];
    phoneNational = json['phone_national'];
    phoneCountry = json['phone_country'];
    phoneHidden = json['phone_hidden'];
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
    phoneIntl = json['phone_intl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['updated_at'] = updatedAt;
    data['original_updated_at'] = originalUpdatedAt;
    data['original_last_activity'] = originalLastActivity;
    data['created_at_formatted'] = createdAtFormatted;
    data['photo_url'] = photoUrl;
    data['p_is_online'] = pIsOnline;
    data['country_flag_url'] = countryFlagUrl;
    data['country_code'] = countryCode;
    data['language_code'] = languageCode;
    data['user_type_id'] = userTypeId;
    data['gender_id'] = genderId;
    data['photo'] = photo;
    data['about'] = about;
    data['auth_field'] = authField;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_national'] = phoneNational;
    data['phone_country'] = phoneCountry;
    data['phone_hidden'] = phoneHidden;
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
    data['phone_intl'] = phoneIntl;
    return data;
  }
}
