import 'package:fake_store/src/module/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/global_product.dart';
import 'home_logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.put(HomeLogic(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store'),
        centerTitle: true,
      ),
      body: Obx(() {
        return ListView(
          children: [
            const SizedBox(height: 5,),
            // const Text('Tất cả sản phẩm'),
            // const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      mainAxisExtent: 280),
                  itemCount: logic.getAllProductRsp.value?.prod?.length ?? 0,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Get.to(Product_detailPage(id: logic.getAllProductRsp.value?.prod?[index].id.toString()??''));
                      },
                      child: GlobalProduct(
                        nameProduct: logic.getAllProductRsp.value?.prod?[index]
                            .name,
                        imageLink: logic.getAllProductRsp.value?.prod?[index]
                            .imgLink,
                        price: logic.getAllProductRsp.value?.prod?[index].price.toString(),


                      ),
                    );
                  }),
            )
          ],
        );
      }),
    );
  }
}
