import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/common/base_repository.dart';
import 'package:poem/src/features/enums/client_id_enum.dart';
import 'package:poem/src/features/enums/signin_kind_enum.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/models/user_model.dart';

class SettingsRepository extends BaseRepository{

  static SettingsRepository get to => Get.find();
  final userController = Get.find<UserController>();

  Future<void> changeAvatar(String avatar) async {
    const url = "/user/edit/avatar";
    final resp = await put(url, {
      "avatar": avatar,
    });
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
  }

  Future<void> changeName(String name) async {
    const url = "/user/edit/name";
    final resp = await put(url, {
      "name": name,
    });
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
  }


  Future<void> changeBio(String bio) async {
    const url = "/user/edit/bio";
    final resp = await put(url, {
      "bio": bio,
    });
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
  }

  Future<void> changeSex(int sex) async {
    const url = "/user/edit/sex";
    final resp = await put(url, {
      "sex": sex,
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
    }, headers: {
      "Authorization": "Bearer ${userController.user.value?.token}",
      }
    );
    debugPrint("signinByCaptcha repo ${resp.body}");
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
    final data = resp.body;
    return UserModel.fromJson(data);
  }

}