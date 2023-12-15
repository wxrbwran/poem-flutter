import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/common/base_repository.dart';
import 'package:poem/src/features/enums/client_id_enum.dart';
import 'package:poem/src/features/enums/signin_kind_enum.dart';
import 'package:poem/src/features/user/models/user_model.dart';

class MediaRepository extends BaseRepository{

  static MediaRepository get to => Get.find();

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

}