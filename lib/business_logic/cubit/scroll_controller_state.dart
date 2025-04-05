part of 'scroll_controller_cubit.dart';

sealed class ScrollControllerState extends Equatable {
  final double scrollOffset;
  const ScrollControllerState(this.scrollOffset);

  @override
  List<Object> get props => [];
}

final class ScrollControllerInitial extends ScrollControllerState {
  const ScrollControllerInitial() : super(0);
}

final class ScrollControllerValueChanged extends ScrollControllerState {
  const ScrollControllerValueChanged(super.scrollOffset);

  @override
  List<Object> get props => [scrollOffset];
}
