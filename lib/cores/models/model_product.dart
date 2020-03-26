import 'import_model.dart';

class ProductModel {
  final int id;
  final String title;
  final String subtitle;
  final String image;
  final num rate;
  final num numRate;
  final String rateText;
  final String status;
  final bool favorite;
  final String address;
  final String phone;
  final LocationModel location;

  ProductModel(
    this.id,
    this.title,
    this.subtitle,
    this.image,
    this.rate,
    this.numRate,
    this.rateText,
    this.status,
    this.favorite,
    this.address,
    this.phone,
    this.location,
  );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      json['id'] as int ?? 0,
      json['title'] as String ?? 'Unknown',
      json['subtitle'] as String ?? 'Unknown',
      json['image'] as String ?? 'Unknown',
      json['rate'] as num ?? 0,
      json['num_rate'] as num ?? 0,
      json['rate_text'] as String ?? 'Unknown',
      json['status'],
      json['favorite'] as bool ?? false,
      json['address'] as String ?? 'Unknown',
      json['phone'] as String ?? 'Unknown',
      LocationModel.fromJson(json['location']),
    );
  }
}
