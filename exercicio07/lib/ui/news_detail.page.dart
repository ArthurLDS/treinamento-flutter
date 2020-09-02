import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/utils/color.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetailPageArgs {
  News news;

  NewsDetailPageArgs(this.news);
}

class NewsDetailPage extends StatelessWidget {
  static const route = '/detail';
  NewsDetailPageArgs args;

  NewsDetailPage(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.news.author),
        centerTitle: true,
        backgroundColor: ColorUtil.primary,
      ),
      body: Container(
        color: ColorUtil.secondary,
        height: double.infinity,
        width: double.infinity,
        child: WebView(
          initialUrl: args.news.url,
        ),
      ),
    );
  }
}
