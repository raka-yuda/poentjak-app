class Article {
  int id;
  String titleArticle;
  String article;
  String imgArticle;
  String postDate;
  String nameAuthor;
  String imgAuthor;

  Article(
      {this.id,
      this.titleArticle,
      this.article,
      this.imgArticle,
      this.postDate,
      this.nameAuthor,
      this.imgAuthor});

  Article.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleArticle = json['title_article'];
    article = json['article'];
    imgArticle = json['img_article'];
    postDate = json['post_date'];
    nameAuthor = json['name_author'];
    imgAuthor = json['img_author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title_article'] = this.titleArticle;
    data['article'] = this.article;
    data['img_article'] = this.imgArticle;
    data['post_date'] = this.postDate;
    data['name_author'] = this.nameAuthor;
    data['img_author'] = this.imgAuthor;
    return data;
  }
}
