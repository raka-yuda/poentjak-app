import '../../models/articles.dart';
import '../provider/api_article_provider.dart';

class ApiArticleRepository {
  final ApiArticleProvider _apiArticleProvider = ApiArticleProvider();

  Future<Articles> fetchArticles() => _apiArticleProvider.getArticles();
}
