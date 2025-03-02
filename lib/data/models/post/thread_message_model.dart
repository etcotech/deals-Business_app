class ThreadMessageModel {
  int? _id;
  int? _threadId;
  int? _userId;
  String? _body;
  dynamic _filename;
  String? _createdAtFormatted;
  PRecipient? _pRecipient;
  User? _user;

  ThreadMessageModel(
      {int? id,
      int? threadId,
      int? userId,
      String? body,
      dynamic filename,
      String? createdAtFormatted,
      PRecipient? pRecipient,
      User? user}) {
    if (id != null) {
      this._id = id;
    }
    if (threadId != null) {
      this._threadId = threadId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (body != null) {
      this._body = body;
    }
    if (filename != null) {
      this._filename = filename;
    }
    if (createdAtFormatted != null) {
      this._createdAtFormatted = createdAtFormatted;
    }
    if (pRecipient != null) {
      this._pRecipient = pRecipient;
    }
    if (user != null) {
      this._user = user;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get threadId => _threadId;
  set threadId(int? threadId) => _threadId = threadId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  String? get body => _body;
  set body(String? body) => _body = body;
  dynamic get filename => _filename;
  set filename(dynamic filename) => _filename = filename;
  String? get createdAtFormatted => _createdAtFormatted;
  set createdAtFormatted(String? createdAtFormatted) =>
      _createdAtFormatted = createdAtFormatted;
  PRecipient? get pRecipient => _pRecipient;
  set pRecipient(PRecipient? pRecipient) => _pRecipient = pRecipient;
  User? get user => _user;
  set user(User? user) => _user = user;

  ThreadMessageModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _threadId = json['thread_id'];
    _userId = json['user_id'];
    _body = json['body'];
    _filename = json['filename'];
    _createdAtFormatted = json['created_at_formatted'];
    _pRecipient = json['p_recipient'] != null
        ? new PRecipient.fromJson(json['p_recipient'])
        : null;
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['thread_id'] = this._threadId;
    data['user_id'] = this._userId;
    data['body'] = this._body;
    data['filename'] = this._filename;
    data['created_at_formatted'] = this._createdAtFormatted;
    if (this._pRecipient != null) {
      data['p_recipient'] = this._pRecipient!.toJson();
    }
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    return data;
  }
}

class PRecipient {
  int? _id;
  int? _threadId;
  int? _userId;
  dynamic _lastRead;
  int? _isImportant;
  dynamic _deletedAt;
  String? _createdAt;
  String? _updatedAt;
  String? _createdAtFormatted;

  PRecipient(
      {int? id,
      int? threadId,
      int? userId,
      dynamic lastRead,
      int? isImportant,
      dynamic deletedAt,
      String? createdAt,
      String? updatedAt,
      String? createdAtFormatted}) {
    if (id != null) {
      this._id = id;
    }
    if (threadId != null) {
      this._threadId = threadId;
    }
    if (userId != null) {
      this._userId = userId;
    }
    if (lastRead != null) {
      this._lastRead = lastRead;
    }
    if (isImportant != null) {
      this._isImportant = isImportant;
    }
    if (deletedAt != null) {
      this._deletedAt = deletedAt;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (createdAtFormatted != null) {
      this._createdAtFormatted = createdAtFormatted;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get threadId => _threadId;
  set threadId(int? threadId) => _threadId = threadId;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  dynamic get lastRead => _lastRead;
  set lastRead(dynamic lastRead) => _lastRead = lastRead;
  int? get isImportant => _isImportant;
  set isImportant(int? isImportant) => _isImportant = isImportant;
  dynamic get deletedAt => _deletedAt;
  set deletedAt(dynamic deletedAt) => _deletedAt = deletedAt;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get createdAtFormatted => _createdAtFormatted;
  set createdAtFormatted(String? createdAtFormatted) =>
      _createdAtFormatted = createdAtFormatted;

  PRecipient.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _threadId = json['thread_id'];
    _userId = json['user_id'];
    _lastRead = json['last_read'];
    _isImportant = json['is_important'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _createdAtFormatted = json['created_at_formatted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['thread_id'] = this._threadId;
    data['user_id'] = this._userId;
    data['last_read'] = this._lastRead;
    data['is_important'] = this._isImportant;
    data['deleted_at'] = this._deletedAt;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    data['created_at_formatted'] = this._createdAtFormatted;
    return data;
  }
}

class User {
  int? _id;
  String? _name;
  dynamic _username;
  String? _updatedAt;
  String? _originalUpdatedAt;
  dynamic _originalLastActivity;
  String? _createdAtFormatted;
  String? _photoUrl;
  bool? _pIsOnline;
  dynamic _countryFlagUrl;
  dynamic _countryCode;
  dynamic _languageCode;
  dynamic _userTypeId;
  dynamic _genderId;
  dynamic _photo;
  dynamic _about;
  String? _authField;
  String? _email;
  String? _phone;
  String? _phoneNational;
  String? _phoneCountry;
  int? _phoneHidden;
  int? _disableComments;
  dynamic _createFromIp;
  dynamic _latestUpdateIp;
  dynamic _provider;
  dynamic _providerId;
  dynamic _emailToken;
  dynamic _phoneToken;
  String? _emailVerifiedAt;
  String? _phoneVerifiedAt;
  int? _acceptTerms;
  int? _acceptMarketingOffers;
  dynamic _timeZone;
  int? _featured;
  int? _blocked;
  int? _closed;
  String? _lastActivity;
  String? _phoneIntl;

  User(
      {int? id,
      String? name,
      dynamic username,
      String? updatedAt,
      String? originalUpdatedAt,
      dynamic originalLastActivity,
      String? createdAtFormatted,
      String? photoUrl,
      bool? pIsOnline,
      dynamic countryFlagUrl,
      dynamic countryCode,
      dynamic languageCode,
      dynamic userTypeId,
      dynamic genderId,
      dynamic photo,
      dynamic about,
      String? authField,
      String? email,
      String? phone,
      String? phoneNational,
      String? phoneCountry,
      int? phoneHidden,
      int? disableComments,
      dynamic createFromIp,
      dynamic latestUpdateIp,
      dynamic provider,
      dynamic providerId,
      dynamic emailToken,
      dynamic phoneToken,
      String? emailVerifiedAt,
      String? phoneVerifiedAt,
      int? acceptTerms,
      int? acceptMarketingOffers,
      dynamic timeZone,
      int? featured,
      int? blocked,
      int? closed,
      String? lastActivity,
      String? phoneIntl}) {
    if (id != null) {
      this._id = id;
    }
    if (name != null) {
      this._name = name;
    }
    if (username != null) {
      this._username = username;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (originalUpdatedAt != null) {
      this._originalUpdatedAt = originalUpdatedAt;
    }
    if (originalLastActivity != null) {
      this._originalLastActivity = originalLastActivity;
    }
    if (createdAtFormatted != null) {
      this._createdAtFormatted = createdAtFormatted;
    }
    if (photoUrl != null) {
      this._photoUrl = photoUrl;
    }
    if (pIsOnline != null) {
      this._pIsOnline = pIsOnline;
    }
    if (countryFlagUrl != null) {
      this._countryFlagUrl = countryFlagUrl;
    }
    if (countryCode != null) {
      this._countryCode = countryCode;
    }
    if (languageCode != null) {
      this._languageCode = languageCode;
    }
    if (userTypeId != null) {
      this._userTypeId = userTypeId;
    }
    if (genderId != null) {
      this._genderId = genderId;
    }
    if (photo != null) {
      this._photo = photo;
    }
    if (about != null) {
      this._about = about;
    }
    if (authField != null) {
      this._authField = authField;
    }
    if (email != null) {
      this._email = email;
    }
    if (phone != null) {
      this._phone = phone;
    }
    if (phoneNational != null) {
      this._phoneNational = phoneNational;
    }
    if (phoneCountry != null) {
      this._phoneCountry = phoneCountry;
    }
    if (phoneHidden != null) {
      this._phoneHidden = phoneHidden;
    }
    if (disableComments != null) {
      this._disableComments = disableComments;
    }
    if (createFromIp != null) {
      this._createFromIp = createFromIp;
    }
    if (latestUpdateIp != null) {
      this._latestUpdateIp = latestUpdateIp;
    }
    if (provider != null) {
      this._provider = provider;
    }
    if (providerId != null) {
      this._providerId = providerId;
    }
    if (emailToken != null) {
      this._emailToken = emailToken;
    }
    if (phoneToken != null) {
      this._phoneToken = phoneToken;
    }
    if (emailVerifiedAt != null) {
      this._emailVerifiedAt = emailVerifiedAt;
    }
    if (phoneVerifiedAt != null) {
      this._phoneVerifiedAt = phoneVerifiedAt;
    }
    if (acceptTerms != null) {
      this._acceptTerms = acceptTerms;
    }
    if (acceptMarketingOffers != null) {
      this._acceptMarketingOffers = acceptMarketingOffers;
    }
    if (timeZone != null) {
      this._timeZone = timeZone;
    }
    if (featured != null) {
      this._featured = featured;
    }
    if (blocked != null) {
      this._blocked = blocked;
    }
    if (closed != null) {
      this._closed = closed;
    }
    if (lastActivity != null) {
      this._lastActivity = lastActivity;
    }
    if (phoneIntl != null) {
      this._phoneIntl = phoneIntl;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get name => _name;
  set name(String? name) => _name = name;
  dynamic get username => _username;
  set username(dynamic username) => _username = username;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  String? get originalUpdatedAt => _originalUpdatedAt;
  set originalUpdatedAt(String? originalUpdatedAt) =>
      _originalUpdatedAt = originalUpdatedAt;
  dynamic get originalLastActivity => _originalLastActivity;
  set originalLastActivity(dynamic originalLastActivity) =>
      _originalLastActivity = originalLastActivity;
  String? get createdAtFormatted => _createdAtFormatted;
  set createdAtFormatted(String? createdAtFormatted) =>
      _createdAtFormatted = createdAtFormatted;
  String? get photoUrl => _photoUrl;
  set photoUrl(String? photoUrl) => _photoUrl = photoUrl;
  bool? get pIsOnline => _pIsOnline;
  set pIsOnline(bool? pIsOnline) => _pIsOnline = pIsOnline;
  dynamic get countryFlagUrl => _countryFlagUrl;
  set countryFlagUrl(dynamic countryFlagUrl) => _countryFlagUrl = countryFlagUrl;
  dynamic get countryCode => _countryCode;
  set countryCode(dynamic countryCode) => _countryCode = countryCode;
  dynamic get languageCode => _languageCode;
  set languageCode(dynamic languageCode) => _languageCode = languageCode;
  dynamic get userTypeId => _userTypeId;
  set userTypeId(dynamic userTypeId) => _userTypeId = userTypeId;
  dynamic get genderId => _genderId;
  set genderId(dynamic genderId) => _genderId = genderId;
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
  String? get phoneIntl => _phoneIntl;
  set phoneIntl(String? phoneIntl) => _phoneIntl = phoneIntl;

  User.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _updatedAt = json['updated_at'];
    _originalUpdatedAt = json['original_updated_at'];
    _originalLastActivity = json['original_last_activity'];
    _createdAtFormatted = json['created_at_formatted'];
    _photoUrl = json['photo_url'];
    _pIsOnline = json['p_is_online'];
    _countryFlagUrl = json['country_flag_url'];
    _countryCode = json['country_code'];
    _languageCode = json['language_code'];
    _userTypeId = json['user_type_id'];
    _genderId = json['gender_id'];
    _photo = json['photo'];
    _about = json['about'];
    _authField = json['auth_field'];
    _email = json['email'];
    _phone = json['phone'];
    _phoneNational = json['phone_national'];
    _phoneCountry = json['phone_country'];
    _phoneHidden = json['phone_hidden'];
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
    _phoneIntl = json['phone_intl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['name'] = this._name;
    data['username'] = this._username;
    data['updated_at'] = this._updatedAt;
    data['original_updated_at'] = this._originalUpdatedAt;
    data['original_last_activity'] = this._originalLastActivity;
    data['created_at_formatted'] = this._createdAtFormatted;
    data['photo_url'] = this._photoUrl;
    data['p_is_online'] = this._pIsOnline;
    data['country_flag_url'] = this._countryFlagUrl;
    data['country_code'] = this._countryCode;
    data['language_code'] = this._languageCode;
    data['user_type_id'] = this._userTypeId;
    data['gender_id'] = this._genderId;
    data['photo'] = this._photo;
    data['about'] = this._about;
    data['auth_field'] = this._authField;
    data['email'] = this._email;
    data['phone'] = this._phone;
    data['phone_national'] = this._phoneNational;
    data['phone_country'] = this._phoneCountry;
    data['phone_hidden'] = this._phoneHidden;
    data['disable_comments'] = this._disableComments;
    data['create_from_ip'] = this._createFromIp;
    data['latest_update_ip'] = this._latestUpdateIp;
    data['provider'] = this._provider;
    data['provider_id'] = this._providerId;
    data['email_token'] = this._emailToken;
    data['phone_token'] = this._phoneToken;
    data['email_verified_at'] = this._emailVerifiedAt;
    data['phone_verified_at'] = this._phoneVerifiedAt;
    data['accept_terms'] = this._acceptTerms;
    data['accept_marketing_offers'] = this._acceptMarketingOffers;
    data['time_zone'] = this._timeZone;
    data['featured'] = this._featured;
    data['blocked'] = this._blocked;
    data['closed'] = this._closed;
    data['last_activity'] = this._lastActivity;
    data['phone_intl'] = this._phoneIntl;
    return data;
  }
}