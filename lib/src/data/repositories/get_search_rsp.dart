class GetSearchRsp {
  GetSearchRsp({
      List<SearchProducts>? searchProducts,}){
    _searchProducts = searchProducts;
}

  GetSearchRsp.fromJson(dynamic json) {
    if (json['searchProducts'] != null) {
      _searchProducts = [];
      json['searchProducts'].forEach((v) {
        _searchProducts?.add(SearchProducts.fromJson(v));
      });
    }
  }
  List<SearchProducts>? _searchProducts;
GetSearchRsp copyWith({  List<SearchProducts>? searchProducts,
}) => GetSearchRsp(  searchProducts: searchProducts ?? _searchProducts,
);
  List<SearchProducts>? get searchProducts => _searchProducts;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_searchProducts != null) {
      map['searchProducts'] = _searchProducts?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class SearchProducts {
  SearchProducts({
      int? id, 
      int? idCategory, 
      int? featured, 
      String? imgLink, 
      String? name, 
      int? price, 
      String? shortDes, 
      String? descript, 
      int? favorite, 
      String? nameType, 
      String? image,}){
    _id = id;
    _idCategory = idCategory;
    _featured = featured;
    _imgLink = imgLink;
    _name = name;
    _price = price;
    _shortDes = shortDes;
    _descript = descript;
    _favorite = favorite;
    _nameType = nameType;
    _image = image;
}

  SearchProducts.fromJson(dynamic json) {
    _id = json['id'];
    _idCategory = json['id_category'];
    _featured = json['featured'];
    _imgLink = json['img_link'];
    _name = json['name'];
    _price = json['price'];
    _shortDes = json['short_des'];
    _descript = json['descript'];
    _favorite = json['favorite'];
    _nameType = json['name_type'];
    _image = json['image'];
  }
  int? _id;
  int? _idCategory;
  int? _featured;
  String? _imgLink;
  String? _name;
  int? _price;
  String? _shortDes;
  String? _descript;
  int? _favorite;
  String? _nameType;
  String? _image;
SearchProducts copyWith({  int? id,
  int? idCategory,
  int? featured,
  String? imgLink,
  String? name,
  int? price,
  String? shortDes,
  String? descript,
  int? favorite,
  String? nameType,
  String? image,
}) => SearchProducts(  id: id ?? _id,
  idCategory: idCategory ?? _idCategory,
  featured: featured ?? _featured,
  imgLink: imgLink ?? _imgLink,
  name: name ?? _name,
  price: price ?? _price,
  shortDes: shortDes ?? _shortDes,
  descript: descript ?? _descript,
  favorite: favorite ?? _favorite,
  nameType: nameType ?? _nameType,
  image: image ?? _image,
);
  int? get id => _id;
  int? get idCategory => _idCategory;
  int? get featured => _featured;
  String? get imgLink => _imgLink;
  String? get name => _name;
  int? get price => _price;
  String? get shortDes => _shortDes;
  String? get descript => _descript;
  int? get favorite => _favorite;
  String? get nameType => _nameType;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['id_category'] = _idCategory;
    map['featured'] = _featured;
    map['img_link'] = _imgLink;
    map['name'] = _name;
    map['price'] = _price;
    map['short_des'] = _shortDes;
    map['descript'] = _descript;
    map['favorite'] = _favorite;
    map['name_type'] = _nameType;
    map['image'] = _image;
    return map;
  }

}