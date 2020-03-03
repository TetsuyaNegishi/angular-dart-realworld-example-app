import 'package:angular/angular.dart';

import 'home/home.component.dart';
import 'services/articles_service.dart';
import 'services/tags_service.dart';

@Component(
  selector: 'my-app',
  directives: [HomeComponent],
  template: '<app-home-page></app-home-page>',
  providers: [ClassProvider(ArticlesService), ClassProvider(TagsService)],
)
class AppComponent {
  var name = 'Angular';
}
