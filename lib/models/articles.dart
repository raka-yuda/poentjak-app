import 'package:json_annotation/json_annotation.dart';

part 'articles.g.dart';

@JsonSerializable()
class Articles {
  @JsonKey(name: "articles")
  final List<Article> listArticles;
  @JsonKey(ignore: true)
  String? error;

  Articles({required this.listArticles});

  factory Articles.fromJson(Map<String, dynamic> json) =>
      _$ArticlesFromJson(json);

  Articles.withError(this.error);

  Map<String, dynamic> toJson() => _$ArticlesToJson(this);

  @override
  String toString() {
    return 'Articles{articles: $listArticles}';
  }
}

@JsonSerializable()
class Article {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "img_article")
  String imgArticle;
  @JsonKey(name: "title_article")
  String titleArticle;
  @JsonKey(name: "article")
  String article;
  @JsonKey(name: "post_date")
  String postDate;
  @JsonKey(name: "published")
  bool published;
  @JsonKey(name: "author")
  Author author;

  Article(
      {this.id,
      this.imgArticle,
      this.titleArticle,
      this.article,
      this.postDate,
      this.published,
      this.author});

  @override
  String toString() {
    return 'Article{id :$id, img_article :$imgArticle ,title_article :$titleArticle ,article :$article ,post_date :$postDate ,published :$published , author : $author}';
  }

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}

@JsonSerializable()
class Author {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "name_author")
  String nameAuthor;
  @JsonKey(name: "img_author")
  String imgAuthor;

  Author({this.id, this.nameAuthor, this.imgAuthor});

  @override
  String toString() {
    return 'Author{id :$id ,name_author :$nameAuthor ,img_author : $imgAuthor}';
  }

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
