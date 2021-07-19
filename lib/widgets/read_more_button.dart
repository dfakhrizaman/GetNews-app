import 'package:flutter/material.dart';
import 'package:news_app/services/webservice.dart';

class ReadMoreButton extends StatelessWidget {
  final String url;

  const ReadMoreButton({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print(url);
        WebService().launchURL(context, url);
      },
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'Read More',
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(shape: StadiumBorder()),
    );
  }
}
