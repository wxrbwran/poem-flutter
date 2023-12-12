import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:poem/src/features/user/controllers/auth_controller.dart';
import 'package:poem/src/features/user/widgets/signin_logo.dart';

class CaptchaPage extends StatelessWidget {
  const CaptchaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final formKey = GlobalKey<FormState>();
    final errorController = StreamController<ErrorAnimationType>();
    final textEditingController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SigninLogo(),
            const Gap(20),
            Obx(() => Text("验证码已发送到${controller.email.value}")),
            Form(
              key: formKey,
              child: PinCodeTextField(
                appContext: context,
                // backgroundColor: Colors.lightBlueAccent,
                pastedTextStyle: TextStyle(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 4,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.underline,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: Colors.black87,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.black12,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  debugPrint("Completed");
                  controller.signinByEmail();
                },
                onChanged: (value) {
                  debugPrint(value);
                  controller.setCaptcha(value);
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
            ),
            const Gap(24),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: FilledButton(
                onPressed: () {},
                child: const Text("登录"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

