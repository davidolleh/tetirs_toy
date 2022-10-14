part of 'mino_bloc.dart';

@immutable
abstract class MinoState extends Equatable {
  final Mino movingMino;

  List<BlockLocation> get movingMinoLocation => movingMino.drawMino().map((e) => e.blockLocation).toList();

  const MinoState({required this.movingMino});
  @override
  List<Object?> get props => [runtimeType, movingMino];
}

class MinoInitial extends MinoState {
  MinoInitial(): super(movingMino: IMino(centerLocation: const BlockLocation(xLocation: 1, yLocation: 2)));
}

class MinoFalling extends MinoState {
  const MinoFalling({required super.movingMino});
}

class MinoFailed extends MinoState {
  const MinoFailed({required super.movingMino});
}


