import 'package:escuelajs/src/helpers/api_helper.dart';
import 'package:escuelajs/src/models/api_response_model.dart';
import 'package:escuelajs/src/web_service/api_routes.dart';

class ProductRepository {
  Future<ApiResponseModel> getAllProducts() async {
    ApiResponseModel response =
        await ApiHelper().makeGetRequest(ApiRoutes.products);
    return response;
  }
}
