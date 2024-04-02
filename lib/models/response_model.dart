class CResponseModel {
  final bool success;
  final dynamic data;
  const CResponseModel({required this.success, required this.data});

  static CResponseModel fronJson(dynamic json) {
    return CResponseModel(success: json['success'], data: json['data']);
  }
}
