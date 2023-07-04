class GetCategoryRsp {
  GetCategoryRsp({
      List<Category>? category,}){
    _category = category;
}

  GetCategoryRsp.fromJson(dynamic json) {
    if (json['category'] != null) {
      _category = [];
      json['category'].forEach((v) {
        _category?.add(Category.fromJson(v));
      });
    }
  }
  List<Category>? _category;
GetCategoryRsp copyWith({  List<Category>? category,
}) => GetCategoryRsp(  category: category ?? _category,
);
  List<Category>? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_category != null) {
      map['category'] = _category?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Category {
  Category({
      int? idCategory, 
      String? nameType, 
      String? image,}){
    _idCategory = idCategory;
    _nameType = nameType;
    _image = image;
}

  Category.fromJson(dynamic json) {
    _idCategory = json['id_category'];
    _nameType = json['name_type'];
    _image = json['image'];
  }
  int? _idCategory;
  String? _nameType;
  String? _image;
Category copyWith({  int? idCategory,
  String? nameType,
  String? image,
}) => Category(  idCategory: idCategory ?? _idCategory,
  nameType: nameType ?? _nameType,
  image: image ?? _image,
);
  int? get idCategory => _idCategory;
  String? get nameType => _nameType;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = _idCategory;
    map['name_type'] = _nameType;
    map['image'] = _image;
    return map;
  }

}