
import 'package:flutter_bloc/flutter_bloc.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit() : super(RootInitial());

  void changeTab(int index) {
    emit(RootTabChanged(index));
  }
}
