part of 'score_bloc.dart';

@immutable
abstract class ScoreState extends Equatable {
  final int score;

  const ScoreState({
    required this.score
  });

  @override
  List<Object?> get props => [runtimeType, score];
}

class ScoreInitial extends ScoreState {
  const ScoreInitial() : super(score: 0);
}

class ScoreUsing extends ScoreState {
  const ScoreUsing({required super.score});
}
