import 'dart:convert';

class ApiResponseModel {
  // final bool? status;
  final List<dynamic> data;
  // final String? message;
  // final String? error;
  // final String? token;
  // final bool? isForceLogin;

  ApiResponseModel({
    required this.data,
  });

  factory ApiResponseModel.fromJSON(List<dynamic> json) {
    return ApiResponseModel(
      data: json,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "data": this.data,
    };
  }
}
