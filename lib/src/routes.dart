import 'package:get/get.dart';
import 'package:poem/src/features/article/pages/detail.dart';
import 'package:poem/src/features/article/pages/list.dart';

class AppRoute {
  static final pages = [
    GetPage(name: "/", page: () => const ArticleListPage()),
    GetPage(name: "/article/:articleId", page: () => const ArticleDetailPage()),
  ];
}