import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:escuelajs/src/cubit/category_cubit/category_repository.dart';
import 'package:escuelajs/src/models/api_response_model.dart';
import 'package:escuelajs/src/models/category_model.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());
  CategoryRepository _repository = CategoryRepository();

  getAllCategories() async {
    emit(CategoryLoading());
    try {
      ApiResponseModel response = await _repository.getAllCategories();
      if (response.data != null) {
        var categories = categoryFromJson(response.data);

        emit(CategoryLoadSuccess(categories));
      }
    } catch (ex) {
      emit(CategoryLoadError("errorMessage"));
    }
  }
}
