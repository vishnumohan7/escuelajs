import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:escuelajs/src/cubit/products_cubit/products_repository.dart';
import 'package:escuelajs/src/models/api_response_model.dart';
import 'package:escuelajs/src/models/products_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  ProductRepository _repository = ProductRepository();

  getAllProducts() async {
    emit(ProductsLoading());

    try {
      ApiResponseModel response = await _repository.getAllProducts();
      if (response.data != null) {
        var products = productsFromJson(response.data);
        emit(ProductsLoadSuccess(products));
      }
    } catch (ex) {
      emit(ProductsLoadError());
    }
  }
}
