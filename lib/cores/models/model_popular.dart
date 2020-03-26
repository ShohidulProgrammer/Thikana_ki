class PopularModel {
  final int id;
  final int totalItem;
  final String title;
  final String image;

  PopularModel(
      this.id,
      this.totalItem,
      this.title,
      this.image,
  );

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      json['id'] as int ?? 0,
      json['totalItem'] as int ?? 0,
      json['title'] as String ?? 'Unknown',
      json['image'] as String ?? 'Unknown',
    );
  }
}
