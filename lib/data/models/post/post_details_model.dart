import 'dart:developer';

class PostDetailsModel {
  int? id;
  String? countryCode;
  int? userId;
 dynamic paymentId;
  int? categoryId;
 dynamic postTypeId;
  String? title;
  String? description;
  List<Null>? tags;
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
  User? user;
  Category? category;
 dynamic postType;
  City? city;
 dynamic payment;
  List<dynamic>? savedByLoggedUser;
  List<Pictures>? pictures;

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
      this.category,
      this.postType,
      this.city,
      this.payment,
      this.savedByLoggedUser,
      this.pictures});

  PostDetailsModel.fromJson(Map<String, dynamic> json) {
    log(json['savedByLoggedUser'].toString());
    id = json['id'];
    countryCode = json['country_code'];
    userId = json['user_id'];
    paymentId = json['payment_id'];
    categoryId = json['category_id'];
    postTypeId = json['post_type_id'];
    title = json['title'];
    description = json['description'];
    // if (json['tags'] != null) {
    //   tags = <Null>[];
    //   json['tags'].forEach((v) {
    //     tags!.add(new Null.fromJson(v));
    //   });
    // }
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
    log("LATITUDE $lat");
    log("LONGITUDE $lon");
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    postType = json['postType'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    payment = json['payment'];

          savedByLoggedUser = <dynamic>[];

    if (json['savedByLoggedUser'] != null) {
      log("LOGGED USER ${json['savedByLoggedUser']}");
      json['savedByLoggedUser'].forEach((v) {
        savedByLoggedUser!.add(v);
      });
    }
    if (json['pictures'] != null) {
      pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        pictures!.add(Pictures.fromJson(v));
      });
    }
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
    // if (this.tags != null) {
    //   data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    // }
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['postType'] = postType;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    data['payment'] = payment;
    if (savedByLoggedUser != null) {
      data['savedByLoggedUser'] =
          savedByLoggedUser!.map((v) => v.toJson()).toList();
    }
    if (pictures != null) {
      data['pictures'] = pictures!.map((v) => v.toJson()).toList();
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

class User {
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

class Category {
  int? id;
 dynamic parentId;
  String? name;
  String? slug;
  String? description;
  int? hideDescription;
  String? picture;
  String? iconClass;
  String? seoTitle;
  String? seoDescription;
  String? seoKeywords;
  int? lft;
  int? rgt;
  int? depth;
  String? type;
  int? isForPermanent;
  int? active;
  String? pictureUrl;
 dynamic parent;

  Category(
      {this.id,
      this.parentId,
      this.name,
      this.slug,
      this.description,
      this.hideDescription,
      this.picture,
      this.iconClass,
      this.seoTitle,
      this.seoDescription,
      this.seoKeywords,
      this.lft,
      this.rgt,
      this.depth,
      this.type,
      this.isForPermanent,
      this.active,
      this.pictureUrl,
      this.parent});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    hideDescription = json['hide_description'];
    picture = json['picture'];
    iconClass = json['icon_class'];
    seoTitle = json['seo_title'];
    seoDescription = json['seo_description'];
    seoKeywords = json['seo_keywords'];
    lft = json['lft'];
    rgt = json['rgt'];
    depth = json['depth'];
    type = json['type'];
    isForPermanent = json['is_for_permanent'];
    active = json['active'];
    pictureUrl = json['picture_url'];
    parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parent_id'] = parentId;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['hide_description'] = hideDescription;
    data['picture'] = picture;
    data['icon_class'] = iconClass;
    data['seo_title'] = seoTitle;
    data['seo_description'] = seoDescription;
    data['seo_keywords'] = seoKeywords;
    data['lft'] = lft;
    data['rgt'] = rgt;
    data['depth'] = depth;
    data['type'] = type;
    data['is_for_permanent'] = isForPermanent;
    data['active'] = active;
    data['picture_url'] = pictureUrl;
    data['parent'] = parent;
    return data;
  }
}

class City {
  int? id;
  String? countryCode;
  String? name;
  int? latitude;
  int? longitude;
  String? subadmin1Code;
 dynamic subadmin2Code;
 dynamic population;
  String? timeZone;
  int? active;
  int? postsCount;

  City(
      {this.id,
      this.countryCode,
      this.name,
      this.latitude,
      this.longitude,
      this.subadmin1Code,
      this.subadmin2Code,
      this.population,
      this.timeZone,
      this.active,
      this.postsCount});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    log("CITY LATITUDE $latitude");
    log("CITY LONGITUDE $longitude");
    subadmin1Code = json['subadmin1_code'];
    subadmin2Code = json['subadmin2_code'];
    population = json['population'];
    timeZone = json['time_zone'];
    active = json['active'];
    postsCount = json['posts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['country_code'] = countryCode;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['subadmin1_code'] = subadmin1Code;
    data['subadmin2_code'] = subadmin2Code;
    data['population'] = population;
    data['time_zone'] = timeZone;
    data['active'] = active;
    data['posts_count'] = postsCount;
    return data;
  }
}

class Pictures {
  int? id;
  int? postId;
  String? filename;
  String? mimeType;
  int? position;
  int? active;
  Url? url;

  Pictures(
      {this.id,
      this.postId,
      this.filename,
      this.mimeType,
      this.position,
      this.active,
      this.url});

  Pictures.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    filename = json['filename'];
    mimeType = json['mime_type'];
    position = json['position'];
    active = json['active'];
    url = json['url'] != null ? Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['post_id'] = postId;
    data['filename'] = filename;
    data['mime_type'] = mimeType;
    data['position'] = position;
    data['active'] = active;
    if (url != null) {
      data['url'] = url!.toJson();
    }
    return data;
  }
}
