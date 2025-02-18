class PostModel {
  int? id;
  String? countryCode;
  int? userId;
  dynamic paymentId;
  int? categoryId;
  dynamic postTypeId;
  String? title;
  String? description;
  List<String>? tags;
  dynamic price;
  String? currencyCode;
  dynamic negotiable;
  String? contactName;
  String? authField;
  String? email;
  String? phone;
  String? phoneNational;
  String? phoneCountry;
  dynamic phoneHidden;
  dynamic address;
  int? cityId;
  int? lat;
  int? lon;
  dynamic createFromIp;
  dynamic latestUpdateIp;
  int? visits;
  String? tmpToken;
  dynamic emailToken;
  dynamic phoneToken;
  String? emailVerifiedAt;
  String? phoneVerifiedAt;
  int? acceptTerms;
  int? acceptMarketingOffers;
  int? isPermanent;
  String? reviewedAt;
  int? featured;
  dynamic archivedAt;
  dynamic archivedManuallyAt;
  dynamic deletionMailSentAt;
  dynamic fbProfile;
  dynamic partner;
  String? createdAt;
  String? updatedAt;
  int? reference;
  String? slug;
  String? url;
  String? phoneIntl;
  String? createdAtFormatted;
  String? userPhotoUrl;
  String? countryFlagUrl;
  String? priceLabel;
  String? priceFormatted;
  String? visitsFormatted;
  dynamic distanceInfo;
  int? countPictures;
  Picture? picture;

  PostModel(
      {this.id,
      this.countryCode,
      this.userId,
      this.paymentId,
      this.categoryId,
      this.postTypeId,
      this.title,
      this.description,
      this.tags,
      this.price,
      this.currencyCode,
      this.negotiable,
      this.contactName,
      this.authField,
      this.email,
      this.phone,
      this.phoneNational,
      this.phoneCountry,
      this.phoneHidden,
      this.address,
      this.cityId,
      this.lat,
      this.lon,
      this.createFromIp,
      this.latestUpdateIp,
      this.visits,
      this.tmpToken,
      this.emailToken,
      this.phoneToken,
      this.emailVerifiedAt,
      this.phoneVerifiedAt,
      this.acceptTerms,
      this.acceptMarketingOffers,
      this.isPermanent,
      this.reviewedAt,
      this.featured,
      this.archivedAt,
      this.archivedManuallyAt,
      this.deletionMailSentAt,
      this.fbProfile,
      this.partner,
      this.createdAt,
      this.updatedAt,
      this.reference,
      this.slug,
      this.url,
      this.phoneIntl,
      this.createdAtFormatted,
      this.userPhotoUrl,
      this.countryFlagUrl,
      this.priceLabel,
      this.priceFormatted,
      this.visitsFormatted,
      this.distanceInfo,
      this.countPictures,
      this.picture});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    userId = json['user_id'];
    paymentId = json['payment_id'];
    categoryId = json['category_id'];
    postTypeId = json['post_type_id'];
    title = json['title'];
    description = json['description'];
    if (json['tags'] != dynamic) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(v);
      });
    }
    price = json['price'];
    currencyCode = json['currency_code'];
    negotiable = json['negotiable'];
    contactName = json['contact_name'];
    authField = json['auth_field'];
    email = json['email'];
    phone = json['phone'];
    phoneNational = json['phone_national'];
    phoneCountry = json['phone_country'];
    phoneHidden = json['phone_hidden'];
    address = json['address'];
    cityId = json['city_id'];
    lat = json['lat'];
    lon = json['lon'];
    createFromIp = json['create_from_ip'];
    latestUpdateIp = json['latest_update_ip'];
    visits = json['visits'];
    tmpToken = json['tmp_token'];
    emailToken = json['email_token'];
    phoneToken = json['phone_token'];
    emailVerifiedAt = json['email_verified_at'];
    phoneVerifiedAt = json['phone_verified_at'];
    acceptTerms = json['accept_terms'];
    acceptMarketingOffers = json['accept_marketing_offers'];
    isPermanent = json['is_permanent'];
    reviewedAt = json['reviewed_at'];
    featured = json['featured'];
    archivedAt = json['archived_at'];
    archivedManuallyAt = json['archived_manually_at'];
    deletionMailSentAt = json['deletion_mail_sent_at'];
    fbProfile = json['fb_profile'];
    partner = json['partner'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    reference = json['reference'];
    slug = json['slug'];
    url = json['url'];
    phoneIntl = json['phone_intl'];
    createdAtFormatted = json['created_at_formatted'];
    userPhotoUrl = json['user_photo_url'];
    countryFlagUrl = json['country_flag_url'];
    priceLabel = json['price_label'];
    priceFormatted = json['price_formatted'];
    visitsFormatted = json['visits_formatted'];
    distanceInfo = json['distance_info'];
    countPictures = json['count_pictures'];
    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['user_id'] = userId;
    data['payment_id'] = paymentId;
    data['category_id'] = categoryId;
    data['post_type_id'] = postTypeId;
    data['title'] = title;
    data['description'] = description;
    if (tags != null) {
      data['tags'] = tags;
    }
    data['price'] = price;
    data['currency_code'] = currencyCode;
    data['negotiable'] = negotiable;
    data['contact_name'] = contactName;
    data['auth_field'] = authField;
    data['email'] = email;
    data['phone'] = phone;
    data['phone_national'] = phoneNational;
    data['phone_country'] = phoneCountry;
    data['phone_hidden'] = phoneHidden;
    data['address'] = address;
    data['city_id'] = cityId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['create_from_ip'] = createFromIp;
    data['latest_update_ip'] = latestUpdateIp;
    data['visits'] = visits;
    data['tmp_token'] = tmpToken;
    data['email_token'] = emailToken;
    data['phone_token'] = phoneToken;
    data['email_verified_at'] = emailVerifiedAt;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['accept_terms'] = acceptTerms;
    data['accept_marketing_offers'] = acceptMarketingOffers;
    data['is_permanent'] = isPermanent;
    data['reviewed_at'] = reviewedAt;
    data['featured'] = featured;
    data['archived_at'] = archivedAt;
    data['archived_manually_at'] = archivedManuallyAt;
    data['deletion_mail_sent_at'] = deletionMailSentAt;
    data['fb_profile'] = fbProfile;
    data['partner'] = partner;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['reference'] = reference;
    data['slug'] = slug;
    data['url'] = url;
    data['phone_intl'] = phoneIntl;
    data['created_at_formatted'] = createdAtFormatted;
    data['user_photo_url'] = userPhotoUrl;
    data['country_flag_url'] = countryFlagUrl;
    data['price_label'] = priceLabel;
    data['price_formatted'] = priceFormatted;
    data['visits_formatted'] = visitsFormatted;
    data['distance_info'] = distanceInfo;
    data['count_pictures'] = countPictures;
    if (picture != dynamic) {
      data['picture'] = picture!.toJson();
    }
    return data;
  }
}

class Picture {
  String? filename;
  Url? url;

  Picture({this.filename, this.url});

  Picture.fromJson(Map<String, dynamic> json) {
    filename = json['filename'];
    url = json['url'] != null ? Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = filename;
    if (url != null) {
      data['url'] = url!.toJson();
    }
    return data;
  }
}

class Url {
  String? full;
  String? small;
  String? medium;
  String? big;

  Url({this.full, this.small, this.medium, this.big});

  Url.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    small = json['small'];
    medium = json['medium'];
    big = json['big'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = full;
    data['small'] = small;
    data['medium'] = medium;
    data['big'] = big;
    return data;
  }
}
