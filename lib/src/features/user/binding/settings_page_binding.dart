import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/settings_controller.dart';
import 'package:poem/src/features/user/repository/settings_repository.dart';

class SettingsPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsRepository());
    Get.lazyPut(() => SettingsController());
  }
}