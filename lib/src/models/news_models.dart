// To parse this JSON data, do
//
//     final newsResponse = newsResponseFromMap(jsonString);

import 'dart:convert';

class NewsResponse {
    NewsResponse({
        required this.status,
        required this.totalResults,
        required this.articles,
    });

    factory NewsResponse.fromJson(String str) => NewsResponse.fromMap(json.decode(str));

    factory NewsResponse.fromMap(Map<String, dynamic> json) => NewsResponse(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(json["articles"].map((x) => Article.fromMap(x))),
    );

    List<Article> articles;
    String status;
    int totalResults;

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles.map((x) => x.toMap())),
    };
}

class Article {
    Article({
        required this.source,
        this.author,
        required this.title,
        this.description,
        required this.url,
        this.urlToImage,
        required this.publishedAt,
        this.content,
    });

    factory Article.fromJson(String str) => Article.fromMap(json.decode(str));

    factory Article.fromMap(Map<String, dynamic> json) => Article(
        source: Source.fromMap(json["source"]),
        author: json["author"] ,
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
    );

    String ?author;
    String ?content;
    String ?description;
    String? urlToImage;
    DateTime publishedAt;
    Source source;
    String title;
    String url;

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        "source": source.toMap(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage ,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content ,
    };
}

class Source {
    Source({
        this.id,
        required this.name,
    });

    factory Source.fromJson(String str) => Source.fromMap(json.decode(str));

    factory Source.fromMap(Map<String, dynamic> json) => Source(
        id: json["id"] ,
        name: json["name"],
    );

    String ?id;
    String name;

    String toJson() => json.encode(toMap());

    Map<String, dynamic> toMap() => {
        "id": id ,
        "name": name,
    };
}
