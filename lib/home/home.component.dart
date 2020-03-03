import 'dart:async';

import 'package:angular/angular.dart';

import '../models/article.model.dart';
import '../services/articles_service.dart';
import '../services/tags_service.dart';

@Component(
  selector: 'app-home-page',
  templateUrl: './home.component.html',
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class HomeComponent implements OnInit {
  final ArticlesService _articleService;
  final TagsService _tagsService;

  List<Article> articles;
  List<String> tags;

  HomeComponent(this._articleService, this._tagsService);

  Future<void> _getArticles() async {
    articles = await _articleService.getAll();
  }

  Future<void> _getTags() async {
    tags = await _tagsService.getAll();
  }

  void ngOnInit() {
    _getArticles();
    _getTags();
  }
}