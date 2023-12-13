import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/auth_controller.dart';
import 'package:poem/src/features/user/repository/auth_repository.dart';

class SigninPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRepository());
    Get.lazyPut(() => AuthController());
  }
}