import 'dart:ui';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SubscribeViewModel extends BaseViewModel {
  var url = 'https://docs.google.com/forms/d/e/1FAIpQLScp_HqMYguflxCEuFcTlukErs9UMu01JWg5LZ2VTYwSREQWlg/viewform';

  initController(){
    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://flutter.dev/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(url),
      );
    return controller;
  }
}
