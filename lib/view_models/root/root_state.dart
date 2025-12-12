part of 'root_cubit.dart';

sealed class RootState {}

final class RootInitial extends RootState {}

final class RootTabChanged extends RootState {
  final int selectedIndex;
  RootTabChanged(this.selectedIndex);
}
