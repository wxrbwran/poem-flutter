import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/article/models/article_model.dart';

class ArticleItem extends StatelessWidget{
  final ArticleModel article;
  const ArticleItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/article/${article.id}");
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(article.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20,
                  ),
                ),
                // const SizedBox(height: 8),
                Row(children: [
                  Text(article.author,
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Text(article.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            )
            ),
            const SizedBox(width: 12),
            Container(
              width: 100,
              height: 76,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                      image: NetworkImage(article.cover))
              ),
            )
          ],
        ),
      ),
    );
  }

}