import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'scroll_controller_state.dart';

class ScrollControllerCubit extends Cubit<ScrollControllerState> {
  ScrollControllerCubit() : super(const ScrollControllerInitial());

  void updateScrollOffset(double offset) {
    emit(ScrollControllerValueChanged(offset));
  }
}
