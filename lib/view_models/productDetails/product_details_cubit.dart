import 'package:delivery_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  void addToCart(ProductModel product) {
    emit(AddedToCartLoading());
    Future.delayed(const Duration(seconds: 1), () {
      cartList.add(product);

      emit(AddedToCartSuccess());
    });
  }
}
