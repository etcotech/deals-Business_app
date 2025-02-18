class CountryModel {
  String? code;
  String? name;
  Null capital;
  String? continentCode;
  Null tld;
  String? currencyCode;
  String? phone;
  String? languages;
  String? timeZone;
  Null dateFormat;
  Null datetimeFormat;
  Null backgroundImage;
  String? adminType;
  int? active;
  String? icode;
  String? flagUrl;
  String? flag16Url;
  String? flag24Url;
  String? flag32Url;
  String? flag48Url;
  String? flag64Url;
  Null backgroundImageUrl;

  CountryModel(
      {this.code,
      this.name,
      this.capital,
      this.continentCode,
      this.tld,
      this.currencyCode,
      this.phone,
      this.languages,
      this.timeZone,
      this.dateFormat,
      this.datetimeFormat,
      this.backgroundImage,
      this.adminType,
      this.active,
      this.icode,
      this.flagUrl,
      this.flag16Url,
      this.flag24Url,
      this.flag32Url,
      this.flag48Url,
      this.flag64Url,
      this.backgroundImageUrl});

  CountryModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    capital = json['capital'];
    continentCode = json['continent_code'];
    tld = json['tld'];
    currencyCode = json['currency_code'];
    phone = json['phone'];
    languages = json['languages'];
    timeZone = json['time_zone'];
    dateFormat = json['date_format'];
    datetimeFormat = json['datetime_format'];
    backgroundImage = json['background_image'];
    adminType = json['admin_type'];
    active = json['active'];
    icode = json['icode'];
    flagUrl = json['flag_url'];
    flag16Url = json['flag16_url'];
    flag24Url = json['flag24_url'];
    flag32Url = json['flag32_url'];
    flag48Url = json['flag48_url'];
    flag64Url = json['flag64_url'];
    backgroundImageUrl = json['background_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['capital'] = capital;
    data['continent_code'] = continentCode;
    data['tld'] = tld;
    data['currency_code'] = currencyCode;
    data['phone'] = phone;
    data['languages'] = languages;
    data['time_zone'] = timeZone;
    data['date_format'] = dateFormat;
    data['datetime_format'] = datetimeFormat;
    data['background_image'] = backgroundImage;
    data['admin_type'] = adminType;
    data['active'] = active;
    data['icode'] = icode;
    data['flag_url'] = flagUrl;
    data['flag16_url'] = flag16Url;
    data['flag24_url'] = flag24Url;
    data['flag32_url'] = flag32Url;
    data['flag48_url'] = flag48Url;
    data['flag64_url'] = flag64Url;
    data['background_image_url'] = backgroundImageUrl;
    return data;
  }
}
