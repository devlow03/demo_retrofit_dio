import 'dart:convert';

import 'package:fake_store/src/data/repositories/get_banner_rsp.dart';
import 'package:fake_store/src/data/repositories/get_category_rsp.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/data/services/service.dart';
import 'package:get/get.dart';

import '../../data/repositories/get_product_rsp.dart';

class HomeLogic extends GetxController {
  final  Services  services ;
  Rxn<GetCategoryRsp>getCategoryRsp = Rxn();
  Rxn<GetProductCategoryRsp>getProductCategoryRsp = Rxn();
  Rxn<GetProductRsp>getAllProductRsp = Rxn();
  Rxn<GetBannerRsp>getBannerRsp=Rxn();
  Rxn<int> id = Rxn();


  HomeLogic(this.services);

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
      getAllProduct();
      getCategory();
      getProductCategory();
      getBanner();
  }

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
    getAllProduct();
    getCategory();
    getProductCategory();
    getBanner();
  }
  // onReady(){

  // }
  @override

  
  
  Future<GetProductRsp?>getAllProduct() async{

      getAllProductRsp.value = await services.getProduct();
      print(jsonEncode( getAllProductRsp.value).toString());
      return getAllProductRsp.value;
  }

  Future<GetCategoryRsp?>getCategory()async{
    getCategoryRsp.value = await services.getCategoryRsp();
    print(jsonEncode(getCategoryRsp.value));
    return getCategoryRsp.value;
  }

  Future<GetProductCategoryRsp?>getProductCategory( {int? id})async{
    getProductCategoryRsp.value = await services.getProductCategory(id: id ?? 0);

    print(jsonEncode(getProductCategoryRsp.value));
    return getProductCategoryRsp.value;
  }

  Future<GetBannerRsp?>getBanner()async{
    getBannerRsp.value=await services.getBannerRsp();
    print(jsonEncode(getBannerRsp.value));
    return getBannerRsp.value;
  }
}
