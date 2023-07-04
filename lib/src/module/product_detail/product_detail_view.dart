import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:intl/intl.dart';
import '../../data/repositories/get_product_rsp.dart';
import 'product_detail_logic.dart';

class Product_detailPage extends StatelessWidget {
  int? id;
  final String name;
  final String price;
  final String description;
  final String category;

  Product_detailPage({
    Key? key,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.put(Product_detailLogic(Get.find()));
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
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.shopping_cart,size: 30,color: Colors.black,),
          )
        ],
      ),
      
      body: Obx(() {
        return ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            CarouselSlider.builder(
              itemCount: logic.getSliderProductRsp.value?.slider?.length ?? 0,
              options: CarouselOptions(
                aspectRatio: 20 / 16,
                autoPlay: false,
                // autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,

                onPageChanged: (index, reason) {},
                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                logic.getSliderProduct(id: id ?? 0);
                return Visibility(
                  visible:
                      logic.getSliderProductRsp.value?.slider?.length != null,
                  replacement: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey.shade200,
                    ),
                  ),
                  child: Image.network(
                    logic.getSliderProductRsp.value?.slider?[index].linkImg ??
                        '',
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Text(
                        NumberFormat.simpleCurrency(locale: 'vi').format(double.parse(price)),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          color: Colors.redAccent
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey.shade200,
            ),
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 const SizedBox(height: 10,),
                 Text('Mô tả sản phẩm'),
                 const SizedBox(height: 20,),
                 Row(
                   children: [

                     Expanded(
                         child: Text(description,
                         maxLines: 10,
                         ),

                     )
                   ],
                 )
               ],
             ),
           )
          ],
        );
      }),
    );
  }
}
