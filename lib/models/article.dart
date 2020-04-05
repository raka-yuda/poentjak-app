import './author.dart';

class Article {
  int id;
  String imgArticle;
  String titleArticle;
  String article;
  String postDate;
  bool published;
  int idAuthor;
  Author author;

  Article(
      {this.id,
      this.imgArticle,
      this.titleArticle,
      this.article,
      this.postDate,
      this.published,
      this.idAuthor,
      this.author});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imgArticle = json['img_article'];
    titleArticle = json['title_article'];
    article = json['article'];
    postDate = json['post_date'];
    published = json['published'];
    idAuthor = json['id_author'];
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['img_article'] = this.imgArticle;
    data['title_article'] = this.titleArticle;
    data['article'] = this.article;
    data['post_date'] = this.postDate;
    data['published'] = this.published;
    data['id_author'] = this.idAuthor;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    return data;
  }
}
