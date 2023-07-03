import 'package:dio/dio.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/data/repositories/get_slider_product_rsp.dart';
import 'package:retrofit/retrofit.dart';

import '../repositories/get_product_all.dart';
import '../repositories/get_product_rsp.dart';
part 'service.g.dart';
@RestApi(baseUrl:"https://smartstore.khanhnhat.top/api/v1")
abstract class Services{
  factory Services(Dio dio,{String baseUrl}) = _Services;

  @GET('/prod')
  Future<GetProductRsp> getProduct();
  @GET('/prod/slider/{id}')
  Future<GetSliderProductRsp> getSliderProductRsp({@Path('id') required String id});
  @GET('/category/{id_category}')
  Future<GetProductCategoryRsp>getProductCategory(@Path() String id);
}
