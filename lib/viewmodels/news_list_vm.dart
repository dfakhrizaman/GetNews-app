import 'package:flutter/cupertino.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/webservice.dart';

class NewsListViewModel with ChangeNotifier {
  List<NewsArticle> _newsList = [];
  bool isLoading = true;

  List<NewsArticle> get newsList => _newsList;

  int get length => _newsList.length;

  String title(int index) {
    return _newsList[index].title;
  }

  String description(int index) {
    return _newsList[index].description.length <= 90
        ? 'No Description.'
        : '${_newsList[index].description.substring(0, 90)}...';
  }

  String url(int index) {
    return _newsList[index].url;
  }

  String content(int index) {
    return _newsList[index].content.length < 200
        ? _newsList[index].content
        : '${_newsList[index].content.substring(0, 190)}...';
  }

  String urlToImage(int index) {
    return _newsList[index].urlToImage;
  }

  void populateList() async {
    _newsList = await WebService().getNewsList();
    isLoading = false;
    notifyListeners();
  }
}
