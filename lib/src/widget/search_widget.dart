import 'package:fake_store/src/module/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class SearchWiget extends StatelessWidget {
  const SearchWiget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          onTap: (){
            Get.to(SearchPage());
          },
          readOnly: true,
          decoration: InputDecoration(
            hintText: 'Tìm kiếm sản phẩm',
            suffixIcon: Icon(Icons.search,color: Colors.black,size: 30,),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.transparent
              ),

            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.transparent
              ),
            ),
            enabledBorder:  OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                  color: Colors.transparent
              ),
            ),

          ),
        ),
      ),
    );
  }
}
