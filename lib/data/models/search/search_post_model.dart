class PostSearchModel {
  int? _id;
  String? _countryCode;
  int? _userId;
  dynamic _paymentId;
  int? _categoryId;
  dynamic _postTypeId;
  String? _title;
  String? _description;
  List<dynamic>? _tags;
  dynamic _price;
  String? _currencyCode;
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
  int? _lon;
  int? _lat;
  dynamic _createFromIp;
  dynamic _latestUpdateIp;
  int? _visits;
  dynamic _emailToken;
  dynamic _phoneToken;
  String? _tmpToken;
  String? _emailVerifiedAt;
  String? _phoneVerifiedAt;
  String? _reviewedAt;
  int? _acceptTerms;
  int? _acceptMarketingOffers;
  int? _isPermanent;
  int? _featured;
  dynamic _archivedAt;
  dynamic _archivedManuallyAt;
  dynamic _deletionMailSentAt;
  dynamic _fbProfile;
  dynamic _partner;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  int? _reference;
  String? _slug;
  String? _url;
  String? _phoneIntl;
  String? _createdAtFormatted;
  String? _userPhotoUrl;
  String? _countryFlagUrl;
  int? _countPictures;
  String? _picture;
  String? _pictureUrl;
  String? _pictureUrlSmall;
  String? _pictureUrlMedium;
  String? _pictureUrlBig;
  String? _priceLabel;
  String? _priceFormatted;
  String? _visitsFormatted;
  dynamic _distanceInfo;
  bool? _isSaved;
  Category? _category;
  User? _user;
  City? _city;
  List<dynamic>? _savedByLoggedUser;
  List<Pictures>? _pictures;

  PostSearchModel(
      {int? id,
      String? countryCode,
      int? userId,
      dynamic paymentId,
      int? categoryId,
      dynamic postTypeId,
      String? title,
      String? description,
      List<dynamic>? tags,
      dynamic price,
      String? currencyCode,
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
      int? lon,
      int? lat,
      dynamic createFromIp,
      dynamic latestUpdateIp,
      int? visits,
      dynamic emailToken,
      dynamic phoneToken,
      String? tmpToken,
      String? emailVerifiedAt,
      String? phoneVerifiedAt,
      String? reviewedAt,
      int? acceptTerms,
      int? acceptMarketingOffers,
      int? isPermanent,
      int? featured,
      dynamic archivedAt,
      dynamic archivedManuallyAt,
      dynamic deletionMailSentAt,
      dynamic fbProfile,
      dynamic partner,
      dynamic deletedAt,
      String? createdAt,
      String? updatedAt,
      int? reference,
      String? slug,
      String? url,
      String? phoneIntl,
      String? createdAtFormatted,
      String? userPhotoUrl,
      String? countryFlagUrl,
      int? countPictures,
      String? picture,
      String? pictureUrl,
      String? pictureUrlSmall,
      String? pictureUrlMedium,
      String? pictureUrlBig,
      String? priceLabel,
      String? priceFormatted,
      String? visitsFormatted,
      dynamic distanceInfo,
      bool? isSaved,
      Category? category,
      User? user,
      City? city,
      List<dynamic>? savedByLoggedUser,
      List<Pictures>? pictures}) {
    if (id != null) {
      _id = id;
    }
    if (countryCode != null) {
      _countryCode = countryCode;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (paymentId != null) {
      _paymentId = paymentId;
    }
    if (categoryId != null) {
      _categoryId = categoryId;
    }
    if (postTypeId != null) {
      _postTypeId = postTypeId;
    }
    if (title != null) {
      _title = title;
    }
    if (description != null) {
      _description = description;
    }
    if (tags != null) {
      _tags = tags;
    }
    if (price != null) {
      _price = price;
    }
    if (currencyCode != null) {
      _currencyCode = currencyCode;
    }
    if (negotiable != null) {
      _negotiable = negotiable;
    }
    if (contactName != null) {
      _contactName = contactName;
    }
    if (authField != null) {
      _authField = authField;
    }
    if (email != null) {
      _email = email;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (phoneNational != null) {
      _phoneNational = phoneNational;
    }
    if (phoneCountry != null) {
      _phoneCountry = phoneCountry;
    }
    if (phoneHidden != null) {
      _phoneHidden = phoneHidden;
    }
    if (address != null) {
      _address = address;
    }
    if (cityId != null) {
      _cityId = cityId;
    }
    if (lon != null) {
      _lon = lon;
    }
    if (lat != null) {
      _lat = lat;
    }
    if (createFromIp != null) {
      _createFromIp = createFromIp;
    }
    if (latestUpdateIp != null) {
      _latestUpdateIp = latestUpdateIp;
    }
    if (visits != null) {
      _visits = visits;
    }
    if (emailToken != null) {
      _emailToken = emailToken;
    }
    if (phoneToken != null) {
      _phoneToken = phoneToken;
    }
    if (tmpToken != null) {
      _tmpToken = tmpToken;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (phoneVerifiedAt != null) {
      _phoneVerifiedAt = phoneVerifiedAt;
    }
    if (reviewedAt != null) {
      _reviewedAt = reviewedAt;
    }
    if (acceptTerms != null) {
      _acceptTerms = acceptTerms;
    }
    if (acceptMarketingOffers != null) {
      _acceptMarketingOffers = acceptMarketingOffers;
    }
    if (isPermanent != null) {
      _isPermanent = isPermanent;
    }
    if (featured != null) {
      _featured = featured;
    }
    if (archivedAt != null) {
      _archivedAt = archivedAt;
    }
    if (archivedManuallyAt != null) {
      _archivedManuallyAt = archivedManuallyAt;
    }
    if (deletionMailSentAt != null) {
      _deletionMailSentAt = deletionMailSentAt;
    }
    if (fbProfile != null) {
      _fbProfile = fbProfile;
    }
    if (partner != null) {
      _partner = partner;
    }
    if (deletedAt != null) {
      _deletedAt = deletedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (reference != null) {
      _reference = reference;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (url != null) {
      _url = url;
    }
    if (phoneIntl != null) {
      _phoneIntl = phoneIntl;
    }
    if (createdAtFormatted != null) {
      _createdAtFormatted = createdAtFormatted;
    }
    if (userPhotoUrl != null) {
      _userPhotoUrl = userPhotoUrl;
    }
    if (countryFlagUrl != null) {
      _countryFlagUrl = countryFlagUrl;
    }
    if (countPictures != null) {
      _countPictures = countPictures;
    }
    if (picture != null) {
      _picture = picture;
    }
    if (pictureUrl != null) {
      _pictureUrl = pictureUrl;
    }
    if (pictureUrlSmall != null) {
      _pictureUrlSmall = pictureUrlSmall;
    }
    if (pictureUrlMedium != null) {
      _pictureUrlMedium = pictureUrlMedium;
    }
    if (pictureUrlBig != null) {
      _pictureUrlBig = pictureUrlBig;
    }
    if (priceLabel != null) {
      _priceLabel = priceLabel;
    }
    if (priceFormatted != null) {
      _priceFormatted = priceFormatted;
    }
    if (visitsFormatted != null) {
      _visitsFormatted = visitsFormatted;
    }
    if (distanceInfo != null) {
      _distanceInfo = distanceInfo;
    }
    if (isSaved != null) {
      _isSaved = isSaved;
    }
    if (category != null) {
      _category = category;
    }
    if (user != null) {
      _user = user;
    }
    if (city != null) {
      _city = city;
    }
    if (savedByLoggedUser != null) {
      _savedByLoggedUser = savedByLoggedUser;
    }
    if (pictures != null) {
      _pictures = pictures;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
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
  dynamic get price => _price;
  set price(dynamic price) => _price = price;
  String? get currencyCode => _currencyCode;
  set currencyCode(String? currencyCode) => _currencyCode = currencyCode;
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
  int? get lon => _lon;
  set lon(int? lon) => _lon = lon;
  int? get lat => _lat;
  set lat(int? lat) => _lat = lat;
  dynamic get createFromIp => _createFromIp;
  set createFromIp(dynamic createFromIp) => _createFromIp = createFromIp;
  dynamic get latestUpdateIp => _latestUpdateIp;
  set latestUpdateIp(dynamic latestUpdateIp) => _latestUpdateIp = latestUpdateIp;
  int? get visits => _visits;
  set visits(int? visits) => _visits = visits;
  dynamic get emailToken => _emailToken;
  set emailToken(dynamic emailToken) => _emailToken = emailToken;
  dynamic get phoneToken => _phoneToken;
  set phoneToken(dynamic phoneToken) => _phoneToken = phoneToken;
  String? get tmpToken => _tmpToken;
  set tmpToken(String? tmpToken) => _tmpToken = tmpToken;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get phoneVerifiedAt => _phoneVerifiedAt;
  set phoneVerifiedAt(String? phoneVerifiedAt) =>
      _phoneVerifiedAt = phoneVerifiedAt;
  String? get reviewedAt => _reviewedAt;
  set reviewedAt(String? reviewedAt) => _reviewedAt = reviewedAt;
  int? get acceptTerms => _acceptTerms;
  set acceptTerms(int? acceptTerms) => _acceptTerms = acceptTerms;
  int? get acceptMarketingOffers => _acceptMarketingOffers;
  set acceptMarketingOffers(int? acceptMarketingOffers) =>
      _acceptMarketingOffers = acceptMarketingOffers;
  int? get isPermanent => _isPermanent;
  set isPermanent(int? isPermanent) => _isPermanent = isPermanent;
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
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;
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
  int? get countPictures => _countPictures;
  set countPictures(int? countPictures) => _countPictures = countPictures;
  String? get picture => _picture;
  set picture(String? picture) => _picture = picture;
  String? get pictureUrl => _pictureUrl;
  set pictureUrl(String? pictureUrl) => _pictureUrl = pictureUrl;
  String? get pictureUrlSmall => _pictureUrlSmall;
  set pictureUrlSmall(String? pictureUrlSmall) =>
      _pictureUrlSmall = pictureUrlSmall;
  String? get pictureUrlMedium => _pictureUrlMedium;
  set pictureUrlMedium(String? pictureUrlMedium) =>
      _pictureUrlMedium = pictureUrlMedium;
  String? get pictureUrlBig => _pictureUrlBig;
  set pictureUrlBig(String? pictureUrlBig) => _pictureUrlBig = pictureUrlBig;
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
  bool? get isSaved => _isSaved;
  set isSaved(bool? isSaved) => _isSaved = isSaved;
  Category? get category => _category;
  set category(Category? category) => _category = category;
  User? get user => _user;
  set user(User? user) => _user = user;
  City? get city => _city;
  set city(City? city) => _city = city;
  List<dynamic>? get savedByLoggedUser => _savedByLoggedUser;
  set savedByLoggedUser(List<dynamic>? savedByLoggedUser) =>
      _savedByLoggedUser = savedByLoggedUser;
  List<Pictures>? get pictures => _pictures;
  set pictures(List<Pictures>? pictures) => _pictures = pictures;

  PostSearchModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _userId = json['user_id'];
    _paymentId = json['payment_id'];
    _categoryId = json['category_id'];
    _postTypeId = json['post_type_id'];
    _title = json['title'];
    _description = json['description'];
    if (json['tags'] != null) {
      _tags = <dynamic>[];
      json['tags'].forEach((v) {
        _tags!.add(v);
      });
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
    _lon = json['lon'];
    _lat = json['lat'];
    _createFromIp = json['create_from_ip'];
    _latestUpdateIp = json['latest_update_ip'];
    _visits = json['visits'];
    _emailToken = json['email_token'];
    _phoneToken = json['phone_token'];
    _tmpToken = json['tmp_token'];
    _emailVerifiedAt = json['email_verified_at'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _reviewedAt = json['reviewed_at'];
    _acceptTerms = json['accept_terms'];
    _acceptMarketingOffers = json['accept_marketing_offers'];
    _isPermanent = json['is_permanent'];
    _featured = json['featured'];
    _archivedAt = json['archived_at'];
    _archivedManuallyAt = json['archived_manually_at'];
    _deletionMailSentAt = json['deletion_mail_sent_at'];
    _fbProfile = json['fb_profile'];
    _partner = json['partner'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _reference = json['reference'];
    _slug = json['slug'];
    _url = json['url'];
    _phoneIntl = json['phone_intl'];
    _createdAtFormatted = json['created_at_formatted'];
    _userPhotoUrl = json['user_photo_url'];
    _countryFlagUrl = json['country_flag_url'];
    _countPictures = json['count_pictures'];
    _picture = json['picture'];
    _pictureUrl = json['picture_url'];
    _pictureUrlSmall = json['picture_url_small'];
    _pictureUrlMedium = json['picture_url_medium'];
    _pictureUrlBig = json['picture_url_big'];
    _priceLabel = json['price_label'];
    _priceFormatted = json['price_formatted'];
    _visitsFormatted = json['visits_formatted'];
    _distanceInfo = json['distance_info'];
    _isSaved = json['is_saved'];
    _category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _city = json['city'] != null ? City.fromJson(json['city']) : null;
    if (json['saved_by_logged_user'] != null) {
      _savedByLoggedUser = <dynamic>[];
      json['saved_by_logged_user'].forEach((v) {
        // _savedByLoggedUser!.add(new dynamic.fromJson(v));
      });
    }
    if (json['pictures'] != null) {
      _pictures = <Pictures>[];
      json['pictures'].forEach((v) {
        _pictures!.add(Pictures.fromJson(v));
      });
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
    if (_tags != null) {
      // data['tags'] = this._tags!.map((v) => v.toJson()).toList();
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
    data['lon'] = _lon;
    data['lat'] = _lat;
    data['create_from_ip'] = _createFromIp;
    data['latest_update_ip'] = _latestUpdateIp;
    data['visits'] = _visits;
    data['email_token'] = _emailToken;
    data['phone_token'] = _phoneToken;
    data['tmp_token'] = _tmpToken;
    data['email_verified_at'] = _emailVerifiedAt;
    data['phone_verified_at'] = _phoneVerifiedAt;
    data['reviewed_at'] = _reviewedAt;
    data['accept_terms'] = _acceptTerms;
    data['accept_marketing_offers'] = _acceptMarketingOffers;
    data['is_permanent'] = _isPermanent;
    data['featured'] = _featured;
    data['archived_at'] = _archivedAt;
    data['archived_manually_at'] = _archivedManuallyAt;
    data['deletion_mail_sent_at'] = _deletionMailSentAt;
    data['fb_profile'] = _fbProfile;
    data['partner'] = _partner;
    data['deleted_at'] = _deletedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['reference'] = _reference;
    data['slug'] = _slug;
    data['url'] = _url;
    data['phone_intl'] = _phoneIntl;
    data['created_at_formatted'] = _createdAtFormatted;
    data['user_photo_url'] = _userPhotoUrl;
    data['country_flag_url'] = _countryFlagUrl;
    data['count_pictures'] = _countPictures;
    data['picture'] = _picture;
    data['picture_url'] = _pictureUrl;
    data['picture_url_small'] = _pictureUrlSmall;
    data['picture_url_medium'] = _pictureUrlMedium;
    data['picture_url_big'] = _pictureUrlBig;
    data['price_label'] = _priceLabel;
    data['price_formatted'] = _priceFormatted;
    data['visits_formatted'] = _visitsFormatted;
    data['distance_info'] = _distanceInfo;
    data['is_saved'] = _isSaved;
    if (_category != null) {
      data['category'] = _category!.toJson();
    }
    if (_user != null) {
      data['user'] = _user!.toJson();
    }
    if (_city != null) {
      data['city'] = _city!.toJson();
    }
    if (_savedByLoggedUser != null) {
      // data['saved_by_logged_user'] =
          // this._savedByLoggedUser!.map((v) => v.toJson()).toList();
    }
    if (_pictures != null) {
      data['pictures'] = _pictures!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
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

  Category(
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
      String? pictureUrl}) {
    if (id != null) {
      _id = id;
    }
    if (parentId != null) {
      _parentId = parentId;
    }
    if (name != null) {
      _name = name;
    }
    if (slug != null) {
      _slug = slug;
    }
    if (description != null) {
      _description = description;
    }
    if (hideDescription != null) {
      _hideDescription = hideDescription;
    }
    if (picture != null) {
      _picture = picture;
    }
    if (iconClass != null) {
      _iconClass = iconClass;
    }
    if (seoTitle != null) {
      _seoTitle = seoTitle;
    }
    if (seoDescription != null) {
      _seoDescription = seoDescription;
    }
    if (seoKeywords != null) {
      _seoKeywords = seoKeywords;
    }
    if (lft != null) {
      _lft = lft;
    }
    if (rgt != null) {
      _rgt = rgt;
    }
    if (depth != null) {
      _depth = depth;
    }
    if (type != null) {
      _type = type;
    }
    if (isForPermanent != null) {
      _isForPermanent = isForPermanent;
    }
    if (active != null) {
      _active = active;
    }
    if (pictureUrl != null) {
      _pictureUrl = pictureUrl;
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
    return data;
  }
}

class User {
  int? _id;
  String? _countryCode;
  dynamic _languageCode;
  dynamic _userTypeId;
  int? _genderId;
  String? _name;
  dynamic _photo;
  dynamic _about;
  String? _authField;
  String? _email;
  String? _phone;
  String? _phoneNational;
  String? _phoneCountry;
  int? _phoneHidden;
  String? _username;
  int? _isAdmin;
  int? _canBeImpersonated;
  int? _disableComments;
  dynamic _createFromIp;
  dynamic _latestUpdateIp;
  dynamic _provider;
  dynamic _providerId;
  String? _emailToken;
  String? _phoneToken;
  String? _emailVerifiedAt;
  String? _phoneVerifiedAt;
  int? _acceptTerms;
  int? _acceptMarketingOffers;
  dynamic _timeZone;
  int? _featured;
  int? _blocked;
  int? _closed;
  String? _lastActivity;
  String? _lastLoginAt;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _phoneIntl;
  String? _createdAtFormatted;
  String? _photoUrl;
  String? _originalUpdatedAt;
  dynamic _originalLastActivity;
  bool? _pIsOnline;
  String? _countryFlagUrl;
  dynamic _remainingPosts;
  List<dynamic>? _permissions;
  List<Roles>? _roles;

  User(
      {int? id,
      String? countryCode,
      dynamic languageCode,
      dynamic userTypeId,
      int? genderId,
      String? name,
      dynamic photo,
      dynamic about,
      String? authField,
      String? email,
      String? phone,
      String? phoneNational,
      String? phoneCountry,
      int? phoneHidden,
      String? username,
      int? isAdmin,
      int? canBeImpersonated,
      int? disableComments,
      dynamic createFromIp,
      dynamic latestUpdateIp,
      dynamic provider,
      dynamic providerId,
      String? emailToken,
      String? phoneToken,
      String? emailVerifiedAt,
      String? phoneVerifiedAt,
      int? acceptTerms,
      int? acceptMarketingOffers,
      dynamic timeZone,
      int? featured,
      int? blocked,
      int? closed,
      String? lastActivity,
      String? lastLoginAt,
      String? deletedAt,
      String? createdAt,
      String? updatedAt,
      String? phoneIntl,
      String? createdAtFormatted,
      String? photoUrl,
      String? originalUpdatedAt,
      dynamic originalLastActivity,
      bool? pIsOnline,
      String? countryFlagUrl,
      dynamic remainingPosts,
      List<dynamic>? permissions,
      List<Roles>? roles}) {
    if (id != null) {
      _id = id;
    }
    if (countryCode != null) {
      _countryCode = countryCode;
    }
    if (languageCode != null) {
      _languageCode = languageCode;
    }
    if (userTypeId != null) {
      _userTypeId = userTypeId;
    }
    if (genderId != null) {
      _genderId = genderId;
    }
    if (name != null) {
      _name = name;
    }
    if (photo != null) {
      _photo = photo;
    }
    if (about != null) {
      _about = about;
    }
    if (authField != null) {
      _authField = authField;
    }
    if (email != null) {
      _email = email;
    }
    if (phone != null) {
      _phone = phone;
    }
    if (phoneNational != null) {
      _phoneNational = phoneNational;
    }
    if (phoneCountry != null) {
      _phoneCountry = phoneCountry;
    }
    if (phoneHidden != null) {
      _phoneHidden = phoneHidden;
    }
    if (username != null) {
      _username = username;
    }
    if (isAdmin != null) {
      _isAdmin = isAdmin;
    }
    if (canBeImpersonated != null) {
      _canBeImpersonated = canBeImpersonated;
    }
    if (disableComments != null) {
      _disableComments = disableComments;
    }
    if (createFromIp != null) {
      _createFromIp = createFromIp;
    }
    if (latestUpdateIp != null) {
      _latestUpdateIp = latestUpdateIp;
    }
    if (provider != null) {
      _provider = provider;
    }
    if (providerId != null) {
      _providerId = providerId;
    }
    if (emailToken != null) {
      _emailToken = emailToken;
    }
    if (phoneToken != null) {
      _phoneToken = phoneToken;
    }
    if (emailVerifiedAt != null) {
      _emailVerifiedAt = emailVerifiedAt;
    }
    if (phoneVerifiedAt != null) {
      _phoneVerifiedAt = phoneVerifiedAt;
    }
    if (acceptTerms != null) {
      _acceptTerms = acceptTerms;
    }
    if (acceptMarketingOffers != null) {
      _acceptMarketingOffers = acceptMarketingOffers;
    }
    if (timeZone != null) {
      _timeZone = timeZone;
    }
    if (featured != null) {
      _featured = featured;
    }
    if (blocked != null) {
      _blocked = blocked;
    }
    if (closed != null) {
      _closed = closed;
    }
    if (lastActivity != null) {
      _lastActivity = lastActivity;
    }
    if (lastLoginAt != null) {
      _lastLoginAt = lastLoginAt;
    }
    if (deletedAt != null) {
      _deletedAt = deletedAt;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (phoneIntl != null) {
      _phoneIntl = phoneIntl;
    }
    if (createdAtFormatted != null) {
      _createdAtFormatted = createdAtFormatted;
    }
    if (photoUrl != null) {
      _photoUrl = photoUrl;
    }
    if (originalUpdatedAt != null) {
      _originalUpdatedAt = originalUpdatedAt;
    }
    if (originalLastActivity != null) {
      _originalLastActivity = originalLastActivity;
    }
    if (pIsOnline != null) {
      _pIsOnline = pIsOnline;
    }
    if (countryFlagUrl != null) {
      _countryFlagUrl = countryFlagUrl;
    }
    if (remainingPosts != null) {
      _remainingPosts = remainingPosts;
    }
    if (permissions != null) {
      _permissions = permissions;
    }
    if (roles != null) {
      _roles = roles;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  dynamic get languageCode => _languageCode;
  set languageCode(dynamic languageCode) => _languageCode = languageCode;
  dynamic get userTypeId => _userTypeId;
  set userTypeId(dynamic userTypeId) => _userTypeId = userTypeId;
  int? get genderId => _genderId;
  set genderId(int? genderId) => _genderId = genderId;
  String? get name => _name;
  set name(String? name) => _name = name;
  dynamic get photo => _photo;
  set photo(dynamic photo) => _photo = photo;
  dynamic get about => _about;
  set about(dynamic about) => _about = about;
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
  int? get phoneHidden => _phoneHidden;
  set phoneHidden(int? phoneHidden) => _phoneHidden = phoneHidden;
  String? get username => _username;
  set username(String? username) => _username = username;
  int? get isAdmin => _isAdmin;
  set isAdmin(int? isAdmin) => _isAdmin = isAdmin;
  int? get canBeImpersonated => _canBeImpersonated;
  set canBeImpersonated(int? canBeImpersonated) =>
      _canBeImpersonated = canBeImpersonated;
  int? get disableComments => _disableComments;
  set disableComments(int? disableComments) =>
      _disableComments = disableComments;
  dynamic get createFromIp => _createFromIp;
  set createFromIp(dynamic createFromIp) => _createFromIp = createFromIp;
  dynamic get latestUpdateIp => _latestUpdateIp;
  set latestUpdateIp(dynamic latestUpdateIp) => _latestUpdateIp = latestUpdateIp;
  dynamic get provider => _provider;
  set provider(dynamic provider) => _provider = provider;
  dynamic get providerId => _providerId;
  set providerId(dynamic providerId) => _providerId = providerId;
  String? get emailToken => _emailToken;
  set emailToken(String? emailToken) => _emailToken = emailToken;
  String? get phoneToken => _phoneToken;
  set phoneToken(String? phoneToken) => _phoneToken = phoneToken;
  String? get emailVerifiedAt => _emailVerifiedAt;
  set emailVerifiedAt(String? emailVerifiedAt) =>
      _emailVerifiedAt = emailVerifiedAt;
  String? get phoneVerifiedAt => _phoneVerifiedAt;
  set phoneVerifiedAt(String? phoneVerifiedAt) =>
      _phoneVerifiedAt = phoneVerifiedAt;
  int? get acceptTerms => _acceptTerms;
  set acceptTerms(int? acceptTerms) => _acceptTerms = acceptTerms;
  int? get acceptMarketingOffers => _acceptMarketingOffers;
  set acceptMarketingOffers(int? acceptMarketingOffers) =>
      _acceptMarketingOffers = acceptMarketingOffers;
  dynamic get timeZone => _timeZone;
  set timeZone(dynamic timeZone) => _timeZone = timeZone;
  int? get featured => _featured;
  set featured(int? featured) => _featured = featured;
  int? get blocked => _blocked;
  set blocked(int? blocked) => _blocked = blocked;
  int? get closed => _closed;
  set closed(int? closed) => _closed = closed;
  String? get lastActivity => _lastActivity;
  set lastActivity(String? lastActivity) => _lastActivity = lastActivity;
  String? get lastLoginAt => _lastLoginAt;
  set lastLoginAt(String? lastLoginAt) => _lastLoginAt = lastLoginAt;
  String? get deletedAt => _deletedAt;
  set deletedAt(String? deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get phoneIntl => _phoneIntl;
  set phoneIntl(String? phoneIntl) => _phoneIntl = phoneIntl;
  String? get createdAtFormatted => _createdAtFormatted;
  set createdAtFormatted(String? createdAtFormatted) =>
      _createdAtFormatted = createdAtFormatted;
  String? get photoUrl => _photoUrl;
  set photoUrl(String? photoUrl) => _photoUrl = photoUrl;
  String? get originalUpdatedAt => _originalUpdatedAt;
  set originalUpdatedAt(String? originalUpdatedAt) =>
      _originalUpdatedAt = originalUpdatedAt;
  dynamic get originalLastActivity => _originalLastActivity;
  set originalLastActivity(dynamic originalLastActivity) =>
      _originalLastActivity = originalLastActivity;
  bool? get pIsOnline => _pIsOnline;
  set pIsOnline(bool? pIsOnline) => _pIsOnline = pIsOnline;
  String? get countryFlagUrl => _countryFlagUrl;
  set countryFlagUrl(String? countryFlagUrl) =>
      _countryFlagUrl = countryFlagUrl;
  dynamic get remainingPosts => _remainingPosts;
  set remainingPosts(dynamic remainingPosts) => _remainingPosts = remainingPosts;
  List<dynamic>? get permissions => _permissions;
  set permissions(List<dynamic>? permissions) => _permissions = permissions;
  List<Roles>? get roles => _roles;
  set roles(List<Roles>? roles) => _roles = roles;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _languageCode = json['language_code'];
    _userTypeId = json['user_type_id'];
    _genderId = json['gender_id'];
    _name = json['name'];
    _photo = json['photo'];
    _about = json['about'];
    _authField = json['auth_field'];
    _email = json['email'];
    _phone = json['phone'];
    _phoneNational = json['phone_national'];
    _phoneCountry = json['phone_country'];
    _phoneHidden = json['phone_hidden'];
    _username = json['username'];
    _isAdmin = json['is_admin'];
    _canBeImpersonated = json['can_be_impersonated'];
    _disableComments = json['disable_comments'];
    _createFromIp = json['create_from_ip'];
    _latestUpdateIp = json['latest_update_ip'];
    _provider = json['provider'];
    _providerId = json['provider_id'];
    _emailToken = json['email_token'];
    _phoneToken = json['phone_token'];
    _emailVerifiedAt = json['email_verified_at'];
    _phoneVerifiedAt = json['phone_verified_at'];
    _acceptTerms = json['accept_terms'];
    _acceptMarketingOffers = json['accept_marketing_offers'];
    _timeZone = json['time_zone'];
    _featured = json['featured'];
    _blocked = json['blocked'];
    _closed = json['closed'];
    _lastActivity = json['last_activity'];
    _lastLoginAt = json['last_login_at'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _phoneIntl = json['phone_intl'];
    _createdAtFormatted = json['created_at_formatted'];
    _photoUrl = json['photo_url'];
    _originalUpdatedAt = json['original_updated_at'];
    _originalLastActivity = json['original_last_activity'];
    _pIsOnline = json['p_is_online'];
    _countryFlagUrl = json['country_flag_url'];
    _remainingPosts = json['remaining_posts'];
    if (json['permissions'] != null) {
      _permissions = <dynamic>[];
      json['permissions'].forEach((v) {
        // _permissions!.add(new dynamic.fromJson(v));
      });
    }
    if (json['roles'] != null) {
      _roles = <Roles>[];
      json['roles'].forEach((v) {
        _roles!.add(Roles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['country_code'] = _countryCode;
    data['language_code'] = _languageCode;
    data['user_type_id'] = _userTypeId;
    data['gender_id'] = _genderId;
    data['name'] = _name;
    data['photo'] = _photo;
    data['about'] = _about;
    data['auth_field'] = _authField;
    data['email'] = _email;
    data['phone'] = _phone;
    data['phone_national'] = _phoneNational;
    data['phone_country'] = _phoneCountry;
    data['phone_hidden'] = _phoneHidden;
    data['username'] = _username;
    data['is_admin'] = _isAdmin;
    data['can_be_impersonated'] = _canBeImpersonated;
    data['disable_comments'] = _disableComments;
    data['create_from_ip'] = _createFromIp;
    data['latest_update_ip'] = _latestUpdateIp;
    data['provider'] = _provider;
    data['provider_id'] = _providerId;
    data['email_token'] = _emailToken;
    data['phone_token'] = _phoneToken;
    data['email_verified_at'] = _emailVerifiedAt;
    data['phone_verified_at'] = _phoneVerifiedAt;
    data['accept_terms'] = _acceptTerms;
    data['accept_marketing_offers'] = _acceptMarketingOffers;
    data['time_zone'] = _timeZone;
    data['featured'] = _featured;
    data['blocked'] = _blocked;
    data['closed'] = _closed;
    data['last_activity'] = _lastActivity;
    data['last_login_at'] = _lastLoginAt;
    data['deleted_at'] = _deletedAt;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['phone_intl'] = _phoneIntl;
    data['created_at_formatted'] = _createdAtFormatted;
    data['photo_url'] = _photoUrl;
    data['original_updated_at'] = _originalUpdatedAt;
    data['original_last_activity'] = _originalLastActivity;
    data['p_is_online'] = _pIsOnline;
    data['country_flag_url'] = _countryFlagUrl;
    data['remaining_posts'] = _remainingPosts;
    if (_permissions != null) {
      // data['permissions'] = this._permissions!.map((v) => v.toJson()).toList();
    }
    if (_roles != null) {
      data['roles'] = _roles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Roles {
  int? _id;
  String? _name;
  String? _guardName;
  String? _createdAt;
  String? _updatedAt;
  Pivot? _pivot;

  Roles(
      {int? id,
      String? name,
      String? guardName,
      String? createdAt,
      String? updatedAt,
      Pivot? pivot}) {
    if (id != null) {
      _id = id;
    }
    if (name != null) {
      _name = name;
    }
    if (guardName != null) {
      _guardName = guardName;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (pivot != null) {
      _pivot = pivot;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get guardName => _guardName;
  set guardName(String? guardName) => _guardName = guardName;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  Pivot? get pivot => _pivot;
  set pivot(Pivot? pivot) => _pivot = pivot;

  Roles.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _guardName = json['guard_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['name'] = _name;
    data['guard_name'] = _guardName;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    if (_pivot != null) {
      data['pivot'] = _pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? _modelType;
  int? _modelId;
  int? _roleId;

  Pivot({String? modelType, int? modelId, int? roleId}) {
    if (modelType != null) {
      _modelType = modelType;
    }
    if (modelId != null) {
      _modelId = modelId;
    }
    if (roleId != null) {
      _roleId = roleId;
    }
  }

  String? get modelType => _modelType;
  set modelType(String? modelType) => _modelType = modelType;
  int? get modelId => _modelId;
  set modelId(int? modelId) => _modelId = modelId;
  int? get roleId => _roleId;
  set roleId(int? roleId) => _roleId = roleId;

  Pivot.fromJson(Map<String, dynamic> json) {
    _modelType = json['model_type'];
    _modelId = json['model_id'];
    _roleId = json['role_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model_type'] = _modelType;
    data['model_id'] = _modelId;
    data['role_id'] = _roleId;
    return data;
  }
}

class City {
  int? _id;
  String? _countryCode;
  String? _name;
  int? _longitude;
  int? _latitude;
  dynamic _featureClass;
  dynamic _featureCode;
  String? _subadmin1Code;
  dynamic _subadmin2Code;
  dynamic _population;
  String? _timeZone;
  int? _active;
  String? _createdAt;
  String? _updatedAt;
  String? _slug;

  City(
      {int? id,
      String? countryCode,
      String? name,
      int? longitude,
      int? latitude,
      dynamic featureClass,
      dynamic featureCode,
      String? subadmin1Code,
      dynamic subadmin2Code,
      dynamic population,
      String? timeZone,
      int? active,
      String? createdAt,
      String? updatedAt,
      String? slug}) {
    if (id != null) {
      _id = id;
    }
    if (countryCode != null) {
      _countryCode = countryCode;
    }
    if (name != null) {
      _name = name;
    }
    if (longitude != null) {
      _longitude = longitude;
    }
    if (latitude != null) {
      _latitude = latitude;
    }
    if (featureClass != null) {
      _featureClass = featureClass;
    }
    if (featureCode != null) {
      _featureCode = featureCode;
    }
    if (subadmin1Code != null) {
      _subadmin1Code = subadmin1Code;
    }
    if (subadmin2Code != null) {
      _subadmin2Code = subadmin2Code;
    }
    if (population != null) {
      _population = population;
    }
    if (timeZone != null) {
      _timeZone = timeZone;
    }
    if (active != null) {
      _active = active;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (slug != null) {
      _slug = slug;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get countryCode => _countryCode;
  set countryCode(String? countryCode) => _countryCode = countryCode;
  String? get name => _name;
  set name(String? name) => _name = name;
  int? get longitude => _longitude;
  set longitude(int? longitude) => _longitude = longitude;
  int? get latitude => _latitude;
  set latitude(int? latitude) => _latitude = latitude;
  dynamic get featureClass => _featureClass;
  set featureClass(dynamic featureClass) => _featureClass = featureClass;
  dynamic get featureCode => _featureCode;
  set featureCode(dynamic featureCode) => _featureCode = featureCode;
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
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get slug => _slug;
  set slug(String? slug) => _slug = slug;

  City.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _countryCode = json['country_code'];
    _name = json['name'];
    _longitude = json['longitude'];
    _latitude = json['latitude'];
    _featureClass = json['feature_class'];
    _featureCode = json['feature_code'];
    _subadmin1Code = json['subadmin1_code'];
    _subadmin2Code = json['subadmin2_code'];
    _population = json['population'];
    _timeZone = json['time_zone'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['country_code'] = _countryCode;
    data['name'] = _name;
    data['longitude'] = _longitude;
    data['latitude'] = _latitude;
    data['feature_class'] = _featureClass;
    data['feature_code'] = _featureCode;
    data['subadmin1_code'] = _subadmin1Code;
    data['subadmin2_code'] = _subadmin2Code;
    data['population'] = _population;
    data['time_zone'] = _timeZone;
    data['active'] = _active;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['slug'] = _slug;
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
  String? _createdAt;
  String? _updatedAt;
  String? _filenameUrl;
  String? _filenameUrlSmall;
  String? _filenameUrlMedium;
  String? _filenameUrlBig;

  Pictures(
      {int? id,
      int? postId,
      String? filename,
      String? mimeType,
      int? position,
      int? active,
      String? createdAt,
      String? updatedAt,
      String? filenameUrl,
      String? filenameUrlSmall,
      String? filenameUrlMedium,
      String? filenameUrlBig}) {
    if (id != null) {
      _id = id;
    }
    if (postId != null) {
      _postId = postId;
    }
    if (filename != null) {
      _filename = filename;
    }
    if (mimeType != null) {
      _mimeType = mimeType;
    }
    if (position != null) {
      _position = position;
    }
    if (active != null) {
      _active = active;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (filenameUrl != null) {
      _filenameUrl = filenameUrl;
    }
    if (filenameUrlSmall != null) {
      _filenameUrlSmall = filenameUrlSmall;
    }
    if (filenameUrlMedium != null) {
      _filenameUrlMedium = filenameUrlMedium;
    }
    if (filenameUrlBig != null) {
      _filenameUrlBig = filenameUrlBig;
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
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get filenameUrl => _filenameUrl;
  set filenameUrl(String? filenameUrl) => _filenameUrl = filenameUrl;
  String? get filenameUrlSmall => _filenameUrlSmall;
  set filenameUrlSmall(String? filenameUrlSmall) =>
      _filenameUrlSmall = filenameUrlSmall;
  String? get filenameUrlMedium => _filenameUrlMedium;
  set filenameUrlMedium(String? filenameUrlMedium) =>
      _filenameUrlMedium = filenameUrlMedium;
  String? get filenameUrlBig => _filenameUrlBig;
  set filenameUrlBig(String? filenameUrlBig) =>
      _filenameUrlBig = filenameUrlBig;

  Pictures.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _postId = json['post_id'];
    _filename = json['filename'];
    _mimeType = json['mime_type'];
    _position = json['position'];
    _active = json['active'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _filenameUrl = json['filename_url'];
    _filenameUrlSmall = json['filename_url_small'];
    _filenameUrlMedium = json['filename_url_medium'];
    _filenameUrlBig = json['filename_url_big'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['post_id'] = _postId;
    data['filename'] = _filename;
    data['mime_type'] = _mimeType;
    data['position'] = _position;
    data['active'] = _active;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    data['filename_url'] = _filenameUrl;
    data['filename_url_small'] = _filenameUrlSmall;
    data['filename_url_medium'] = _filenameUrlMedium;
    data['filename_url_big'] = _filenameUrlBig;
    return data;
  }
}
