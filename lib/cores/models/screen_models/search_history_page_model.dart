import '../import_model.dart';

class SearchHistoryPageModel {
  final List<TagModel> tag;
  final List<TagModel> discover;
  final List<PopularModel> popular;

  SearchHistoryPageModel(
    this.tag,
    this.discover,
    this.popular,
  );

  factory SearchHistoryPageModel.fromJson(Map<String, dynamic> json) {
    final Iterable refactorTag = json['tag'] ?? [];
    final Iterable refactorDiscover = json['discover'] ?? [];
    final Iterable refactorPopular = json['popular'] ?? [];

    final listTag = refactorTag.map((item) {
      return TagModel.fromJson(item);
    }).toList();

    final listDiscover = refactorDiscover.map((item) {
      return TagModel.fromJson(item);
    }).toList();

    final listPopular = refactorPopular.map((item) {
      return PopularModel.fromJson(item);
    }).toList();

    return SearchHistoryPageModel(
      listTag,
      listDiscover,
      listPopular,
    );
  }
}
