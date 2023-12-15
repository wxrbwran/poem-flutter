
import 'dart:io';

import 'package:get/get.dart';
import 'package:qiniu_flutter_sdk/qiniu_flutter_sdk.dart';
import 'package:poem/src/features/user/models/user_model.dart';

class QiniuController extends GetxController{
  final user = Rxn<UserModel>();
  final email = "".obs;
  final error = Rxn<String>();
  final isLoading = false.obs;
  // 创建 storage 对象
  final storage = Storage();
  // 创建 Controller 对象
  final putController = PutController();


  @override
  void onInit() async {
    // 添加整体进度监听
    putController.addProgressListener(progressListener);

    // // 添加发送进度监听
    // putController.addSendProgressListener((double percent) {
    //   print('已上传进度变化：已发送：$percent');
    // });

    // 添加状态监听
    putController.addStatusListener(statusListener);
    super.onInit();
  }

  @override
  void onClose() {
    putController.removeProgressListener(progressListener);
    putController.removeStatusListener(statusListener);
    super.onClose();
  }

  progressListener(double percent) {
    print('任务进度变化：已发送：$percent');
  }

  statusListener(StorageStatus status) {
    print('状态变化: 当前任务状态：$status');
  }

  void setError(String? e) {
    error.value = e;
  }


  Future<void> upload(File file) async {
    // 使用 storage 的 putFile 对象进行文件上传
    storage.putFile(file, 'TOKEN', options:PutOptions(
      controller: putController,
    ));
  }
}