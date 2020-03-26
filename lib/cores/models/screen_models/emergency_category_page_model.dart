
import '../model_emergency_category.dart';

class EmergencyCategoryPageModel {
  final List<EmergencyCategoryModel> emergencyCategory;

  EmergencyCategoryPageModel(
      this.emergencyCategory,
      );

  factory EmergencyCategoryPageModel.fromJson(Map<String, dynamic> json) {
    final Iterable convertCategory = json['emergency_category'] ?? [];

    final listCategory = convertCategory.map((item) {
      return EmergencyCategoryModel.fromJson(item);
    }).toList();

    return EmergencyCategoryPageModel(
      listCategory,
    );
  }
}
