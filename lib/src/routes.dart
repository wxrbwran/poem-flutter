import 'package:get/get.dart';
import 'package:poem/src/features/article/binding/article_list_binding.dart';
import 'package:poem/src/features/article/pages/article_detail_page.dart';
import 'package:poem/src/features/article/pages/article_list_page.dart';
import 'package:poem/src/features/home/pages/home_page.dart';
import 'package:poem/src/features/user/binding/signin_page_binding.dart';
import 'package:poem/src/features/user/pages/captcha_page.dart';
import 'package:poem/src/features/user/pages/signin_page.dart';

class AppRoute {
  static final pages = [
    // GetPage(name: "/", page: () => const SigninPage(), binding: SigninPageBinding()),
    GetPage(name: "/", page: () => const HomePage(), binding: ArticleListBinding()),
    GetPage(
        name: "/signin",
        page: () => const SigninPage(),
        binding: SigninPageBinding(),
        children: [
          GetPage(name: "/captcha", page: () => const CaptchaPage()),
        ]
    ),
    GetPage(name: "/article/:articleId", page: () => const ArticleDetailPage()),
  ];
}