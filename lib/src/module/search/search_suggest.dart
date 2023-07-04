import 'package:fake_store/src/module/search/search_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
class SearchSuggest extends StatelessWidget {
   SearchSuggest({Key? key}) : super(key: key);
  final logic = Get.put(SearchLogic(Get.find()));
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(
              logic.getSearchRsp.value?.searchProducts?[index].imgLink ??
                  '',
              height: 80,
              width: 80,

            ),
            title: Text(
                logic.getSearchRsp.value?.searchProducts?[index].name ??
                    ''),
            subtitle: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                NumberFormat.simpleCurrency(locale: 'vi').format(
                    logic.getSearchRsp.value?.searchProducts?[index]
                        .price),
                style: TextStyle(fontSize: 14, color: Colors.redAccent),),
            ),


          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: 10,);
        },
        itemCount: logic.getSearchRsp.value?.searchProducts?.length ??
            0);
  }
}
