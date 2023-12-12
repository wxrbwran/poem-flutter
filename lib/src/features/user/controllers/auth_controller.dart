import 'package:get/get.dart';
import 'package:poem/src/features/article/models/article_model.dart';

class AuthController extends GetxController{
  final isChecked = false.obs;
  final email = "".obs;
  final error = Rxn<String>();
  final list = <ArticleModel>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void setEmail(String e) {
    email.value = e;
  }
  void setIsChecked(bool? checked) {
    if (checked != null) {
      isChecked.value = checked;
    }
  }

  Future<void> signinByEmail() async {
    Get.snackbar("sign in", email.value);
  }

  Future<void> sendCaptchaByEmail() async {
    Get.snackbar("sendCaptchaByEmail", email.value);
  }

}