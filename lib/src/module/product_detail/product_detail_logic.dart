import 'dart:convert';

import 'package:get/get.dart';

import '../../data/repositories/get_slider_product_rsp.dart';
import '../../data/services/service.dart';

class Product_detailLogic extends GetxController {
  final  Services  services ;
   String? id;
  Rxn<GetSliderProductRsp>getSliderProductRsp = Rxn();
  Product_detailLogic(this.services,{required this.id});



  @override
  onReady() {
    // TODO: implement onReady
    super.onReady();
    getSliderProduct();
  }

  Future<GetSliderProductRsp?>getSliderProduct()async{
    print(id);
     getSliderProductRsp.value = await services.getSliderProductRsp(id: id??"");
     print(jsonEncode(getSliderProductRsp.value));

     return  getSliderProductRsp.value;
  }

}
