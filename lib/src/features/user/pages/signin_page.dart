import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/auth_controller.dart';
import 'package:poem/src/features/user/widgets/signin_logo.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SigninLogo(),
            const SizedBox(height: 20,),
            Form(
              key: formKey,
              child: TextFormField(
                onChanged: (v) {controller.setEmail(v);},
                validator: (v) {
                  if (v == null || v.isEmpty) {
                    return "邮箱不能为空";
                  }
                  if(!v.isEmail) {
                    return "邮箱格式错误";
                  }
                  if (!controller.isChecked.value) {
                    return "请勾选用户协议";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "邮箱登录",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                  onPressed: () {
                    if (!formKey.currentState!.validate()) {
                      return;
                    }
                    controller.sendCaptchaByEmail();
                  },
                  child: const Text("获取验证码")),
            ),
            Row(
              children: [
                Obx(() => Checkbox(value: controller.isChecked.isTrue, onChanged: (val) {controller.setIsChecked(val);})),
                RichText(
                    text: const TextSpan(text: "已阅读并同意",
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                      children: [
                        TextSpan(text: "《用户协议》",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                        TextSpan(text: "与"),
                        TextSpan(text: "《隐私协议》",
                          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),),
                      ],
                    )
                )
              ],
            ),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(onPressed: () {
                }, child: const Text("其他登录方式", style: TextStyle(fontSize: 16))),
                TextButton(onPressed: () {}, child: const Text("遇到问题？", style: TextStyle(fontSize: 16))),
              ],
            )),
            const SizedBox(height: 20,)
          ],
        ),
      )
    );
  }
}
