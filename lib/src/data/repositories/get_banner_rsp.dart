class GetBannerRsp {
  GetBannerRsp({
      String? message, 
      List<Data>? data,}){
    _message = message;
    _data = data;
}

  GetBannerRsp.fromJson(dynamic json) {
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  List<Data>? _data;
GetBannerRsp copyWith({  String? message,
  List<Data>? data,
}) => GetBannerRsp(  message: message ?? _message,
  data: data ?? _data,
);
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      int? idBanner, 
      String? urlBannerImg,}){
    _idBanner = idBanner;
    _urlBannerImg = urlBannerImg;
}

  Data.fromJson(dynamic json) {
    _idBanner = json['id_banner'];
    _urlBannerImg = json['url_bannerImg'];
  }
  int? _idBanner;
  String? _urlBannerImg;
Data copyWith({  int? idBanner,
  String? urlBannerImg,
}) => Data(  idBanner: idBanner ?? _idBanner,
  urlBannerImg: urlBannerImg ?? _urlBannerImg,
);
  int? get idBanner => _idBanner;
  String? get urlBannerImg => _urlBannerImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_banner'] = _idBanner;
    map['url_bannerImg'] = _urlBannerImg;
    return map;
  }

}