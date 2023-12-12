import 'package:get/get.dart';
import 'package:poem/src/features/article/controllers/article_list_controller.dart';
import 'package:poem/src/features/article/repository/article_repository.dart';

class ArticleListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleRepository());
    Get.lazyPut(() => ArticleListController());
  }

}