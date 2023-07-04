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
          backgroundColor: Colors.white,
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
            child: Image.asset("assets/icons/bag_icon.png",
            height: 30,
                width: 30,

            ),
          )
        ],
      ),
      
      body: Obx(() {
        return ListView(
          children: [

            CarouselSlider.builder(
              itemCount: logic.getSliderProductRsp.value?.slider?.length ?? 0,
              options: CarouselOptions(
                aspectRatio: 24 / 20,
                autoPlay: false,
                // autoPlayInterval: Duration(seconds: 3),
                // enlargeCenterPage: true,

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
              height: 5,
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
                              fontSize: 20,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Icon(Icons.star,color: Colors.orange,),
                      const SizedBox(width: 5,),
                      Text(
                        '4.5/5 (50 đánh giá)',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          color: Colors.black
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 10,
            //   color: Colors.grey.shade200,
            // ),
           Padding(
             padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 // const SizedBox(height: 10,),
                 // Text('Mô tả sản phẩm'),
                 // const SizedBox(height: 20,),
                 Row(
                   children: [
                     Expanded(
                         child: Text(description,
                         maxLines: 15,
                           style: TextStyle(
                             height: 1.5,
                             fontSize: 15,
                             color: Colors.grey.shade700
                           ),
                         ),

                     )
                   ],
                 )
               ],
             ),
           ),
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 10,
              color: Colors.grey.shade200,
            ),
            const SizedBox(height: 10,),
          ],
        );
      }),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Container(
              padding: EdgeInsets.all(5),
              height: 60,
              // width: MediaQuery.of(context).size.width*.45,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Giá',style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey
                    ),),
                    const SizedBox(height: 5,),
                    Text(NumberFormat.simpleCurrency(locale: 'vi').format(double.parse(price)),
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700

                    ),),
                  ],
                ),
              )
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     primary: Colors.green,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8)
              //     )
              //   ),
              //   onPressed: (){
              //
              //   },
              //   child: Icon(Icons.add_shopping_cart_outlined,size: 30,)
              // ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                height: 65,
                // width: MediaQuery.of(context).size.width*.45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)
                        )

                    ),
                    onPressed: (){

                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.add_shopping_cart_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 3,),
                        Text('Thêm vào giỏ',
                        style: TextStyle(
                          fontSize: 16,
                          letterSpacing: 0.5
                        ),
                        ),

                      ],
                    ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
