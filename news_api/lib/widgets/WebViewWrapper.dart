import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebViewWrapper extends StatefulWidget {
  const MyWebViewWrapper({super.key, required this.url});
  final String url;

  @override
  State<MyWebViewWrapper> createState() => _MyWebViewWrapperState();
}

class _MyWebViewWrapperState extends State<MyWebViewWrapper> {
  late WebViewController _controller;
  var loadingPercentage = 0;
  var error = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController();
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    _controller.setBackgroundColor(const Color(0x00000000));
    _controller.setNavigationDelegate(
      NavigationDelegate(
        onPageStarted: (String url) => setState(() => loadingPercentage = 0),
        onProgress: (int progress) => setState(() => loadingPercentage = progress),
        onPageFinished: (String url) => setState(() => loadingPercentage = 100),
        onWebResourceError: (WebResourceError error) => setState(() => this.error = true),
        onNavigationRequest: (NavigationRequest request) => NavigationDecision.navigate,
      ),
    );
    if (widget.url.isNotEmpty) _controller.loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url.isEmpty || error == true) {
      return Center(child: Text("Error."));
    }

    return Stack(
      children: [
        WebViewWidget(controller: _controller),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          ),
      ],
    );
  }
}