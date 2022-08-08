import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'score_event.dart';
part 'score_state.dart';

class ScoreBloc extends Bloc<ScoreEvent, ScoreState> {
  ScoreBloc() : super(const ScoreInitial()) {
    on<BlockBreak>(_updateScore);
  }

  Future<void> _updateScore(BlockBreak event, Emitter<ScoreState> emit) async {
    final int currentScore = state.score;
    emit(ScoreUsing(score: currentScore + event.lineCount * 4));
  }
}
