import 'package:get/get.dart';

class AuthController extends GetxController{
  // signin page
  final isChecked = false.obs;
  final email = "".obs;
  final error = Rxn<String>();

  // captcha page
  final captcha = "".obs;
  final isSended = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    isSended.value = false;
    super.onClose();
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
    Get.snackbar("sendCaptchaByEmail", captcha.value);
  }

  Future<void> signinByEmail() async {
    Get.snackbar("sign in", email.value);
    isSended.value = true;
  }



}