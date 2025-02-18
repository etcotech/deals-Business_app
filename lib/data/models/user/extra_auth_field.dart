class ExtraAuthModel {
  String? authToken;
  String? tokenType;
  bool? isAdmin;

  ExtraAuthModel({this.authToken, this.tokenType, this.isAdmin});

  ExtraAuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['authToken'];
    tokenType = json['tokenType'];
    isAdmin = json['isAdmin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['authToken'] = authToken;
    data['tokenType'] = tokenType;
    data['isAdmin'] = isAdmin;
    return data;
  }
}
