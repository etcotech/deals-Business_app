// class PostModel {
//   int? id;
//   String? countryCode;
//   int? userId;
//   dynamic paymentId;
//   int? categoryId;
//   dynamic postTypeId;
//   String? title;
//   String? description;
//   List<String>? tags;
//   dynamic price;
//   String? currencyCode;
//   dynamic negotiable;
//   String? contactName;
//   String? authField;
//   String? email;
//   String? phone;
//   String? phoneNational;
//   String? phoneCountry;
//   dynamic phoneHidden;
//   dynamic address;
//   int? cityId;
//   int? lat;
//   int? lon;
//   dynamic createFromIp;
//   dynamic latestUpdateIp;
//   int? visits;
//   String? tmpToken;
//   dynamic emailToken;
//   dynamic phoneToken;
//   String? emailVerifiedAt;
//   String? phoneVerifiedAt;
//   int? acceptTerms;
//   int? acceptMarketingOffers;
//   int? isPermanent;
//   String? reviewedAt;
//   int? featured;
//   dynamic archivedAt;
//   dynamic archivedManuallyAt;
//   dynamic deletionMailSentAt;
//   dynamic fbProfile;
//   dynamic partner;
//   String? createdAt;
//   String? updatedAt;
//   int? reference;
//   String? slug;
//   String? url;
//   String? phoneIntl;
//   String? createdAtFormatted;
//   String? userPhotoUrl;
//   String? countryFlagUrl;
//   String? priceLabel;
//   String? priceFormatted;
//   String? visitsFormatted;
//   dynamic distanceInfo;
//   int? countPictures;
//   Picture? picture;
//   Category? category;

//   PostModel(
//       {this.id,
//       this.countryCode,
//       this.userId,
//       this.paymentId,
//       this.categoryId,
//       this.postTypeId,
//       this.title,
//       this.description,
//       this.tags,
//       this.price,
//       this.currencyCode,
//       this.negotiable,
//       this.contactName,
//       this.authField,
//       this.email,
//       this.phone,
//       this.phoneNational,
//       this.phoneCountry,
//       this.phoneHidden,
//       this.address,
//       this.cityId,
//       this.lat,
//       this.lon,
//       this.createFromIp,
//       this.latestUpdateIp,
//       this.visits,
//       this.tmpToken,
//       this.emailToken,
//       this.phoneToken,
//       this.emailVerifiedAt,
//       this.phoneVerifiedAt,
//       this.acceptTerms,
//       this.acceptMarketingOffers,
//       this.isPermanent,
//       this.reviewedAt,
//       this.featured,
//       this.archivedAt,
//       this.archivedManuallyAt,
//       this.deletionMailSentAt,
//       this.fbProfile,
//       this.partner,
//       this.createdAt,
//       this.updatedAt,
//       this.reference,
//       this.slug,
//       this.url,
//       this.phoneIntl,
//       this.createdAtFormatted,
//       this.userPhotoUrl,
//       this.countryFlagUrl,
//       this.priceLabel,
//       this.priceFormatted,
//       this.visitsFormatted,
//       this.distanceInfo,
//       this.countPictures,
//       this.category,
//       this.picture});

//   PostModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     countryCode = json['country_code'];
//     userId = json['user_id'];
//     paymentId = json['payment_id'];
//     categoryId = json['category_id'];
//     postTypeId = json['post_type_id'];
//     title = json['title'];
//     description = json['description'];
//     if (json['tags'] != dynamic) {
//       tags = <String>[];
//       json['tags'].forEach((v) {
//         tags!.add(v);
//       });
//     }
//     price = json['price'];
//     currencyCode = json['currency_code'];
//     negotiable = json['negotiable'];
//     contactName = json['contact_name'];
//     authField = json['auth_field'];
//     email = json['email'];
//     phone = json['phone'];
//     phoneNational = json['phone_national'];
//     phoneCountry = json['phone_country'];
//     phoneHidden = json['phone_hidden'];
//     address = json['address'];
//     cityId = json['city_id'];
//     lat = json['lat'];
//     lon = json['lon'];
//     createFromIp = json['create_from_ip'];
//     latestUpdateIp = json['latest_update_ip'];
//     visits = json['visits'];
//     tmpToken = json['tmp_token'];
//     emailToken = json['email_token'];
//     phoneToken = json['phone_token'];
//     emailVerifiedAt = json['email_verified_at'];
//     phoneVerifiedAt = json['phone_verified_at'];
//     acceptTerms = json['accept_terms'];
//     acceptMarketingOffers = json['accept_marketing_offers'];
//     isPermanent = json['is_permanent'];
//     reviewedAt = json['reviewed_at'];
//     featured = json['featured'];
//     archivedAt = json['archived_at'];
//     archivedManuallyAt = json['archived_manually_at'];
//     deletionMailSentAt = json['deletion_mail_sent_at'];
//     fbProfile = json['fb_profile'];
//     partner = json['partner'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     reference = json['reference'];
//     slug = json['slug'];
//     url = json['url'];
//     phoneIntl = json['phone_intl'];
//     createdAtFormatted = json['created_at_formatted'];
//     userPhotoUrl = json['user_photo_url'];
//     countryFlagUrl = json['country_flag_url'];
//     priceLabel = json['price_label'];
//     priceFormatted = json['price_formatted'];
//     visitsFormatted = json['visits_formatted'];
//     distanceInfo = json['distance_info'];
//     countPictures = json['count_pictures'];
//     category = Category.fromJson(json['category']);
//     picture =
//         json['picture'] != dynamic ? Picture.fromJson(json['picture']) : dynamic;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['country_code'] = countryCode;
//     data['user_id'] = userId;
//     data['payment_id'] = paymentId;
//     data['category_id'] = categoryId;
//     data['post_type_id'] = postTypeId;
//     data['title'] = title;
//     data['description'] = description;
//     if (tags != dynamic) {
//       data['tags'] = tags;
//     }
//     data['price'] = price;
//     data['currency_code'] = currencyCode;
//     data['negotiable'] = negotiable;
//     data['contact_name'] = contactName;
//     data['auth_field'] = authField;
//     data['email'] = email;
//     data['phone'] = phone;
//     data['phone_national'] = phoneNational;
//     data['phone_country'] = phoneCountry;
//     data['phone_hidden'] = phoneHidden;
//     data['address'] = address;
//     data['city_id'] = cityId;
//     data['lat'] = lat;
//     data['lon'] = lon;
//     data['create_from_ip'] = createFromIp;
//     data['latest_update_ip'] = latestUpdateIp;
//     data['visits'] = visits;
//     data['tmp_token'] = tmpToken;
//     data['email_token'] = emailToken;
//     data['phone_token'] = phoneToken;
//     data['email_verified_at'] = emailVerifiedAt;
//     data['phone_verified_at'] = phoneVerifiedAt;
//     data['accept_terms'] = acceptTerms;
//     data['accept_marketing_offers'] = acceptMarketingOffers;
//     data['is_permanent'] = isPermanent;
//     data['reviewed_at'] = reviewedAt;
//     data['featured'] = featured;
//     data['archived_at'] = archivedAt;
//     data['archived_manually_at'] = archivedManuallyAt;
//     data['deletion_mail_sent_at'] = deletionMailSentAt;
//     data['fb_profile'] = fbProfile;
//     data['partner'] = partner;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['reference'] = reference;
//     data['slug'] = slug;
//     data['url'] = url;
//     data['phone_intl'] = phoneIntl;
//     data['created_at_formatted'] = createdAtFormatted;
//     data['user_photo_url'] = userPhotoUrl;
//     data['country_flag_url'] = countryFlagUrl;
//     data['price_label'] = priceLabel;
//     data['price_formatted'] = priceFormatted;
//     data['visits_formatted'] = visitsFormatted;
//     data['distance_info'] = distanceInfo;
//     data['count_pictures'] = countPictures;
//     if (picture != dynamic) {
//       data['picture'] = picture!.toJson();
//     }
//     return data;
//   }
// }

