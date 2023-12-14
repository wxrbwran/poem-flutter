import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poem/src/features/enums/agreement_kind_enum.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kind = (Get.parameters['kind']);
    debugPrint("kind: $kind");
    final agreementKind = kind == AgreementKindEnum.user.value ?
      AgreementKindEnum.user : AgreementKindEnum.privacy;
    late final PlatformWebViewControllerCreationParams params;
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final controller = WebViewController.fromPlatformCreationParams(params);
    controller.loadHtmlString(agreementKind.content);

    return Scaffold(
      appBar: AppBar(
        title: Text(agreementKind.label),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
