part of 'mino_cubit.dart';

@immutable
abstract class MinoState extends Equatable {
  final Mino mino;

  const MinoState({required this.mino});

  @override
  List<Object?> get props => [
    runtimeType,
    mino,
  ];
}

class MinoInitial extends MinoState {
  MinoInitial() : super(mino: LMino(centerBlockLocation: const BlockLocation(yLocation: 0, xLocation: 0)));
}

class MinoFallingOff extends MinoState {
  const MinoFallingOff({required super.mino});
}

class MinoAccumulation extends MinoState {
  const MinoAccumulation({required super.mino});
}