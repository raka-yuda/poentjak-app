// class ArticleList {
//   final List<ArticleModel> articles;

//   ArticleList({
//     this.articles,
//   });

//   factory ArticleList.fromJson(List<dynamic> parsedJson) {
//     List<ArticleModel> articles = new List<ArticleModel>();
//     articles = parsedJson.map((i) => ArticleModel.fromJson(i)).toList();

//     return new ArticleList(articles: articles);
//   }
// }

class ArticleModel {
  final int id;
  final String titleArticle;
  final String article;
  final String imgArticle;
  final String postDate;
  final String nameAuthor;
  final String imgAuthor;

  ArticleModel(
      {this.id,
      this.titleArticle,
      this.article,
      this.imgArticle,
      this.postDate,
      this.nameAuthor,
      this.imgAuthor});

  // factory ArticleModel.fromJson(Map<String, dynamic> json) {
  //   return ArticleModel(
  //     id: json['id'],
  //     titleArticle: json['title_article'],
  //     article: json['article'],
  //     imgArticle: json['img_article'],
  //     postDate: json['post_date'],
  //     nameAuthor: json['name_author'],
  //     imgAuthor: json['img_author'],
  //   );
  // }
  
}




