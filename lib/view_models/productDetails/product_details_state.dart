part of 'product_details_cubit.dart';

sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class AddedToCartLoading extends ProductDetailsState {}

final class AddedToCartSuccess extends ProductDetailsState {}
