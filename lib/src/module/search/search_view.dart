import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../widget/global_product.dart';
import '../product_detail/product_detail_view.dart';
import 'search_logic.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final logic = Get.put(SearchLogic(Get.find()));
    return Scaffold(
      appBar: AppBar(
        elevation: 0.5,
        backgroundColor: Colors.grey.shade100,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: () {
            Get.back();
          },
        ),
        actions: null,
        title: SizedBox(
          height: 50,
          child: TextField(
            controller: logic.nameControl,
            onTap: () {
              Get.to(SearchPage());
            },
            onChanged: (value) {
              logic.onSearch.value = false;
              logic.name = value;
              logic.getSearch(name: logic.name);
            },
            decoration: InputDecoration(
              hintText: 'Tìm kiếm sản phẩm',
              suffixIcon: InkWell(
                  onTap: () {
                    logic.onSearch.value = true;
                    logic.getSearch(name: logic.name);
                  },
                  child: Icon(Icons.search, color: Colors.black, size: 30,)),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(

                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Colors.grey.shade200
                ),

              ),
              focusedBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Colors.grey.shade200
                ),
              ),
              enabledBorder: OutlineInputBorder(
                // borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                    color: Colors.grey.shade200
                ),
              ),

            ),
          ),
        ),
      ),

      body: ListView(
        children: [
          const SizedBox(height: 10,),
          Obx(() {
            return Visibility(
              visible: logic.onSearch == true,
              replacement: Column(
                children: [

                  ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        logic.itemCount = logic.getSearchRsp.value?.searchProducts?.length;
                        if(logic.itemCount==null){
                          return Center();
                        }
                        return ListTile(
                          leading: Image.network(
                            logic.getSearchRsp.value?.searchProducts?[index]
                                .imgLink ??
                                '',
                            height: 80,
                            width: 80,

                          ),
                          title: Text(
                              logic.getSearchRsp.value?.searchProducts?[index]
                                  .name ??
                                  ''),
                          subtitle: Text(
                            NumberFormat.simpleCurrency(locale: 'vi').format(
                                logic.getSearchRsp.value?.searchProducts?[index]
                                    .price),
                            style: TextStyle(fontSize: 14, color: Colors
                                .redAccent),),


                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 10,);
                      },
                      itemCount: logic.itemCount!=0?5:1
                  ),
                  const SizedBox(height: 5,),
                  Visibility(
                    visible: logic.getSearchRsp.value?.searchProducts?.length!=null,
                    child: TextButton(
                        onPressed: (){
                          logic.onSearch.value=true;

                        }, child: Text('Xem thêm sản phẩm',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                    ),
                    )),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text('Từ khóa tìm kiếm: ${logic.name}'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 280),
                        itemCount: logic.getSearchRsp.value
                            ?.searchProducts?.length??0,
                        itemBuilder: (context, ind) {
                          return InkWell(
                            onTap: () {
                              Get.to(Product_detailPage(
                                  id: logic.getSearchRsp.value
                                      ?.searchProducts?[ind].id,
                              name: logic.getSearchRsp.value
                                  ?.searchProducts?[ind].name??'',
                                price: logic.getSearchRsp.value
                                    ?.searchProducts?[ind].price.toString()??'',
                                description: logic.getSearchRsp.value
                                    ?.searchProducts?[ind].descript??'',
                                category: logic.getSearchRsp.value
                                    ?.searchProducts?[ind].idCategory.toString()??'',
                              ),


                              );
                            },
                            child: GlobalProduct(
                              nameProduct: logic.getSearchRsp.value
                                  ?.searchProducts?[ind].name,
                              imageLink: logic.getSearchRsp.value
                                  ?.searchProducts?[ind].imgLink,
                              price: logic.getSearchRsp.value
                                  ?.searchProducts?[ind].price
                                  .toString(),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
