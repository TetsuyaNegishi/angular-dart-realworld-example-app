import 'package:angular/angular.dart';

import 'home/home.component.dart';
import 'services/articles_service.dart';

@Component(
  selector: 'my-app',
  directives: [HomeComponent],
  template: '<app-home-page></app-home-page>',
  providers: [ClassProvider(ArticlesService)],
)
class AppComponent {
  var name = 'Angular';
}
