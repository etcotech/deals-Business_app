class CategorySubcategoryModel {
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
  List<Children>? _children;

  CategorySubcategoryModel(
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
      dynamic parent,
      List<Children>? children}) {
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
    if (parent != null) {
      _parent = parent;
    }
    if (children != null) {
      _children = children;
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
  List<Children>? get children => _children;
  set children(List<Children>? children) => _children = children;

  CategorySubcategoryModel.fromJson(Map<String, dynamic> json) {
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
    if (json['children'] != null) {
      _children = <Children>[];
      json['children'].forEach((v) {
        _children!.add(Children.fromJson(v));
      });
    }
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
    if (_children != null) {
      data['children'] = _children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Children {
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

  Children(
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
      
      }) {
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
 

  Children.fromJson(Map<String, dynamic> json) {
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