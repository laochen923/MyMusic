import 'package:mymusic/main/entity/search_suggest_entity.dart';
abstract class SearchView{
  void updateSearchSuggest(List<SearchSuggest> allMatch);
}