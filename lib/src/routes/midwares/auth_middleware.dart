import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';

class AuthMiddleware extends GetMiddleware {

  @override
  RouteSettings? redirect(String? route) {
    final userController = Get.find<UserController>();
    final whiteList = [
      '/signin',
      "/signin/captcha"
    ];
    if (
      userController.hasAuthed() ||
      whiteList.contains(route) ||
      (route != null && route.startsWith('/signin?from='))
    ) {
      return null;
    }
    return RouteSettings(name: "/signin?from=$route");
    return super.redirect(route);
  }
}