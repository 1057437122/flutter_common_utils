import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

import '../string/string_utls.dart';

class WebViewSingleton {
  static InAppWebViewController? _webViewController;

  static InAppWebViewController? get webViewController => _webViewController;

  // static void setWebViewController(InAppWebViewController controller) {
  //   _webViewController = controller;
  // }
}

class MyWebView extends StatelessWidget {
  final String url;
  const MyWebView({required this.url, super.key});

  Widget inAppWebViewWidget(String webviewUrl) => InAppWebView(
        initialSettings: InAppWebViewSettings(
          // userAgent: userAgent.value,
          allowsInlineMediaPlayback: true,
        ),
        // initialUrlRequest: URLRequest(
        //   url: WebUri(widget.initUrl),
        // ),
        onReceivedHttpError: (controller, request, errorResponse) {
          logData("error recved webview ${errorResponse.toString()}");
        },
        onConsoleMessage: (controller, consoleMessage) {
          logData('console message here =>${consoleMessage.toString()}');
        },
        onLoadStop: (controller, url) {
          logData('stopped');
        },
        onUpdateVisitedHistory: (controller, url, isReload) {
          // if (mounted) {
          //   // context.read<WebViewUrlCubit>().setUrl(url.toString());
          // }
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          var uri = navigationAction.request.url!;

          // if (widget.innerUrlUseSystembrowser) {
          //   launchUrl(
          //     Uri.parse(uri.rawValue),
          //     mode: LaunchMode.externalApplication,
          //   );
          //   return NavigationActionPolicy.CANCEL;
          // }
          if (!["https", "file", "chrome", "data", "javascript", "about"]
              .contains(uri.scheme)) {
            launchUrl(
              Uri.parse(uri.rawValue),
              mode: LaunchMode.externalApplication,
            );
            return NavigationActionPolicy.CANCEL;
          }

          return NavigationActionPolicy.ALLOW;
        },
        onWebViewCreated: (controller) async {
          WebViewSingleton._webViewController = controller;
          // await controller.clearCache();
          await InAppWebViewController.clearAllCache(includeDiskFiles: true);
          logData('web view created');

          controller.loadUrl(
            urlRequest: URLRequest(
              url: WebUri(webviewUrl),
            ),
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        bool webviewCanBack =
            (await WebViewSingleton._webViewController?.canGoBack()) ?? false;
        if (webviewCanBack) {
          WebViewSingleton._webViewController!.goBack();
        } else {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Icon(Icons.blur_circular),
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                if ((await WebViewSingleton._webViewController?.canGoBack()) ??
                    false) {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                } else {
                  Navigator.of(context).maybePop();
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.0),
                child: Icon(Icons.close_outlined),
              ),
            )
          ],
        ),
        body: inAppWebViewWidget(url),
      ),
    );
  }
}
