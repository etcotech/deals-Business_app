class CategoryModel {
  int? id;
  Null parentId;
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
  Null parentClosure;

  CategoryModel(
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
      this.parentClosure});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
    parentClosure = json['parentClosure'];
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
    data['parentClosure'] = parentClosure;
    return data;
  }
}