// class Picture {
//   String? filename;
//   Url? url;

//   Picture({this.filename, this.url});

//   Picture.fromJson(Map<String, dynamic> json) {
//     filename = json['filename'];
//     url = json['url'] != dynamic ? Url.fromJson(json['url']) : dynamic;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['filename'] = filename;
//     if (url != dynamic) {
//       data['url'] = url!.toJson();
//     }
//     return data;
//   }
// }

// class Category {
//   int? _id;
//   dynamic _parentId;
//   String? _name;
//   String? _slug;
//   String? _description;
//   int? _hideDescription;
//   String? _picture;
//   String? _iconClass;
//   String? _seoTitle;
//   String? _seoDescription;
//   String? _seoKeywords;
//   int? _lft;
//   int? _rgt;
//   int? _depth;
//   String? _type;
//   int? _isForPermanent;
//   int? _active;
//   String? _pictureUrl;

//   Category(
//       {int? id,
//       dynamic parentId,
//       String? name,
//       String? slug,
//       String? description,
//       int? hideDescription,
//       String? picture,
//       String? iconClass,
//       String? seoTitle,
//       String? seoDescription,
//       String? seoKeywords,
//       int? lft,
//       int? rgt,
//       int? depth,
//       String? type,
//       int? isForPermanent,
//       int? active,
//       String? pictureUrl}) {
//     if (id != dynamic) {
//       _id = id;
//     }
//     if (parentId != dynamic) {
//       _parentId = parentId;
//     }
//     if (name != dynamic) {
//       _name = name;
//     }
//     if (slug != dynamic) {
//       _slug = slug;
//     }
//     if (description != dynamic) {
//       _description = description;
//     }
//     if (hideDescription != dynamic) {
//       _hideDescription = hideDescription;
//     }
//     if (picture != dynamic) {
//       _picture = picture;
//     }
//     if (iconClass != dynamic) {
//       _iconClass = iconClass;
//     }
//     if (seoTitle != dynamic) {
//       _seoTitle = seoTitle;
//     }
//     if (seoDescription != dynamic) {
//       _seoDescription = seoDescription;
//     }
//     if (seoKeywords != dynamic) {
//       _seoKeywords = seoKeywords;
//     }
//     if (lft != dynamic) {
//       _lft = lft;
//     }
//     if (rgt != dynamic) {
//       _rgt = rgt;
//     }
//     if (depth != dynamic) {
//       _depth = depth;
//     }
//     if (type != dynamic) {
//       _type = type;
//     }
//     if (isForPermanent != dynamic) {
//       _isForPermanent = isForPermanent;
//     }
//     if (active != dynamic) {
//       _active = active;
//     }
//     if (pictureUrl != dynamic) {
//       _pictureUrl = pictureUrl;
//     }
//   }

//   int? get id => _id;
//   set id(int? id) => _id = id;
//   dynamic get parentId => _parentId;
//   set parentId(dynamic parentId) => _parentId = parentId;
//   String? get name => _name;
//   set name(String? name) => _name = name;
//   String? get slug => _slug;
//   set slug(String? slug) => _slug = slug;
//   String? get description => _description;
//   set description(String? description) => _description = description;
//   int? get hideDescription => _hideDescription;
//   set hideDescription(int? hideDescription) =>
//       _hideDescription = hideDescription;
//   String? get picture => _picture;
//   set picture(String? picture) => _picture = picture;
//   String? get iconClass => _iconClass;
//   set iconClass(String? iconClass) => _iconClass = iconClass;
//   String? get seoTitle => _seoTitle;
//   set seoTitle(String? seoTitle) => _seoTitle = seoTitle;
//   String? get seoDescription => _seoDescription;
//   set seoDescription(String? seoDescription) =>
//       _seoDescription = seoDescription;
//   String? get seoKeywords => _seoKeywords;
//   set seoKeywords(String? seoKeywords) => _seoKeywords = seoKeywords;
//   int? get lft => _lft;
//   set lft(int? lft) => _lft = lft;
//   int? get rgt => _rgt;
//   set rgt(int? rgt) => _rgt = rgt;
//   int? get depth => _depth;
//   set depth(int? depth) => _depth = depth;
//   String? get type => _type;
//   set type(String? type) => _type = type;
//   int? get isForPermanent => _isForPermanent;
//   set isForPermanent(int? isForPermanent) => _isForPermanent = isForPermanent;
//   int? get active => _active;
//   set active(int? active) => _active = active;
//   String? get pictureUrl => _pictureUrl;
//   set pictureUrl(String? pictureUrl) => _pictureUrl = pictureUrl;

