import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleItem extends StatelessWidget{
  final int index;
  const ArticleItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/article/$index");
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
                const Text("title",
                  style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20,
                  ),
                ),
                // const SizedBox(height: 8),
                Row(children: [
                  Text("author",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                    ),
                  ),
                ]),
                const SizedBox(height: 8),
                Text("title3title3title3title3title3title3title3title3title3title3title3title3title3title3title3title3title3title3",
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
                  image: const DecorationImage(
                      image: NetworkImage("https://www.wjbrain.com/storage/images/8ae7ca55310d59e4a9083dc8b3b51f63.jpg"))
              ),
            )
          ],
        ),
      ),
    );
  }

}