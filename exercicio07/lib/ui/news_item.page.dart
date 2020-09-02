import 'package:exercicio7start/models/news.model.dart';
import 'package:exercicio7start/ui/news_detail.page.dart';
import 'package:exercicio7start/utils/color.util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsItemPage extends StatelessWidget {
  News _newsModel;

  NewsItemPage(
    @required this._newsModel,
  );

  _openDetail(BuildContext context) {
    Navigator.pushNamed(
      context,
      NewsDetailPage.route,
      arguments: NewsDetailPageArgs(_newsModel),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _openDetail(context),
      child: Padding(
        padding: EdgeInsets.only(
          top: 18,
          left: 15,
          right: 15,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: ColorUtil.gray,
          ),
          child: Column(
            children: [
              SizedBox(
                child: Image.network(_newsModel.image),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 2,
                ),
                child: Container(
                  width: 350,
                  child: Text(
                    _newsModel.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 10,
                  top: 2,
                ),
                child: Container(
                  width: 350,
                  child: Text(
                    _newsModel.description,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      shadows: [
                        Shadow(
                          blurRadius: 5,
                          color: Colors.black,
                          offset: Offset(1, 1),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
