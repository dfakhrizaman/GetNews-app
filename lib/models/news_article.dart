class NewsArticle {
  final String title;
  final String description;
  final String url;
  final String content;
  final String urlToImage;

  NewsArticle({
    required this.title,
    required this.description,
    required this.url,
    required this.content,
    required this.urlToImage,
  });

  factory NewsArticle.fromJSON(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      description: json['description'] != null ? json['description'] : '',
      url: json['url'],
      content: json['content'] != null ? json['content'] : '',
      urlToImage: json['urlToImage'] != null ? json['urlToImage'] : '',
    );
  }
}
