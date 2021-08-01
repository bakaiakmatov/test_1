class LoadData {
  final String email;
  final String password;

  LoadData({required this.email, required this.password});
  factory LoadData.fromJson(Map<String, dynamic> json) {
    return LoadData(email: json['email'], password: json['password']);
  }
}
