import 'package:flutter/cupertino.dart';

class News {
  final String id;
  final String title;
  final String description;
  final String url;
  final String image;
  final String author;
  final String category;

  News({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.url,
    @required this.image,
    @required this.author,
    @required this.category,
  })  : assert(id != null),
        assert(title != null),
        assert(description != null),
        assert(url != null),
        assert(image != null),
        assert(author != null),
        assert(category != null);

  News.fromJson(Map jsonMap)
      : assert(jsonMap['id'] != null),
        assert(jsonMap['title'] != null),
        assert(jsonMap['description'] != null),
        assert(jsonMap['url'] != null),
        assert(jsonMap['image'] != null),
        assert(jsonMap['author'] != null),
        assert(jsonMap['category'] != null),
        id = jsonMap['id'],
        title = jsonMap['title'],
        description = jsonMap['description'],
        url = jsonMap['url'],
        image = jsonMap['image'],
        author = jsonMap['author'],
        category = (jsonMap['category'] as List).first;
}
