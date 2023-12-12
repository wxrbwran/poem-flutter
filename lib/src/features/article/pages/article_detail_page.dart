
import 'package:flutter/material.dart';

class ArticleDetailPage extends StatelessWidget{
  const ArticleDetailPage({super.key});

  Widget SliverGap(double n) {
    return SliverToBoxAdapter(
      child: SizedBox(height: n),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("诗文详情"),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Text("标题",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),),
          ),
          SliverGap(12),
          const SliverToBoxAdapter(
            child: Row(
              children: [
                Text("曹雪芹"),
              ],
            )
          ),
          SliverGap(12),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage("https://www.wjbrain.com/storage/images/8ae7ca55310d59e4a9083dc8b3b51f63.jpg")
                )
              ),
            ),
          ),
          SliverGap(12),
          const SliverToBoxAdapter(
              child: Text("""
                非常长的内容用三引号非常长的内容用三引号非常长的内容用三引号非常长的内容用三引号非常长的内容用三引号
              """,
              style: TextStyle(fontSize: 20),),
          ),
        ],
      ),
    );
  }

}