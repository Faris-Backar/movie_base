import 'package:movie_base/common/constant/translation_constants.dart';
import 'package:movie_base/presentation/screens/movie_tabbed/tab.dart';

class MovieTabbedConstants {
  static List<Tab> movieTabs = [
    Tab(index: 0, title: TranslationConstants.popular),
    Tab(index: 1, title: TranslationConstants.now),
    Tab(index: 2, title: TranslationConstants.popular),
    Tab(index: 3, title: 'Soon'),
  ];
}
