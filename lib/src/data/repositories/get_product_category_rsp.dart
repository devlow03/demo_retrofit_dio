class GetProductCategoryRsp {
  GetProductCategoryRsp({
      List<ProdCategory>? prodCategory,}){
    _prodCategory = prodCategory;
}

  GetProductCategoryRsp.fromJson(dynamic json) {
    if (json['prod_category'] != null) {
      _prodCategory = [];
      json['prod_category'].forEach((v) {
        _prodCategory?.add(ProdCategory.fromJson(v));
      });
    }
  }
  List<ProdCategory>? _prodCategory;
GetProductCategoryRsp copyWith({  List<ProdCategory>? prodCategory,
}) => GetProductCategoryRsp(  prodCategory: prodCategory ?? _prodCategory,
);
  List<ProdCategory>? get prodCategory => _prodCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_prodCategory != null) {
      map['prod_category'] = _prodCategory?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class ProdCategory {
  ProdCategory({
      int? idCategory, 
      String? nameType, 
      String? image, 
      int? id, 
      int? featured, 
      String? imgLink, 
      String? name, 
      int? price, 
      String? shortDes, 
      String? descript, 
      int? favorite,}){
    _idCategory = idCategory;
    _nameType = nameType;
    _image = image;
    _id = id;
    _featured = featured;
    _imgLink = imgLink;
    _name = name;
    _price = price;
    _shortDes = shortDes;
    _descript = descript;
    _favorite = favorite;
}

  ProdCategory.fromJson(dynamic json) {
    _idCategory = json['id_category'];
    _nameType = json['name_type'];
    _image = json['image'];
    _id = json['id'];
    _featured = json['featured'];
    _imgLink = json['img_link'];
    _name = json['name'];
    _price = json['price'];
    _shortDes = json['short_des'];
    _descript = json['descript'];
    _favorite = json['favorite'];
  }
  int? _idCategory;
  String? _nameType;
  String? _image;
  int? _id;
  int? _featured;
  String? _imgLink;
  String? _name;
  int? _price;
  String? _shortDes;
  String? _descript;
  int? _favorite;
ProdCategory copyWith({  int? idCategory,
  String? nameType,
  String? image,
  int? id,
  int? featured,
  String? imgLink,
  String? name,
  int? price,
  String? shortDes,
  String? descript,
  int? favorite,
}) => ProdCategory(  idCategory: idCategory ?? _idCategory,
  nameType: nameType ?? _nameType,
  image: image ?? _image,
  id: id ?? _id,
  featured: featured ?? _featured,
  imgLink: imgLink ?? _imgLink,
  name: name ?? _name,
  price: price ?? _price,
  shortDes: shortDes ?? _shortDes,
  descript: descript ?? _descript,
  favorite: favorite ?? _favorite,
);
  int? get idCategory => _idCategory;
  String? get nameType => _nameType;
  String? get image => _image;
  int? get id => _id;
  int? get featured => _featured;
  String? get imgLink => _imgLink;
  String? get name => _name;
  int? get price => _price;
  String? get shortDes => _shortDes;
  String? get descript => _descript;
  int? get favorite => _favorite;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_category'] = _idCategory;
    map['name_type'] = _nameType;
    map['image'] = _image;
    map['id'] = _id;
    map['featured'] = _featured;
    map['img_link'] = _imgLink;
    map['name'] = _name;
    map['price'] = _price;
    map['short_des'] = _shortDes;
    map['descript'] = _descript;
    map['favorite'] = _favorite;
    return map;
  }

}