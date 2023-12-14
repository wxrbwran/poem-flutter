import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/repository/settings_repository.dart';

class SettingsController extends GetxController{
  final repo = Get.find<SettingsRepository>();
  final userController = Get.find<UserController>();

  final name = "".obs;
  final bio = "".obs;
  final sex = 0.obs;

  final error = Rxn<String>();
  final isLoading = false.obs;
  final sp = GetStorage();


  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setError(String? e) {
    error.value = e;
  }

  void setName(String n) {
    name.value = n;
  }

  void setSex(int n) {
    sex.value = n;
  }

  void setBio(String n) {
    bio.value = n;
  }

  Future<void> saveName(String n) async {
    try {
      isLoading.value = true;
      await repo.changeName(n);
      userController.changeName(n);
    } catch (e) {
      setError("saveName fail: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveBio(String n) async {
    try {
      isLoading.value = true;
      await repo.changeBio(n);
      userController.changeBio(n);
    } catch (e) {
      setError("saveBio fail: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveSex(int n) async {
    try {
      isLoading.value = true;
      await repo.changeSex(n);
      userController.changeSex(n);
    } catch (e) {
      setError("saveBio fail: $e");
    } finally {
      isLoading.value = false;
    }
  }
}