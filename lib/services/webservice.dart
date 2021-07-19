import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/models/news_article.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_tabs/flutter_custom_tabs.dart';

class WebService {
  Future<List<NewsArticle>> getNewsList() async {
    String url =
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=f15e7ee758304018b17ce96b593a2d04';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result['articles'];

      return list.map((article) => NewsArticle.fromJSON(article)).toList();
    } else {
      throw Exception('Failed to get News');
    }
  }

  void launchURL(BuildContext context, String url) async {
    try {
      await launch(
        '$url',
        customTabsOption: CustomTabsOption(
          toolbarColor: Theme.of(context).primaryColor,
          enableDefaultShare: true,
          enableUrlBarHiding: false,
          showPageTitle: true,
          animation: CustomTabsSystemAnimation.slideIn(),
          extraCustomTabs: const <String>[
            // ref. https://play.google.com/store/apps/details?id=org.mozilla.firefox
            'org.mozilla.firefox',
            // ref. https://play.google.com/store/apps/details?id=com.microsoft.emmx
            'com.microsoft.emmx',
          ],
        ),
        safariVCOption: SafariViewControllerOption(
          preferredBarTintColor: Theme.of(context).primaryColor,
          preferredControlTintColor: Colors.white,
          barCollapsingEnabled: true,
          entersReaderIfAvailable: false,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.close,
        ),
      );
    } catch (e) {
      // An exception is thrown if browser app is not installed on Android device.
      debugPrint(e.toString());
    }
  }
}
