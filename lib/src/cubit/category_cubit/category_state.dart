part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();
}

class CategoryInitial extends CategoryState {
  @override
  List<Object> get props => [];
}

class CategoryLoading extends CategoryState {
  @override
  List<Object> get props => [];
}


class CategoryLoadSuccess extends CategoryState {
  final List<CategoryModel> categoriesList;

  CategoryLoadSuccess(this.categoriesList);

  @override
  List<Object> get props => [categoriesList];
}


class CategoryLoadError extends CategoryState {
  final String errorMessage;

  CategoryLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

