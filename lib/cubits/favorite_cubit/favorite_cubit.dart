import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoptopia/models/product_model.dart';

class FavoritesCubit extends Cubit<List<ProductModel>> {
  FavoritesCubit() : super([]);

  void toggleFavorite(ProductModel product) {
    if (state.contains(product)) {
      emit(List.from(state)..remove(product));
    } else {
      emit(List.from(state)..add(product));
    }
  }
}
