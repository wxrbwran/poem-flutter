import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/article/models/article_model.dart';
import 'package:poem/src/features/article/repository/article_repository.dart';

class ArticleListController extends GetxController{
  final repo = Get.find<ArticleRepository>();
  final isLoading = false.obs;
  final error = Rxn<String>();
  final list = <ArticleModel>[].obs;

  @override
  void onInit() {
    getRandomList();
    super.onInit();
  }

  void setError(String? detail) {
    error.value = detail;
  }

  Future<void> getRandomList() async {

    try {

      isLoading(true);
      var randomList = await repo.getRandomList();
      list.value = randomList;

    } catch(e) {
      final detail = e.toString();
      debugPrint(detail);
      setError(detail);
    } finally {
      isLoading(false);
    }
  }
}