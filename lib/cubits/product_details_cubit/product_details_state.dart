part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductFavoriteToggled extends ProductDetailsState {
  final bool isFavorite;

  ProductFavoriteToggled({required this.isFavorite});
}
