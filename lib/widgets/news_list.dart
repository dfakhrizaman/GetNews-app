import 'package:flutter/material.dart';
import 'package:news_app/pages/article_page.dart';
import 'package:news_app/viewmodels/news_list_vm.dart';
import 'package:provider/provider.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  void initState() {
    super.initState();
    final model = Provider.of<NewsListViewModel>(context, listen: false);
    model.populateList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewsListViewModel>(
      builder: (context, model, child) {
        return model.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      title: Text(model.title(index).length > 44
                          ? '${model.title(index).substring(0, 43)}...'
                          : model.title(index)),
                      subtitle: Text(
                        model.description(index),
                      ),
                      // trailing: Icon(Icons.more_vert),
                      isThreeLine: true,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArticlePage(index: index),
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: model.length,
              );
      },
    );
  }
}
