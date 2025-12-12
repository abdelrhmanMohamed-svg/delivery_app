part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<ProductModel> products;
  final double totalPrice;
  const CartLoaded({required this.products, required this.totalPrice});
}

final class DeleteProduct extends CartState {}

final class CounterUpdate extends CartState {
  final int quantity;
  final String productId;
 
  const CounterUpdate({
    required this.quantity,
    required this.productId,
   
  });
 
}
 final class UpdateTotal extends CartState {
  final double totalPrice;
  const UpdateTotal({required this.totalPrice});
}
