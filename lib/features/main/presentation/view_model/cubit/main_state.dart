part of 'main_cubit.dart';

@freezed
abstract class MainState with _$MainState {
   factory MainState.onItemState( int selectedIndex) = _OnItemState;
}
