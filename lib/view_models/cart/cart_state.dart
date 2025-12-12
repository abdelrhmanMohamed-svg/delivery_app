part of 'cart_cubit.dart';


sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}
final class CartLoading extends CartState {}
final class CartLoaded extends CartState {
  final List<ProductModel> products;
  const CartLoaded(this.products);
}


