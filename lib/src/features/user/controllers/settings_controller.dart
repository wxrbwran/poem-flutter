import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poem/src/features/user/controllers/user_controller.dart';
import 'package:poem/src/features/user/repository/settings_repository.dart';

class SettingsController extends GetxController{
  final repo = Get.find<SettingsRepository>();
  final userController = Get.find<UserController>();

  final name = "".obs;
  final bio = "".obs;
  final sex = 0.obs;
  final file = Rxn<File>();
  final avatar = "".obs;

  final error = Rxn<String>();
  final isLoading = false.obs;
  final sp = GetStorage();




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

  void setAvatar(String n) {
    avatar.value = n;
  }

  Future<void> saveAvatar(String n) async {
    try {
      isLoading.value = true;
      await repo.changeAvatar(n);
      userController.changeAvatar(n);
    } catch (e) {
      setError("saveName fail: $e");
    } finally {
      isLoading.value = false;
    }
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
      setError("saveSex fail: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> pickAndCropImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    try{
      final image = await picker.pickImage(source: source);
      debugPrint("$image");
      if (image != null) {
        debugPrint(image.path);
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
            CropAspectRatioPreset.ratio3x2,
            CropAspectRatioPreset.original,
            CropAspectRatioPreset.ratio4x3,
            CropAspectRatioPreset.ratio16x9
          ],
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: '裁剪图片',
                toolbarColor: Colors.deepOrange,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.original,
                lockAspectRatio: false),
            IOSUiSettings(
              title: '裁剪图片',
            ),
          ],
        );
        if (croppedFile != null){
          file.value = File(croppedFile.path);
        }
      }
    } catch (e) {
      debugPrint("$e");
    }
  }
}