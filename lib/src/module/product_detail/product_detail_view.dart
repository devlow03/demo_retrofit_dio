import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../data/repositories/get_product_rsp.dart';
import 'product_detail_logic.dart';

class Product_detailPage extends StatelessWidget {
  String? id;
  Product_detailPage({Key? key, required this.id, }) : super(key: key);




  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Product_detailLogic(Get.find(),id: id.toString()));
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey.shade100,
          // centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )
      ),
      body: ListView(
        children: [
          Text(id.toString()),
          const SizedBox(height: 10,),
          Container(
            child: CarouselSlider.builder(
              itemCount: logic.getSliderProductRsp.value?.slider?.length??0,
                options: CarouselOptions(
                  aspectRatio: 20 / 16,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,

                  onPageChanged: (index, reason) {

                  },
                  viewportFraction: 1,


            ),
              itemBuilder: (context,index,realIndex){
                return Image.network(
                  logic.getSliderProductRsp.value?.slider?[index].linkImg??'',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                );
              },
          )
          )
        ],
      ),
    );
  }
}
