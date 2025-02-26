import 'dart:developer';

class PostDetailsModel {
  int? id;
  String? countryCode;
  int? userId;
  dynamic paymentId;
  int? categoryId;
  int? postTypeId;
  String? title;
  String? description;
  List<String>? tags;
  String? price;
  dynamic currencyCode;
  int? negotiable;
  String? contactName;
  String? authField;
  String? email;
  String? phone;
  String? phoneNational;
  String? phoneCountry;
  int? phoneHidden;
  dynamic address;
  int? cityId;
  double? lat;
  double? lon;
  String? createFromIp;
  dynamic latestUpdateIp;
  int? visits;
  dynamic tmpToken;
 dynamic emailToken;
  String? phoneToken;
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
  String? reference;
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
  User? user;
  PostType? postType;
 dynamic ratingCache;
 dynamic ratingCount;

  PostDetailsModel(
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
      this.picture,
      this.user,
      this.postType,
      this.ratingCache,
      this.ratingCount});

  PostDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    userId = json['user_id'];
    paymentId = json['payment_id'];
    categoryId = json['category_id'];
    postTypeId = json['post_type_id'];
    title = json['title'];
    description = json['description'];
    tags = json['tags'].cast<String>();
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

    // lat = json['lat'];
    // lon = json['lon'];
                            

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
log("NOTHING HERE");

    // featured = json['featured'];
    // archivedAt = json['archived_at'];
    // archivedManuallyAt = json['archived_manually_at'];
    // deletionMailSentAt = json['deletion_mail_sent_at'];
    // fbProfile = json['fb_profile'];
    // partner = json['partner'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // reference = json['reference'];
    // slug = json['slug'];
    // url = json['url'];
    // phoneIntl = json['phone_intl'];
    // createdAtFormatted = json['created_at_formatted'];
    // userPhotoUrl = json['user_photo_url'];
    // countryFlagUrl = json['country_flag_url'];
    // priceLabel = json['price_label'];
    // priceFormatted = json['price_formatted'];
    // visitsFormatted = json['visits_formatted'];
    // distanceInfo = json['distance_info'];
    // countPictures = json['count_pictures'];

    picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    postType = json['postType'] != null
        ? PostType.fromJson(json['postType'])
        : null;
    ratingCache = json['rating_cache'];
    ratingCount = json['rating_count'];


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
    data['tags'] = tags;
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
    if (picture != null) {
      data['picture'] = picture!.toJson();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (postType != null) {
      data['postType'] = postType!.toJson();
    }
    data['rating_cache'] = ratingCache;
    data['rating_count'] = ratingCount;
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

class User {
  int? id;
  String? name;
 dynamic username;
  String? updatedAt;
  String? originalUpdatedAt;
  dynamic originalLastActivity;
  String? createdAtFormatted;
  String? photoUrl;
  bool? pIsOnline;
  String? countryFlagUrl;

  User(
      {this.id,
      this.name,
      this.username,
      this.updatedAt,
      this.originalUpdatedAt,
      this.originalLastActivity,
      this.createdAtFormatted,
      this.photoUrl,
      this.pIsOnline,
      this.countryFlagUrl});

  User.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class PostType {
  int? id;
  String? name;
  int? active;

  PostType({this.id, this.name, this.active});

  PostType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['active'] = active;
    return data;
  }
}
