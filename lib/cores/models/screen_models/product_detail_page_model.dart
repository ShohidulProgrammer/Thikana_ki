import '../import_model.dart';

class ProductDetailPageModel {
  final int id;
  final int galleryID;
  final String title;
  final String subtitle;
  final String banner;
  final UserModel author;
  final String createDate;
  final bool like;
  final double rate;
  final int numRate;
  final String status;
  final String address;
  final String phone;
  final String email;
  final String website;
  final String hour;
  final String description;
  final String date;
  final String priceRange;
  final List<ImageModel> photo;
  final List<Map<String, dynamic>> hourDetail;
  final List<Map<String, dynamic>> service;
  final List<ProductModel> feature;
  final List<ProductModel> related;
  final LocationModel location;

  ProductDetailPageModel(
    this.id,
    this.galleryID,
    this.title,
    this.subtitle,
    this.banner,
    this.author,
    this.createDate,
    this.like,
    this.rate,
    this.numRate,
    this.status,
    this.address,
    this.phone,
    this.email,
    this.website,
    this.hour,
    this.description,
    this.date,
    this.priceRange,
    this.photo,
    this.hourDetail,
    this.service,
    this.feature,
    this.related,
    this.location,
  );

  factory ProductDetailPageModel.fromJson(Map<String, dynamic> json) {
    final Iterable refactorPhoto = json['photo'] ?? [];
    final Iterable refactorFeature = json['feature'] ?? [];
    final Iterable refactorRelated = json['related'] ?? [];

    final listPhoto = refactorPhoto.map((item) {
      return ImageModel.fromJson(item);
    }).toList();

    final feature = refactorFeature.map((item) {
      return ProductModel.fromJson(item);
    }).toList();

    final related = refactorRelated.map((item) {
      return ProductModel.fromJson(item);
    }).toList();

    return ProductDetailPageModel(
      json['id'] as int ?? 0,
      json['gallery_id'] as int ?? 0,
      json['title'] as String ?? 'Unknown',
      json['subtitle'] as String ?? 'Unknown',
      json['banner'] as String ?? 'Unknown',
      UserModel.fromJson(json['author']),
      json['created_date'] as String ?? 'Unknown',
      json['like'] as bool ?? false,
      json['rate'] as double ?? 0.0,
      json['num_rate'] as int ?? 0,
      json['status'] as String ?? 'Unknown',
      json['address'] as String ?? 'Unknown',
      json['phone'] as String ?? 'Unknown',
      json['email'] as String ?? 'Unknown',
      json['website'] as String ?? 'Unknown',
      json['hour'] as String ?? 'Unknown',
      json['description'] as String ?? 'Unknown',
      json['date'] as String ?? 'Unknown',
      json['price_range'] as String ?? 'Unknown',
      listPhoto,
      json['hour_detail'].cast<Map<String, dynamic>>() ?? [],
      json['service'].cast<Map<String, dynamic>>() ?? [],
      feature,
      related,
      LocationModel.fromJson(json['location']),
    );
  }
}
