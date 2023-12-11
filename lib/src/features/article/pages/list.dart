
import 'package:flutter/material.dart';
import 'package:poem/src/features/article/widgets/article_item.dart';

class ArticleListPage extends StatelessWidget{
  const ArticleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f2f3),
      appBar: AppBar(
        title: const Text("诗文"),
      ),
      body: ListView.separated(
        itemCount: 15,
        itemBuilder: (context, index) => ArticleItem(index: index),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
      ),
    );
  }

}