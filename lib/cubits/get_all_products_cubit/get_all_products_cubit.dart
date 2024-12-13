import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shoptopia/models/product_model.dart';
import 'package:shoptopia/services/get_all_products_service.dart';

part 'get_all_products_state.dart';

class GetAllProductsCubit extends Cubit<GetAllProductsState> {
  GetAllProductsCubit() : super(GetAllProductsInitial());

  getAllProducts() async {
    emit(GetAllProductsLoading());
    try {
      var products = await GetAllProductsService().getAllProducts();
      emit(GetAllProductsLoaded(products: products));
    } catch (e) {
      emit(GetAllProductsError(message: e.toString()));
    }
  }
}
