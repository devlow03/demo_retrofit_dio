import 'package:carousel_slider/carousel_slider.dart';
import 'package:fake_store/src/data/repositories/get_product_category_rsp.dart';
import 'package:fake_store/src/module/product_detail/product_detail_view.dart';
import 'package:fake_store/src/widget/grid_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/global_product.dart';
import '../../widget/search_widget.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(HomeLogic(Get.find()));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text('Tech Shop',
          style: TextStyle(
            fontSize: 20,
              color: Colors.black,
            fontWeight: FontWeight.w600,
            letterSpacing: 1
          ),
        ),
        // centerTitle: true,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(Icons.notifications,size: 30,color: Colors.black,),
        //   ),
        //   Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Icon(Icons.shopping_cart,size: 30,color: Colors.black,),
        //   )
        // ],
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: ()async{
            logic.refresh();
          },
          child: ListView(
            children: [
              const SizedBox(height: 5,),
              SearchWiget(),
              const SizedBox(height: 10,),
              CarouselSlider.builder(
                itemCount: logic.getBannerRsp.value?.data?.length ??
                    0,
                options: CarouselOptions(
                  aspectRatio: 25 / 10,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  // enlargeCenterPage: true,

                  onPageChanged: (index, reason) {

                  },
                  // viewportFraction: 1,


                ),
                itemBuilder: (context, index, realIndex) {

                  return Visibility(
                    visible:  logic.getBannerRsp.value?.data?.length!=null,
                    replacement: SizedBox(
                      width: MediaQuery.of(context).size.width,

                      child: Icon(
                        Icons.image,
                        size: 100,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                          logic.getBannerRsp.value?.data?[index].urlBannerImg ??
                              '',
                          width: MediaQuery
                              .of(context)
                              .size
                              .width*.9,

                          fit: BoxFit.fill
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10,),
              // Container(
              //   height: 10,
              //   width: MediaQuery.of(context).size.width,
              //   color: Colors.grey.shade200,
              //
              // ),
              // const SizedBox(height: 10,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    // logic.id.value =
                    //     logic.getCategoryRsp.value?.category?[index].idCategory;
                    logic.getProductCategory(
                        id: logic.getCategoryRsp.value?.category?[index]
                            .idCategory);
                    return Column(
                      children: [
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text(logic.getCategoryRsp.value?.category?[index]
                                  .nameType ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                fontSize: 16,
                                  fontWeight: FontWeight.w700
                                ),
                              ),
                              Text('Xem thêm>',
                                style: TextStyle(color: Colors.black),
                              ),

                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        FutureBuilder<GetProductCategoryRsp?>(
                            future: logic.getProductCategory(id: logic
                                .getCategoryRsp.value?.category?[index]
                                .idCategory),
                            builder: (context, snapshot) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8,
                                        mainAxisExtent: 280),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      return Visibility(
                                        visible: snapshot.data?.prodCategory?.length!=null,
                                        replacement: SizedBox(
                                          width: MediaQuery.of(context).size.width,

                                          child: Icon(
                                            Icons.image,
                                            size: 100,
                                            color: Colors.grey.shade200,
                                          ),
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            Get.to(Product_detailPage(
                                                id: snapshot.data?.prodCategory?[index].id,
                                                name: snapshot.data?.prodCategory?[index]
                                                    .name??'',
                                              price: snapshot.data?.prodCategory?[index]
                                                  .price.toString()??'',
                                              description: snapshot.data?.prodCategory?[index]
                                                  .descript??'',
                                              category: snapshot.data?.prodCategory?[index]
                                                  .idCategory.toString()??'',
                                            ),

                                            );
                                          },
                                          child: GlobalProduct(
                                            nameProduct: snapshot.data?.prodCategory?[index]
                                                .name,
                                            imageLink:snapshot.data?.prodCategory?[index]
                                                .imgLink,
                                            shortDes: snapshot.data?.prodCategory?[index]
                                                .shortDes
                                                .toString(),
                                            price: snapshot.data?.prodCategory?[index]
                                                .price
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    }),
                              );
                            })


                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 10,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.grey.shade200,

                    );
                  },
                  itemCount: logic.getCategoryRsp.value?.category?.length ?? 0),

            ],
          ),
        );
      }),
    );
  }
}
