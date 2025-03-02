class SignupUserModel {
  int? id;
  String? name;
  Null username;
  String? updatedAt;
  String? originalUpdatedAt;
  Null originalLastActivity;
  String? createdAtFormatted;
  String? photoUrl;
  bool? pIsOnline;
  String? countryFlagUrl;

  SignupUserModel(
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

  SignupUserModel.fromJson(Map<String, dynamic> json) {
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
