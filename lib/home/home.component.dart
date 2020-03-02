import 'dart:async';

import 'package:angular/angular.dart';

import '../models/article.model.dart';
import '../services/articles_service.dart';

@Component(
  selector: 'app-home-page',
  templateUrl: './home.component.html',
  directives: [coreDirectives],
)
class HomeComponent implements OnInit {
  final ArticlesService _articleService;
  List<Article> articles;

  HomeComponent(this._articleService);

  Future<void> _getArticles() async {
    articles = await _articleService.getAll();
  }

  void ngOnInit() => _getArticles();
}