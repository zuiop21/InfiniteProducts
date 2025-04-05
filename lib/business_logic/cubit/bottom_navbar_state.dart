part of 'bottom_navbar_cubit.dart';

abstract class BottomNavbarState extends Equatable {
  final int currentPage;

  const BottomNavbarState(this.currentPage);

  @override
  List<Object> get props => [currentPage];
}

final class BottomNavbarInitial extends BottomNavbarState {
  const BottomNavbarInitial() : super(0);
}

final class BottomNavbarIndexChanged extends BottomNavbarState {
  const BottomNavbarIndexChanged(super.currentPage);
}
