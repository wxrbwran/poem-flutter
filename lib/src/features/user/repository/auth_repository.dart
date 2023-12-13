import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/common/base_repository.dart';
import 'package:poem/src/features/enums/client_id_enum.dart';
import 'package:poem/src/features/enums/signin_kind_enum.dart';
import 'package:poem/src/features/user/models/user_model.dart';

class AuthRepository extends BaseRepository{

  static AuthRepository get to => Get.find();

  Future<void> sendCaptcha(String identifier, SigninKindEnum kind) async {
    const url = "/auth/captcha";
    final resp = await post(url, {
      "identifier": identifier,
      "kind": kind.index,
    });
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
  }

  Future<UserModel> signinByCaptcha(String identifier, SigninKindEnum kind, String captcha) async {
    const url = "/auth/signin";
    final resp = await post(url, {
      "identifier": "email",
      "kind": kind.index,
      "captcha": captcha,
      "clientId": ClientIdEnum.android.index,
    });
    debugPrint("signinByCaptcha repo ${resp.body}");
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
    final data = resp.body;
    return UserModel.fromJson(data);
  }
}