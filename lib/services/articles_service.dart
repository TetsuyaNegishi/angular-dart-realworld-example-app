import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';

import '../models/article.model.dart';

class ArticlesService {
  static final _url = 'https://conduit.productionready.io/api/articles?limit=10&offset=0';

  final Client _http;

  ArticlesService(this._http);

  Future<List<Article>> getAll() async {
    try {
      final response = await _http.get(_url);

      final articles = (_extractArticles(response) as List)
          .map((json) => Article.fromJson(json))
          .toList();
      return articles;
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractArticles(Response resp) => json.decode(resp.body)['articles'];

  Exception _handleError(dynamic e) {
    print(e); // for demo purposes only
    return Exception('Server error; cause: $e');
  }
}