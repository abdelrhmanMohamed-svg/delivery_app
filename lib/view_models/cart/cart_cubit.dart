import 'package:delivery_app/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int quantity = 1;

  void fetchCartItems() {
    emit(CartLoading());

    Future.delayed(Duration(seconds: 1), () {
      emit(CartLoaded(products: cartList, totalPrice: _getTotalPrice));
    });
  }

  void deleteProduct(String productId) {
    final product = cartList.firstWhere(
      (element) => element.productId == productId,
    );
    final index = cartList.indexOf(product);
    cartList.remove(cartList[index]);
    emit(DeleteProduct());
    emit(CartLoaded(products: cartList, totalPrice: _getTotalPrice));
  }

  void incrementCounter(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }
    quantity++;
    final product = cartList.firstWhere(
      (element) => element.productId == productId,
    );
    final index = cartList.indexOf(product);
    cartList[index] = cartList[index].copyWith(quantity: quantity);

    emit(CounterUpdate(quantity: quantity, productId: productId));
    emit(UpdateTotal(totalPrice: _getTotalPrice));
  }

  void decrementCounter(String productId, [int? initialValue]) {
    if (initialValue != null) {
      quantity = initialValue;
    }
    if (quantity == 1) {
      return;
    }
    quantity--;
    final product = cartList.firstWhere(
      (element) => element.productId == productId,
    );
    final index = cartList.indexOf(product);
    cartList[index] = cartList[index].copyWith(quantity: quantity);

    emit(CounterUpdate(quantity: quantity, productId: productId));
    emit(UpdateTotal(totalPrice: _getTotalPrice));
  }

  double get _getTotalPrice => cartList.fold(
    0,
    (previousValue, element) =>
        previousValue + element.price * element.quantity,
  );
  
}
