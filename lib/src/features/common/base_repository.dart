import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:poem/src/features/article/app_config.dart';

class BaseRepository extends GetConnect{
  final logger = Logger(
    printer: PrettyPrinter(
        methodCount: 2, // Number of method calls to be displayed
        errorMethodCount: 8, // Number of method calls if stacktrace is provided
        lineLength: 120, // Width of the output
        colors: true, // Colorful log messages
        printEmojis: true, // Print an emoji for each log message
        printTime: false // Should each log print contain a timestamp
    ),
  );
  @override
  void onInit() {
    httpClient.baseUrl = AppConfig.baseUrl;
    httpClient.addRequestModifier<void>((request) {
      logger.d("method: ${request.method},\nurl: ${request.url},\nheaders: ${request.headers},\nbodyBytes: ${request.bodyBytes}, ");
      return request;
    });
    httpClient.addResponseModifier((request, response) {
      logger.d("status: ${response.status},\nstatusText: ${response.statusText},\nbody: ${response.body}, ");
      return response;
    });
    super.onInit();
  }

}