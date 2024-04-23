import 'package:flutter/material.dart';

import '../widgets/WebViewWrapper.dart';

class NewsDetailScreen extends StatelessWidget {
  final String url;

  NewsDetailScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Detail'),
      ),
      body: MyWebViewWrapper(url: url),
    );
  }
}
