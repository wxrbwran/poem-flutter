
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/article/controllers/article_list_controller.dart';
import 'package:poem/src/features/article/widgets/article_item.dart';
import 'package:poem/src/features/common/error_page.dart';
import 'package:poem/src/features/common/loading_page.dart';

class ArticleListPage extends StatelessWidget{
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ArticleListController>();
    return Obx(() => controller.isLoading.isTrue ? const LoadingPage() :
      controller.error.value != null  ?
        ErrorPage(title: "Data Error", detail: controller.error.value!) :
        Scaffold(
            backgroundColor: const Color(0xfff1f2f3),
            appBar: AppBar(
              title: const Text("诗文"),
            ),
            body: ListView.separated(
              itemCount: controller.list.length,
              itemBuilder: (context, index) => ArticleItem(article: controller.list[index]),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
            ),
         )
    );
  }

}