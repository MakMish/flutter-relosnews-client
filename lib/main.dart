import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:relosnews/view/Screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() async{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      splitScreenMode: false,
      designSize: Size(360, 690),
      minTextAdapt: true,
      child: ProviderScope(child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen(),
      )),
    );
  }
}
