import 'dart:convert';

import 'package:fake_store/src/data/services/service.dart';
import 'package:get/get.dart';

import '../../data/repositories/get_product_rsp.dart';

class HomeLogic extends GetxController {
  final  Services  services ;
  Rxn<GetProductRsp>getAllProductRsp = Rxn();

  HomeLogic(this.services);

  @override
  onReady(){
    getAllProduct();
  }
  
  
  Future<GetProductRsp?>getAllProduct() async{

      getAllProductRsp.value = await services.getProduct();
      print(jsonEncode( getAllProductRsp.value).toString());
      return getAllProductRsp.value;
  }
}
