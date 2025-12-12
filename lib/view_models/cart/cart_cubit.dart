import 'package:bloc/bloc.dart';
import 'package:delivery_app/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  void fetchCartItems() {
    emit(CartLoading());
    Future.delayed(Duration(seconds: 1), () {
      emit(CartLoaded(cartList));
    });
  }
}
