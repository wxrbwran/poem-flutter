import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:poem/src/config/constants.dart';
import 'package:poem/src/features/user/models/user_model.dart';
import 'package:poem/src/features/user/repository/auth_repository.dart';

class UserController extends GetxController{
  final user = Rxn<UserModel>();
  final email = "".obs;
  final error = Rxn<String>();
  final isLoading = false.obs;
  final sp = GetStorage();


  @override
  void onInit() async {
    await loadUser();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> loadUser() async {
    user.value = await readUserToStorage();
  }

  Future<void> setAndSaveUser(UserModel? userModel) async {
    if (userModel != null) {
      user.value = userModel;
      await writeUserToStorage(userModel);
    }
  }

  Future<void> writeUserToStorage(UserModel? userModel) async {
    if (userModel != null) {
      await sp.write(AppConstants.userStorageKey, userModel.toJson());
    }
  }

  Future<UserModel?> readUserToStorage() async {
     final user = sp.read(AppConstants.userStorageKey);
     if (user != null) {
       return UserModel.fromJson(user);
     }
     return null;
  }

  void setError(String? e) {
    error.value = e;
  }



}