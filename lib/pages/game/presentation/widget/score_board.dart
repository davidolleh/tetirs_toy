import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/pages/game/presentation/blocs/score/score_bloc.dart';

class ScoreBoard extends StatelessWidget {
  const ScoreBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Colors.grey,
          child: const Text('SCORE',
            style: TextStyle(
                color: Colors.white
            ),
            textAlign: TextAlign.end,
          ),
        ),
        BlocBuilder<ScoreBloc, ScoreState>(
          builder: (context, state) {
            return Container(
              color: Colors.black,
              child: Text(state.score.toString(),
                style: const TextStyle(
                    color: Colors.white
                ),
                textAlign: TextAlign.end,
              ),
            );
          },
        )
      ],
    );
  }
}
