class CityModel {
  int? id;
  String? countryCode;
  String? name;
  int? latitude;
  int? longitude;
  String? subadmin1Code;
  Null? subadmin2Code;
  Null? population;
  String? timeZone;
  int? active;
  int? postsCount;

  CityModel(
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

  CityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    countryCode = json['country_code'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    subadmin1Code = json['subadmin1_code'];
    subadmin2Code = json['subadmin2_code'];
    population = json['population'];
    timeZone = json['time_zone'];
    active = json['active'];
    postsCount = json['posts_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['country_code'] = this.countryCode;
    data['name'] = this.name;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['subadmin1_code'] = this.subadmin1Code;
    data['subadmin2_code'] = this.subadmin2Code;
    data['population'] = this.population;
    data['time_zone'] = this.timeZone;
    data['active'] = this.active;
    data['posts_count'] = this.postsCount;
    return data;
  }
}
