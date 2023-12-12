import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/auth_controller.dart';

class SigninPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }

}