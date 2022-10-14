part of 'mino_bloc.dart';

@immutable
abstract class MinoEvent extends Equatable {
  // final Mino movingMino;
  //
  // const MinoEvent({required this.movingMino});
  @override
  List<Object?> get props => [runtimeType];
}

class SubscribeMovingMino extends MinoEvent {}

class FallNewMino extends MinoEvent {}

class MoveMinoLeft extends MinoEvent {}

class MoveMinoRight extends MinoEvent {}

class MoveMinoDown extends MinoEvent {}

class RotateMino extends MinoEvent {}