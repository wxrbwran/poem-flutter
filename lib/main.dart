import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/routes/routes.dart';

void main() async {
  await GetStorage.init();
  Get.put(UserController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: AppRoute.pages,
    );
  }
}
