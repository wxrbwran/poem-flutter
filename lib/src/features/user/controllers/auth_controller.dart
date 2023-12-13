import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/enums/signin_kind_enum.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/repository/auth_repository.dart';

class AuthController extends GetxController{
  final repo = Get.find<AuthRepository>();
  final userController = Get.find<UserController>();
  // signin page
  final isChecked = true.obs;
  final email = "ww@qq.com".obs;
  final error = Rxn<String>();
  final isLoading = false.obs;

  // captcha page
  final captcha = "222".obs;
  final isSended = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setError(String? e) {
    error.value = e;
  }

  void setEmail(String e) {
    email.value = e;
  }

  void setCaptcha(String c) {
    captcha.value = c;
  }

  void setIsChecked(bool? checked) {
    if (checked != null) {
      isChecked.value = checked;
    }
  }

  Future<void> sendCaptchaByEmail() async {
    try {
      isLoading.value = true;
      await repo.sendCaptcha(SigninKindEnum.email.value, SigninKindEnum.email);
    } catch (e) {
      setError("sendCaptchaByEmail fail: $e");
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signinByEmail() async {
    try {
      isLoading.value = true;
      final user = await repo.signinByCaptcha(SigninKindEnum.email.value, SigninKindEnum.email, captcha.value);
      debugPrint("${user.toJson()}");
      userController.setAndSaveUser(user);
    } catch (e) {
      setError("signinByEmail fail: $e");
      debugPrint(e.toString());
    } finally {
      isLoading.value = false;
    }
    // isSended.value = true;
  }

}