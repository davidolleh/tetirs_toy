part of 'score_bloc.dart';

@immutable
abstract class ScoreEvent extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class BlockBreak extends ScoreEvent {
  final int lineCount;
  BlockBreak({required  this.lineCount});
}