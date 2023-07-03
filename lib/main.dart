import 'package:fake_store/src/data/dependency_injections.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'src/module/home/home_view.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjections().dependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,

      home:  HomePage(),
    );
  }
}


