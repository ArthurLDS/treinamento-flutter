import 'dart:io';

import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/network/api.dart';
import 'package:exercicio7start/utils/color.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'news_item.page.dart';

class NewsFeedPage extends StatefulWidget {
  static const route = '/';

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  List<News> _newsList = <News>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _loadNewsData();
  }

  _loadNewsData() async {
    _newsList = await Api.retrieveLocalNews(context);
    setState(() {});
  }

  Widget _showLoading() {
    return Center(
      child: Platform.isIOS
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(),
    );
  }

  _showNewsList() {
    return _newsList.isEmpty
        ? _showLoading()
        : ListView.builder(
            itemBuilder: (BuildContext context, int position) {
              return NewsItemPage(_newsList[position]);
            },
            itemCount: _newsList.length,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
        centerTitle: true,
        backgroundColor: ColorUtil.primary,
      ),
      body: Container(
        height: double.infinity,
        color: ColorUtil.secondary,
        child: _showNewsList(),
      ),
    );
  }
}
