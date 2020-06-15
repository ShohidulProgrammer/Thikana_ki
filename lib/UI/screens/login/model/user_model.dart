class UserModel {
  UserModel({
    this.id,
    this.name,
    this.businessName,
    this.phone,
    this.password,
    this.confirmPassword,
    this.termsAgreed,
  });

  String id;
  String name;
  String businessName;
  String phone;
  String password;
  String confirmPassword;
  bool termsAgreed;
}