//   Category.fromJson(Map<String, dynamic> json) {
//     _id = json['id'];
//     _parentId = json['parent_id'];
//     _name = json['name'];
//     _slug = json['slug'];
//     _description = json['description'];
//     _hideDescription = json['hide_description'];
//     _picture = json['picture'];
//     _iconClass = json['icon_class'];
//     _seoTitle = json['seo_title'];
//     _seoDescription = json['seo_description'];
//     _seoKeywords = json['seo_keywords'];
//     _lft = json['lft'];
//     _rgt = json['rgt'];
//     _depth = json['depth'];
//     _type = json['type'];
//     _isForPermanent = json['is_for_permanent'];
//     _active = json['active'];
//     _pictureUrl = json['picture_url'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = _id;
//     data['parent_id'] = _parentId;
//     data['name'] = _name;
//     data['slug'] = _slug;
//     data['description'] = _description;
//     data['hide_description'] = _hideDescription;
//     data['picture'] = _picture;
//     data['icon_class'] = _iconClass;
//     data['seo_title'] = _seoTitle;
//     data['seo_description'] = _seoDescription;
//     data['seo_keywords'] = _seoKeywords;
//     data['lft'] = _lft;
//     data['rgt'] = _rgt;
//     data['depth'] = _depth;
//     data['type'] = _type;
//     data['is_for_permanent'] = _isForPermanent;
//     data['active'] = _active;
//     data['picture_url'] = _pictureUrl;
//     return data;
//   }
// }

// class Url {
//   String? full;
//   String? small;
//   String? medium;
//   String? big;

//   Url({this.full, this.small, this.medium, this.big});

//   Url.fromJson(Map<String, dynamic> json) {
//     full = json['full'];
//     small = json['small'];
//     medium = json['medium'];
//     big = json['big'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['full'] = full;
//     data['small'] = small;
//     data['medium'] = medium;
//     data['big'] = big;
//     return data;
//   }
// }





import 'dart:developer';

class PostModel {
  int? _id;
  String? _countryCode;
 dynamic _userId;
 dynamic _paymentId;
  int? _categoryId;
 dynamic _postTypeId;
  String? _title;
  String? _description;
  List<dynamic>? _tags;
  String? _price;
 dynamic _currencyCode;
 dynamic _negotiable;
  String? _contactName;
  String? _authField;
  String? _email;
  String? _phone;
  String? _phoneNational;
  String? _phoneCountry;
 dynamic _phoneHidden;
 dynamic _address;
  int? _cityId;
 dynamic _lat;
 dynamic _lon;
 dynamic _createFromIp;
 dynamic _latestUpdateIp;
 dynamic _visits;
 dynamic _tmpToken;
 dynamic _emailToken;
 dynamic _phoneToken;
  String? _emailVerifiedAt;
  String? _phoneVerifiedAt;
 dynamic _acceptTerms;
 dynamic _acceptMarketingOffers;
 dynamic _isPermanent;
  String? _reviewedAt;
  int? _featured;
 dynamic _archivedAt;
 dynamic _archivedManuallyAt;
 dynamic _deletionMailSentAt;
 dynamic _fbProfile;
 dynamic _partner;
  String? _createdAt;
  String? _updatedAt;
  int? _reference;
  String? _slug;
  String? _url;
  String? _phoneIntl;
  String? _createdAtFormatted;
  String? _userPhotoUrl;
  String? _countryFlagUrl;
  String? _priceLabel;
  String? _priceFormatted;
  String? _visitsFormatted;
 dynamic _distanceInfo;
  int? _countPictures;
  Picture? _picture;
 dynamic _user;
  Category? _category;
 dynamic _postType;
  City? _city;
 dynamic _payment;
  List<dynamic>? _savedByLoggedUser;
  List<Pictures>? _pictures;

