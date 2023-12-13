import 'package:get/get.dart';
import 'package:poem/src/config/app_config.dart';
import 'package:poem/src/features/article/models/article_model.dart';

class ArticleRepository extends GetConnect{

  static ArticleRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    super.onInit();
  }

  Future<List<ArticleModel>> getRandomList() async {
    const url = "/article/list/random";
    final resp = await get(url);
    if (resp.status.hasError) {
      return Future.error(Exception(resp.statusText));
    }
    final data = resp.body as List;
    return data.map((e) => ArticleModel.fromJson(e)).toList();
  }
}