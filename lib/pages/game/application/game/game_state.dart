part of 'game_bloc.dart';

@immutable
abstract class GameState extends Equatable {

  @override
  List<Object?> get props => [];
}

class GameInitial extends GameState {

}