  PostModel(
      {int? id,
      String? countryCode,
     dynamic userId,
     dynamic paymentId,
      int? categoryId,
     dynamic postTypeId,
      String? title,
      String? description,
      List<dynamic>? tags,
      String? price,
     dynamic currencyCode,
     dynamic negotiable,
      String? contactName,
      String? authField,
      String? email,
      String? phone,
      String? phoneNational,
      String? phoneCountry,
     dynamic phoneHidden,
     dynamic address,
      int? cityId,
     dynamic lat,
     dynamic lon,
     dynamic createFromIp,
     dynamic latestUpdateIp,
     dynamic visits,
     dynamic tmpToken,
     dynamic emailToken,
     dynamic phoneToken,
      String? emailVerifiedAt,
      String? phoneVerifiedAt,
     dynamic acceptTerms,
     dynamic acceptMarketingOffers,
     dynamic isPermanent,
      String? reviewedAt,
      int? featured,
     dynamic archivedAt,
     dynamic archivedManuallyAt,
     dynamic deletionMailSentAt,
     dynamic fbProfile,
     dynamic partner,
      String? createdAt,
      String? updatedAt,
      int? reference,
      String? slug,
      String? url,
      String? phoneIntl,
      String? createdAtFormatted,
      String? userPhotoUrl,
      String? countryFlagUrl,
      String? priceLabel,
      String? priceFormatted,
      String? visitsFormatted,
     dynamic distanceInfo,
      int? countPictures,
      Picture? picture,
     dynamic user,
      Category? category,
     dynamic postType,
      City? city,
     dynamic payment,
      List<dynamic>? savedByLoggedUser,
      List<Pictures>? pictures}) {
    if (id != dynamic) {
      _id = id;
    }
    if (countryCode != dynamic) {
      _countryCode = countryCode;
    }
    if (userId != dynamic) {
      _userId = userId;
    }
    if (paymentId != dynamic) {
      _paymentId = paymentId;
    }
    if (categoryId != dynamic) {
      _categoryId = categoryId;
    }
    if (postTypeId != dynamic) {
      _postTypeId = postTypeId;
    }
    if (title != dynamic) {
      _title = title;
    }
    if (description != dynamic) {
      _description = description;
    }
    if (tags != dynamic) {
      _tags = tags;
    }
    if (price != dynamic) {
      _price = price;
    }
    if (currencyCode != dynamic) {
      _currencyCode = currencyCode;
    }
    if (negotiable != dynamic) {
      _negotiable = negotiable;
    }
    if (contactName != dynamic) {
      _contactName = contactName;
    }
    if (authField != dynamic) {
      _authField = authField;
    }
    if (email != dynamic) {
      _email = email;
    }
    if (phone != dynamic) {
      _phone = phone;
    }
    if (phoneNational != dynamic) {
      _phoneNational = phoneNational;
    }
    if (phoneCountry != dynamic) {
      _phoneCountry = phoneCountry;
    }
    if (phoneHidden != dynamic) {
      _phoneHidden = phoneHidden;
    }
    if (address != dynamic) {
      _address = address;
    }
    if (cityId != dynamic) {
      _cityId = cityId;
    }
    if (lat != dynamic) {
      _lat = lat;
    }
    if (lon != dynamic) {
      _lon = lon;
    }
    if (createFromIp != dynamic) {
      _createFromIp = createFromIp;
    }
    if (latestUpdateIp != dynamic) {
      _latestUpdateIp = latestUpdateIp;
    }
    if (visits != dynamic) {
      _visits = visits;
    }
    if (tmpToken != dynamic) {
      _tmpToken = tmpToken;
    }
    if (emailToken != dynamic) {
      _emailToken = emailToken;
    }
    if (phoneToken != dynamic) {
      _phoneToken = phoneToken;
    }
    if (emailVerifiedAt != dynamic) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (phoneVerifiedAt != dynamic) {
      _phoneVerifiedAt = phoneVerifiedAt;
    }
    if (acceptTerms != dynamic) {
      _acceptTerms = acceptTerms;
    }
    if (acceptMarketingOffers != dynamic) {
      _acceptMarketingOffers = acceptMarketingOffers;
    }
    if (isPermanent != dynamic) {
      _isPermanent = isPermanent;
    }
    if (reviewedAt != dynamic) {
      _reviewedAt = reviewedAt;
    }
    if (featured != dynamic) {
      _featured = featured;
    }
    if (archivedAt != dynamic) {
      _archivedAt = archivedAt;
    }
    if (archivedManuallyAt != dynamic) {
      _archivedManuallyAt = archivedManuallyAt;
    }
    if (deletionMailSentAt != dynamic) {
      _deletionMailSentAt = deletionMailSentAt;
    }
    if (fbProfile != dynamic) {
      _fbProfile = fbProfile;
    }
    if (partner != dynamic) {
      _partner = partner;
    }
    if (createdAt != dynamic) {
      _createdAt = createdAt;
    }
    if (updatedAt != dynamic) {
      _updatedAt = updatedAt;
    }
    if (reference != dynamic) {
      _reference = reference;
    }
    if (slug != dynamic) {
      _slug = slug;
    }
    if (url != dynamic) {
      _url = url;
    }
    if (phoneIntl != dynamic) {
      _phoneIntl = phoneIntl;
    }
    if (createdAtFormatted != dynamic) {
      _createdAtFormatted = createdAtFormatted;
    }
    if (userPhotoUrl != dynamic) {
      _userPhotoUrl = userPhotoUrl;
    }
    if (countryFlagUrl != dynamic) {
      _countryFlagUrl = countryFlagUrl;
    }
    if (priceLabel != dynamic) {
      _priceLabel = priceLabel;
    }
    if (priceFormatted != dynamic) {
      _priceFormatted = priceFormatted;
    }
    if (visitsFormatted != dynamic) {
      _visitsFormatted = visitsFormatted;
    }
    if (distanceInfo != dynamic) {
      _distanceInfo = distanceInfo;
    }
    if (countPictures != dynamic) {
      _countPictures = countPictures;
    }
    if (picture != dynamic) {
      _picture = picture;
    }
    if (user != dynamic) {
      _user = user;
    }
    if (category != dynamic) {
      _category = category;
    }
    if (postType != dynamic) {
      _postType = postType;
    }
    if (city != dynamic) {
      _city = city;
    }
    if (payment != dynamic) {
      _payment = payment;
    }
    if (savedByLoggedUser != dynamic) {
      _savedByLoggedUser = savedByLoggedUser;
    }
    if (pictures != dynamic) {
      _pictures = pictures;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
 dynamic get userId => _userId;
  set userId(dynamic userId) => _userId = userId;
 dynamic get paymentId => _paymentId;
  set paymentId(dynamic paymentId) => _paymentId = paymentId;
  int? get categoryId => _categoryId;
  set categoryId(int? categoryId) => _categoryId = categoryId;
 dynamic get postTypeId => _postTypeId;
  set postTypeId(dynamic postTypeId) => _postTypeId = postTypeId;
  String? get title => _title;
  set title(String? title) => _title = title;
  String? get description => _description;
  set description(String? description) => _description = description;
  List<dynamic>? get tags => _tags;
  set tags(List<dynamic>? tags) => _tags = tags;
  String? get price => _price;
  set price(String? price) => _price = price;
 dynamic get currencyCode => _currencyCode;
  set currencyCode(dynamic currencyCode) => _currencyCode = currencyCode;
 dynamic get negotiable => _negotiable;
  set negotiable(dynamic negotiable) => _negotiable = negotiable;
  String? get contactName => _contactName;
  set contactName(String? contactName) => _contactName = contactName;
  String? get authField => _authField;
  set authField(String? authField) => _authField = authField;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get phone => _phone;
  set phone(String? phone) => _phone = phone;
  String? get phoneNational => _phoneNational;
  set phoneNational(String? phoneNational) => _phoneNational = phoneNational;
  String? get phoneCountry => _phoneCountry;
  set phoneCountry(String? phoneCountry) => _phoneCountry = phoneCountry;
 dynamic get phoneHidden => _phoneHidden;
  set phoneHidden(dynamic phoneHidden) => _phoneHidden = phoneHidden;
 dynamic get address => _address;
  set address(dynamic address) => _address = address;
  int? get cityId => _cityId;
  set cityId(int? cityId) => _cityId = cityId;
 dynamic get lat => _lat;
  set lat(dynamic lat) => _lat = lat;
 dynamic get lon => _lon;
  set lon(dynamic lon) => _lon = lon;
 dynamic get createFromIp => _createFromIp;
  set createFromIp(dynamic createFromIp) => _createFromIp = createFromIp;
 dynamic get latestUpdateIp => _latestUpdateIp;
  set latestUpdateIp(dynamic latestUpdateIp) => _latestUpdateIp = latestUpdateIp;
 dynamic get visits => _visits;
  set visits(dynamic visits) => _visits = visits;
 dynamic get tmpToken => _tmpToken;
  set tmpToken(dynamic tmpToken) => _tmpToken = tmpToken;
 dynamic get emailToken => _emailToken;
  set emailToken(dynamic emailToken) => _emailToken = emailToken;
 dynamic get phoneToken => _phoneToken;
  set phoneToken(dynamic phoneToken) => _phoneToken = phoneToken;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get phoneVerifiedAt => _phoneVerifiedAt;
  set phoneVerifiedAt(String? phoneVerifiedAt) =>
      _phoneVerifiedAt = phoneVerifiedAt;
 dynamic get acceptTerms => _acceptTerms;
  set acceptTerms(dynamic acceptTerms) => _acceptTerms = acceptTerms;
 dynamic get acceptMarketingOffers => _acceptMarketingOffers;
  set acceptMarketingOffers(dynamic acceptMarketingOffers) =>
      _acceptMarketingOffers = acceptMarketingOffers;
 dynamic get isPermanent => _isPermanent;
  set isPermanent(dynamic isPermanent) => _isPermanent = isPermanent;
  String? get reviewedAt => _reviewedAt;
  set reviewedAt(String? reviewedAt) => _reviewedAt = reviewedAt;
  int? get featured => _featured;
  set featured(int? featured) => _featured = featured;
 dynamic get archivedAt => _archivedAt;
  set archivedAt(dynamic archivedAt) => _archivedAt = archivedAt;
 dynamic get archivedManuallyAt => _archivedManuallyAt;
  set archivedManuallyAt(dynamic archivedManuallyAt) =>
      _archivedManuallyAt = archivedManuallyAt;
 dynamic get deletionMailSentAt => _deletionMailSentAt;
  set deletionMailSentAt(dynamic deletionMailSentAt) =>
      _deletionMailSentAt = deletionMailSentAt;
 dynamic get fbProfile => _fbProfile;
  set fbProfile(dynamic fbProfile) => _fbProfile = fbProfile;
 dynamic get partner => _partner;
  set partner(dynamic partner) => _partner = partner;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get reference => _reference;
  set reference(int? reference) => _reference = reference;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get phoneIntl => _phoneIntl;
  set phoneIntl(String? phoneIntl) => _phoneIntl = phoneIntl;
  String? get createdAtFormatted => _createdAtFormatted;
  set createdAtFormatted(String? createdAtFormatted) =>
      _createdAtFormatted = createdAtFormatted;
  String? get userPhotoUrl => _userPhotoUrl;
  set userPhotoUrl(String? userPhotoUrl) => _userPhotoUrl = userPhotoUrl;
  String? get countryFlagUrl => _countryFlagUrl;
  set countryFlagUrl(String? countryFlagUrl) =>
      _countryFlagUrl = countryFlagUrl;
  String? get priceLabel => _priceLabel;
  set priceLabel(String? priceLabel) => _priceLabel = priceLabel;
  String? get priceFormatted => _priceFormatted;
  set priceFormatted(String? priceFormatted) =>
      _priceFormatted = priceFormatted;
  String? get visitsFormatted => _visitsFormatted;
  set visitsFormatted(String? visitsFormatted) =>
      _visitsFormatted = visitsFormatted;
 dynamic get distanceInfo => _distanceInfo;
  set distanceInfo(dynamic distanceInfo) => _distanceInfo = distanceInfo;
  int? get countPictures => _countPictures;
  set countPictures(int? countPictures) => _countPictures = countPictures;
  Picture? get picture => _picture;
  set picture(Picture? picture) => _picture = picture;
 dynamic get user => _user;
  set user(dynamic user) => _user = user;
  Category? get category => _category;
  set category(Category? category) => _category = category;
 dynamic get postType => _postType;
  set postType(dynamic postType) => _postType = postType;
  City? get city => _city;
  set city(City? city) => _city = city;
 dynamic get payment => _payment;
  set payment(dynamic payment) => _payment = payment;
  List<dynamic>? get savedByLoggedUser => _savedByLoggedUser;
  set savedByLoggedUser(List<dynamic>? savedByLoggedUser) =>
      _savedByLoggedUser = savedByLoggedUser;
  List<Pictures>? get pictures => _pictures;
  set pictures(List<Pictures>? pictures) => _pictures = pictures;

  PostModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _userId = json['user_id'];
    _paymentId = json['payment_id'];
    _categoryId = json['category_id'];
    _postTypeId = json['post_type_id'];
    _title = json['title'];
    _description = json['description'];
    if (json['tags'] != dynamic) {
      _tags = <dynamic>[];
      // json['tags'].forEach((v) {
        // _tags!.add(dynamic.fromJson(v));
      // });
    }
    _price = json['price'];
    _currencyCode = json['currency_code'];
    _negotiable = json['negotiable'];
    _contactName = json['contact_name'];
    _authField = json['auth_field'];
    _email = json['email'];
    _phone = json['phone'];
    _phoneNational = json['phone_national'];
    _phoneCountry = json['phone_country'];
    _phoneHidden = json['phone_hidden'];
    _address = json['address'];
    _cityId = json['city_id'];
    _lat = json['lat'];
    _lon = json['lon'];
    _createFromIp = json['create_from_ip'];
    _latestUpdateIp = json['latest_update_ip'];
    _visits = json['visits'];
    _tmpToken = json['tmp_token'];
    _emailToken = json['email_token'];
    _phoneToken = json['phone_token'];
    _emailVerifiedAt = json['email_verified_at'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _acceptTerms = json['accept_terms'];
    _acceptMarketingOffers = json['accept_marketing_offers'];
    _isPermanent = json['is_permanent'];
    _reviewedAt = json['reviewed_at'];
    _featured = json['featured'];
    _archivedAt = json['archived_at'];
    _archivedManuallyAt = json['archived_manually_at'];
    _deletionMailSentAt = json['deletion_mail_sent_at'];
    _fbProfile = json['fb_profile'];
    _partner = json['partner'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _reference = json['reference'];
    _slug = json['slug'];
    _url = json['url'];
    _phoneIntl = json['phone_intl'];
    _createdAtFormatted = json['created_at_formatted'];
    _userPhotoUrl = json['user_photo_url'];
    _countryFlagUrl = json['country_flag_url'];
    _priceLabel = json['price_label'];
    _priceFormatted = json['price_formatted'];
    _visitsFormatted = json['visits_formatted'];
    _distanceInfo = json['distance_info'];
    _countPictures = json['count_pictures'];
    _picture =
        json['picture'] != null ? Picture.fromJson(json['picture']) : null;
    _user = json['user'];
    _category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    _postType = json['postType'];
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    _payment = json['payment'];
        _savedByLoggedUser = [];
    if (json['savedByLoggedUser'] != null) {
      log("LOGGED USER ${json['savedByLoggedUser']}");
      _savedByLoggedUser = [];
      json['savedByLoggedUser'].forEach((v) {
        _savedByLoggedUser!.add(v);
      });
    }
    if (json['pictures'] != dynamic) {
      _pictures = <Pictures>[];
      // json['pictures'].forEach((v) {
      //   _pictures!.add(Pictures.fromJson(v));
      // });
    }


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['country_code'] = _countryCode;
    data['user_id'] = _userId;
    data['payment_id'] = _paymentId;
    data['category_id'] = _categoryId;
    data['post_type_id'] = _postTypeId;
    data['title'] = _title;
    data['description'] = _description;
    if (_tags != dynamic) {
      data['tags'] = _tags!.map((v) => v.toJson()).toList();
    }
    data['price'] = _price;
    data['currency_code'] = _currencyCode;
    data['negotiable'] = _negotiable;
    data['contact_name'] = _contactName;
    data['auth_field'] = _authField;
    data['email'] = _email;
    data['phone'] = _phone;
    data['phone_national'] = _phoneNational;
    data['phone_country'] = _phoneCountry;
    data['phone_hidden'] = _phoneHidden;
    data['address'] = _address;
    data['city_id'] = _cityId;
    data['lat'] = _lat;
    data['lon'] = _lon;
    data['create_from_ip'] = _createFromIp;
    data['latest_update_ip'] = _latestUpdateIp;
    data['visits'] = _visits;
    data['tmp_token'] = _tmpToken;
    data['email_token'] = _emailToken;
    data['phone_token'] = _phoneToken;
    data['email_verified_at'] = _emailVerifiedAt;
    data['phone_verified_at'] = _phoneVerifiedAt;
    data['accept_terms'] = _acceptTerms;
    data['accept_marketing_offers'] = _acceptMarketingOffers;
    data['is_permanent'] = _isPermanent;
    data['reviewed_at'] = _reviewedAt;
    data['featured'] = _featured;
    data['archived_at'] = _archivedAt;
    data['archived_manually_at'] = _archivedManuallyAt;
    data['deletion_mail_sent_at'] = _deletionMailSentAt;
    data['fb_profile'] = _fbProfile;
    data['partner'] = _partner;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['reference'] = _reference;
    data['slug'] = _slug;
    data['url'] = _url;
    data['phone_intl'] = _phoneIntl;
    data['created_at_formatted'] = _createdAtFormatted;
    data['user_photo_url'] = _userPhotoUrl;
    data['country_flag_url'] = _countryFlagUrl;
    data['price_label'] = _priceLabel;
    data['price_formatted'] = _priceFormatted;
    data['visits_formatted'] = _visitsFormatted;
    data['distance_info'] = _distanceInfo;
    data['count_pictures'] = _countPictures;
    if (_picture != dynamic) {
      data['picture'] = _picture!.toJson();
    }
    data['user'] = _user;
    if (_category != dynamic) {
      data['category'] = _category!.toJson();
    }
    data['postType'] = _postType;
    if (_city != dynamic) {
      data['city'] = _city!.toJson();
    }
    data['payment'] = _payment;
    if (_savedByLoggedUser != dynamic) {
      data['savedByLoggedUser'] =
          _savedByLoggedUser!.map((v) => v.toJson()).toList();
    }
    if (_pictures != dynamic) {
      data['pictures'] = _pictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Picture {
  String? _filename;
  Url? _url;

  Picture({String? filename, Url? url}) {
    if (filename != dynamic) {
      _filename = filename;
    }
    if (url != dynamic) {
      _url = url;
    }
  }

  String? get filename => _filename;
  set filename(String? filename) => _filename = filename;
  Url? get url => _url;
  set url(Url? url) => _url = url;

  Picture.fromJson(Map<String, dynamic> json) {
    _filename = json['filename'];
    _url = json['url'] != null ? Url.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['filename'] = _filename;
    if (_url != dynamic) {
      data['url'] = _url!.toJson();
    }
    return data;
  }
}

class Url {
  String? _full;
  String? _small;
  String? _medium;
  String? _big;

  Url({String? full, String? small, String? medium, String? big}) {
    if (full != dynamic) {
      _full = full;
    }
    if (small != dynamic) {
      _small = small;
    }
    if (medium != dynamic) {
      _medium = medium;
    }
    if (big != dynamic) {
      _big = big;
    }
  }

  String? get full => _full;
  set full(String? full) => _full = full;
  String? get small => _small;
  set small(String? small) => _small = small;
  String? get medium => _medium;
  set medium(String? medium) => _medium = medium;
  String? get big => _big;
  set big(String? big) => _big = big;

  Url.fromJson(Map<String, dynamic> json) {
    _full = json['full'];
    _small = json['small'];
    _medium = json['medium'];
    _big = json['big'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['full'] = _full;
    data['small'] = _small;
    data['medium'] = _medium;
    data['big'] = _big;
    return data;
  }
}

class Category {
  int? _id;
  int? _parentId;
  String? _name;
  String? _slug;
  String? _description;
  int? _hideDescription;
  String? _picture;
  String? _iconClass;
  String? _seoTitle;
  String? _seoDescription;
  String? _seoKeywords;
  int? _lft;
  int? _rgt;
  int? _depth;
  String? _type;
  int? _isForPermanent;
  int? _active;
  String? _pictureUrl;
  Parent? _parent;

  Category(
      {int? id,
      int? parentId,
      String? name,
      String? slug,
      String? description,
      int? hideDescription,
      String? picture,
      String? iconClass,
      String? seoTitle,
      String? seoDescription,
      String? seoKeywords,
      int? lft,
      int? rgt,
      int? depth,
      String? type,
      int? isForPermanent,
      int? active,
      String? pictureUrl,
      Parent? parent}) {
    if (id != dynamic) {
      _id = id;
    }
    if (parentId != dynamic) {
      _parentId = parentId;
    }
    if (name != dynamic) {
      _name = name;
    }
    if (slug != dynamic) {
      _slug = slug;
    }
    if (description != dynamic) {
      _description = description;
    }
    if (hideDescription != dynamic) {
      _hideDescription = hideDescription;
    }
    if (picture != dynamic) {
      _picture = picture;
    }
    if (iconClass != dynamic) {
      _iconClass = iconClass;
    }
    if (seoTitle != dynamic) {
      _seoTitle = seoTitle;
    }
    if (seoDescription != dynamic) {
      _seoDescription = seoDescription;
    }
    if (seoKeywords != dynamic) {
      _seoKeywords = seoKeywords;
    }
    if (lft != dynamic) {
      _lft = lft;
    }
    if (rgt != dynamic) {
      _rgt = rgt;
    }
    if (depth != dynamic) {
      _depth = depth;
    }
    if (type != dynamic) {
      _type = type;
    }
    if (isForPermanent != dynamic) {
      _isForPermanent = isForPermanent;
    }
    if (active != dynamic) {
      _active = active;
    }
    if (pictureUrl != dynamic) {
      _pictureUrl = pictureUrl;
    }
    if (parent != dynamic) {
      _parent = parent;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get parentId => _parentId;
  set parentId(int? parentId) => _parentId = parentId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get hideDescription => _hideDescription;
  set hideDescription(int? hideDescription) =>
      _hideDescription = hideDescription;
  String? get picture => _picture;
  set picture(String? picture) => _picture = picture;
  String? get iconClass => _iconClass;
  set iconClass(String? iconClass) => _iconClass = iconClass;
  String? get seoTitle => _seoTitle;
  set seoTitle(String? seoTitle) => _seoTitle = seoTitle;
  String? get seoDescription => _seoDescription;
  set seoDescription(String? seoDescription) =>
      _seoDescription = seoDescription;
  String? get seoKeywords => _seoKeywords;
  set seoKeywords(String? seoKeywords) => _seoKeywords = seoKeywords;
  int? get lft => _lft;
  set lft(int? lft) => _lft = lft;
  int? get rgt => _rgt;
  set rgt(int? rgt) => _rgt = rgt;
  int? get depth => _depth;
  set depth(int? depth) => _depth = depth;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get isForPermanent => _isForPermanent;
  set isForPermanent(int? isForPermanent) => _isForPermanent = isForPermanent;
  int? get active => _active;
  set active(int? active) => _active = active;
  String? get pictureUrl => _pictureUrl;
  set pictureUrl(String? pictureUrl) => _pictureUrl = pictureUrl;
  Parent? get parent => _parent;
  set parent(Parent? parent) => _parent = parent;

  Category.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _hideDescription = json['hide_description'];
    _picture = json['picture'];
    _iconClass = json['icon_class'];
    _seoTitle = json['seo_title'];
    _seoDescription = json['seo_description'];
    _seoKeywords = json['seo_keywords'];
    _lft = json['lft'];
    _rgt = json['rgt'];
    _depth = json['depth'];
    _type = json['type'];
    _isForPermanent = json['is_for_permanent'];
    _active = json['active'];
    _pictureUrl = json['picture_url'];
    // _parent =
    //     json['parent'] != dynamic ? Parent.fromJson(json['parent']) : dynamic;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['parent_id'] = _parentId;
    data['name'] = _name;
    data['slug'] = _slug;
    data['description'] = _description;
    data['hide_description'] = _hideDescription;
    data['picture'] = _picture;
    data['icon_class'] = _iconClass;
    data['seo_title'] = _seoTitle;
    data['seo_description'] = _seoDescription;
    data['seo_keywords'] = _seoKeywords;
    data['lft'] = _lft;
    data['rgt'] = _rgt;
    data['depth'] = _depth;
    data['type'] = _type;
    data['is_for_permanent'] = _isForPermanent;
    data['active'] = _active;
    data['picture_url'] = _pictureUrl;
    if (_parent != dynamic) {
      data['parent'] = _parent!.toJson();
    }
    return data;
  }
}

class Parent {
  int? _id;
 dynamic _parentId;
  String? _name;
  String? _slug;
  String? _description;
  int? _hideDescription;
  String? _picture;
  String? _iconClass;
  String? _seoTitle;
  String? _seoDescription;
  String? _seoKeywords;
  int? _lft;
  int? _rgt;
  int? _depth;
  String? _type;
  int? _isForPermanent;
  int? _active;
  String? _pictureUrl;
 dynamic _parent;

  Parent(
      {int? id,
     dynamic parentId,
      String? name,
      String? slug,
      String? description,
      int? hideDescription,
      String? picture,
      String? iconClass,
      String? seoTitle,
      String? seoDescription,
      String? seoKeywords,
      int? lft,
      int? rgt,
      int? depth,
      String? type,
      int? isForPermanent,
      int? active,
      String? pictureUrl,
     dynamic parent}) {
    if (id != dynamic) {
      _id = id;
    }
    if (parentId != dynamic) {
      _parentId = parentId;
    }
    if (name != dynamic) {
      _name = name;
    }
    if (slug != dynamic) {
      _slug = slug;
    }
    if (description != dynamic) {
      _description = description;
    }
    if (hideDescription != dynamic) {
      _hideDescription = hideDescription;
    }
    if (picture != dynamic) {
      _picture = picture;
    }
    if (iconClass != dynamic) {
      _iconClass = iconClass;
    }
    if (seoTitle != dynamic) {
      _seoTitle = seoTitle;
    }
    if (seoDescription != dynamic) {
      _seoDescription = seoDescription;
    }
    if (seoKeywords != dynamic) {
      _seoKeywords = seoKeywords;
    }
    if (lft != dynamic) {
      _lft = lft;
    }
    if (rgt != dynamic) {
      _rgt = rgt;
    }
    if (depth != dynamic) {
      _depth = depth;
    }
    if (type != dynamic) {
      _type = type;
    }
    if (isForPermanent != dynamic) {
      _isForPermanent = isForPermanent;
    }
    if (active != dynamic) {
      _active = active;
    }
    if (pictureUrl != dynamic) {
      _pictureUrl = pictureUrl;
    }
    if (parent != dynamic) {
      _parent = parent;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
 dynamic get parentId => _parentId;
  set parentId(dynamic parentId) => _parentId = parentId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;
  String? get description => _description;
  set description(String? description) => _description = description;
  int? get hideDescription => _hideDescription;
  set hideDescription(int? hideDescription) =>
      _hideDescription = hideDescription;
  String? get picture => _picture;
  set picture(String? picture) => _picture = picture;
  String? get iconClass => _iconClass;
  set iconClass(String? iconClass) => _iconClass = iconClass;
  String? get seoTitle => _seoTitle;
  set seoTitle(String? seoTitle) => _seoTitle = seoTitle;
  String? get seoDescription => _seoDescription;
  set seoDescription(String? seoDescription) =>
      _seoDescription = seoDescription;
  String? get seoKeywords => _seoKeywords;
  set seoKeywords(String? seoKeywords) => _seoKeywords = seoKeywords;
  int? get lft => _lft;
  set lft(int? lft) => _lft = lft;
  int? get rgt => _rgt;
  set rgt(int? rgt) => _rgt = rgt;
  int? get depth => _depth;
  set depth(int? depth) => _depth = depth;
  String? get type => _type;
  set type(String? type) => _type = type;
  int? get isForPermanent => _isForPermanent;
  set isForPermanent(int? isForPermanent) => _isForPermanent = isForPermanent;
  int? get active => _active;
  set active(int? active) => _active = active;
  String? get pictureUrl => _pictureUrl;
  set pictureUrl(String? pictureUrl) => _pictureUrl = pictureUrl;
 dynamic get parent => _parent;
  set parent(dynamic parent) => _parent = parent;

  Parent.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _parentId = json['parent_id'];
    _name = json['name'];
    _slug = json['slug'];
    _description = json['description'];
    _hideDescription = json['hide_description'];
    _picture = json['picture'];
    _iconClass = json['icon_class'];
    _seoTitle = json['seo_title'];
    _seoDescription = json['seo_description'];
    _seoKeywords = json['seo_keywords'];
    _lft = json['lft'];
    _rgt = json['rgt'];
    _depth = json['depth'];
    _type = json['type'];
    _isForPermanent = json['is_for_permanent'];
    _active = json['active'];
    _pictureUrl = json['picture_url'];
    _parent = json['parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['parent_id'] = _parentId;
    data['name'] = _name;
    data['slug'] = _slug;
    data['description'] = _description;
    data['hide_description'] = _hideDescription;
    data['picture'] = _picture;
    data['icon_class'] = _iconClass;
    data['seo_title'] = _seoTitle;
    data['seo_description'] = _seoDescription;
    data['seo_keywords'] = _seoKeywords;
    data['lft'] = _lft;
    data['rgt'] = _rgt;
    data['depth'] = _depth;
    data['type'] = _type;
    data['is_for_permanent'] = _isForPermanent;
    data['active'] = _active;
    data['picture_url'] = _pictureUrl;
    data['parent'] = _parent;
    return data;
  }
}

class City {
  int? _id;
  String? _countryCode;
  String? _name;
  int? _latitude;
  int? _longitude;
  String? _subadmin1Code;
 dynamic _subadmin2Code;
 dynamic _population;
  String? _timeZone;
  int? _active;
  int? _postsCount;

  City(
      {int? id,
      String? countryCode,
      String? name,
      int? latitude,
      int? longitude,
      String? subadmin1Code,
     dynamic subadmin2Code,
     dynamic population,
      String? timeZone,
      int? active,
      int? postsCount}) {
    if (id != dynamic) {
      _id = id;
    }
    if (countryCode != dynamic) {
      _countryCode = countryCode;
    }
    if (name != dynamic) {
      _name = name;
    }
    if (latitude != dynamic) {
      _latitude = latitude;
    }
    if (longitude != dynamic) {
      _longitude = longitude;
    }
    if (subadmin1Code != dynamic) {
      _subadmin1Code = subadmin1Code;
    }
    if (subadmin2Code != dynamic) {
      _subadmin2Code = subadmin2Code;
    }
    if (population != dynamic) {
      _population = population;
    }
    if (timeZone != dynamic) {
      _timeZone = timeZone;
    }
    if (active != dynamic) {
      _active = active;
    }
    if (postsCount != dynamic) {
      _postsCount = postsCount;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get latitude => _latitude;
  set latitude(int? latitude) => _latitude = latitude;
  int? get longitude => _longitude;
  set longitude(int? longitude) => _longitude = longitude;
  String? get subadmin1Code => _subadmin1Code;
  set subadmin1Code(String? subadmin1Code) => _subadmin1Code = subadmin1Code;
 dynamic get subadmin2Code => _subadmin2Code;
  set subadmin2Code(dynamic subadmin2Code) => _subadmin2Code = subadmin2Code;
 dynamic get population => _population;
  set population(dynamic population) => _population = population;
  String? get timeZone => _timeZone;
  set timeZone(String? timeZone) => _timeZone = timeZone;
  int? get active => _active;
  set active(int? active) => _active = active;
  int? get postsCount => _postsCount;
  set postsCount(int? postsCount) => _postsCount = postsCount;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _name = json['name'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _subadmin1Code = json['subadmin1_code'];
    _subadmin2Code = json['subadmin2_code'];
    _population = json['population'];
    _timeZone = json['time_zone'];
    _active = json['active'];
    _postsCount = json['posts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['country_code'] = _countryCode;
    data['name'] = _name;
    data['latitude'] = _latitude;
    data['longitude'] = _longitude;
    data['subadmin1_code'] = _subadmin1Code;
    data['subadmin2_code'] = _subadmin2Code;
    data['population'] = _population;
    data['time_zone'] = _timeZone;
    data['active'] = _active;
    data['posts_count'] = _postsCount;
    return data;
  }
}

class Pictures {
  int? _id;
  int? _postId;
  String? _filename;
  String? _mimeType;
  int? _position;
  int? _active;
  Url? _url;

  Pictures(
      {int? id,
      int? postId,
      String? filename,
      String? mimeType,
      int? position,
      int? active,
      Url? url}) {
    if (id != dynamic) {
      _id = id;
    }
    if (postId != dynamic) {
      _postId = postId;
    }
    if (filename != dynamic) {
      _filename = filename;
    }
    if (mimeType != dynamic) {
      _mimeType = mimeType;
    }
    if (position != dynamic) {
      _position = position;
    }
    if (active != dynamic) {
      _active = active;
    }
    if (url != dynamic) {
      _url = url;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get postId => _postId;
  set postId(int? postId) => _postId = postId;
  String? get filename => _filename;
  set filename(String? filename) => _filename = filename;
  String? get mimeType => _mimeType;
  set mimeType(String? mimeType) => _mimeType = mimeType;
  int? get position => _position;
  set position(int? position) => _position = position;
  int? get active => _active;
  set active(int? active) => _active = active;
  Url? get url => _url;
  set url(Url? url) => _url = url;

  Pictures.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _postId = json['post_id'];
    _filename = json['filename'];
    _mimeType = json['mime_type'];
    _position = json['position'];
    _active = json['active'];
    // _url = json['url'] != dynamic ? Url.fromJson(json['url']) : dynamic;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['post_id'] = _postId;
    data['filename'] = _filename;
    data['mime_type'] = _mimeType;
    data['position'] = _position;
    data['active'] = _active;
    if (_url != dynamic) {
      data['url'] = _url!.toJson();
    }
    return data;
  }
}