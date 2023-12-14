import 'package:get/get.dart';
import 'package:poem/src/features/article/binding/article_list_binding.dart';
import 'package:poem/src/features/article/pages/article_detail_page.dart';
import 'package:poem/src/features/home/pages/home_page.dart';
import 'package:poem/src/features/user/binding/settings_page_binding.dart';
import 'package:poem/src/features/user/binding/signin_page_binding.dart';
import 'package:poem/src/features/user/pages/agreement_page.dart';
import 'package:poem/src/features/user/pages/captcha_page.dart';
import 'package:poem/src/features/user/pages/settings_page.dart';
import 'package:poem/src/features/user/pages/signin_page.dart';
import 'package:poem/src/routes/midwares/auth_middleware.dart';

class AppRoute {
  static final pages = [
    // GetPage(name: "/", page: () => const SigninPage(), binding: SigninPageBinding()),
    GetPage(
        name: "/",
        page: () => const HomePage(),
        bindings: [
          ArticleListBinding(),
          SigninPageBinding(),
        ],
        middlewares: [AuthMiddleware()]
    ),
    GetPage(
        name: "/signin",
        page: () => const SigninPage(),
        binding: SigninPageBinding(),
        middlewares: [AuthMiddleware()],
        children: [
          GetPage(name: "/captcha", page: () => const CaptchaPage()),
        ]
    ),
    GetPage(name: "/article/:articleId", page: () => const ArticleDetailPage()),
    GetPage(name: "/agreement", page: () => const AgreementPage()),
    GetPage(
      name: "/settings",
      page: () => const SettingsPage(),
      binding: SettingsPageBinding(),
    ),
  ];
}