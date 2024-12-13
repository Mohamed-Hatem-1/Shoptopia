part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsLoaded extends GetAllProductsState {
  final List<ProductModel> products;

  GetAllProductsLoaded({required this.products});
}

final class GetAllProductsError extends GetAllProductsState {
  final String message;
  GetAllProductsError({required this.message});
}
