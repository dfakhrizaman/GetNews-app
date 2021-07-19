import 'package:flutter/material.dart';
import 'package:news_app/viewmodels/news_list_vm.dart';
import 'package:news_app/widgets/read_more_button.dart';
import 'package:provider/provider.dart';

class ArticlePage extends StatelessWidget {
  final int index;

  ArticlePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsListViewModel>(
      builder: (context, article, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('GetNews'),
          ),
          body: Column(
            children: [
              article.urlToImage(index) != ''
                  ? Image.network(
                      article.urlToImage(index),
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Padding(
                          padding: const EdgeInsets.all(90.0),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                    )
                  : Container(),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      article.title(index),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      article.content(index),
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 24),
                    ReadMoreButton(url: article.url(index)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
