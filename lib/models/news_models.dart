import 'dart:convert';

NewsResponse newsResponseFromJson(String str) => NewsResponse.fromJson(json.decode(str));

String newsResponseToJson(NewsResponse data) => json.encode(data.toJson());

class NewsResponse {
  NewsResponse({
    this.status,
    this.totalResults,
    required this.articles,
  });

  String? status;
  int? totalResults;
  List<Article> articles;

  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<Article>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Article({
    this.source,
    this.author,
    required this.title,
    this.description = '',
    this.url,
    this.urlToImage = '',
    this.publishedAt,
    this.content,
  });

  Source? source;
  String? author;
  String title;
  String description;
  String? url;
  String urlToImage;
  DateTime? publishedAt;
  String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source.fromJson(json["source"]),
    author: json["author"] == null ? '' : json["author"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? '' : json["description"],
    url: json["url"],
    urlToImage: json["urlToImage"] == null ? '' : json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"] == null ? null : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source!.toJson(),
    "author": author == null ? '' : author,
    "title": title,
    "description": description == null ? '' : description,
    "url": url,
    "urlToImage": urlToImage == null ? '' : urlToImage,
    "publishedAt": publishedAt.toString(),
    "content": content == null ? null : content,
  };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null ? null : json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name,
  };
}
