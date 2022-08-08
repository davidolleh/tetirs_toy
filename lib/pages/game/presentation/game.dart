import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/core/domain_object/mino.dart';
import 'package:tetris/pages/game/application/mino/mino_cubit.dart';
import 'package:tetris/pages/game/application/score/score_bloc.dart';
import 'package:tetris/pages/game/presentation/widget/widgets.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final Timer _timer;
  final MinoCubit minoBloc = MinoCubit();

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) {
        minoBloc.moveMinoPosition(buttonType: ButtonType.down);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScoreBloc(),),
        BlocProvider(create: (context) => minoBloc),
      ],
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const ScoreBoard(),
              centerTitle: true,
            ),
            body: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      context.read<MinoCubit>().moveMinoPosition(buttonType: ButtonType.left);
                    },
                    child: Container(
                      color: Colors.red,
                      // height: 100,
                      // width: 100,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.grey,
                      child: const GameMapWidget()
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              context.read<MinoCubit>().rotateMino();
                            },
                            child: Container(
                              color: Colors.yellow,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              context.read<MinoCubit>().moveMinoPosition(buttonType: ButtonType.right);
                            },
                            child: Container(
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    )
                ),
                // Expanded(
                //   flex: 1,
                //   child: GestureDetector(
                //     onTap: () {
                //       context.read<MinoCubit>().moveMinoPosition(buttonType: ButtonType.right);
                //     },
                //     child: Container(
                //       color: Colors.green,
                //     ),
                //   ),
                // )
              ],
            ),
          );
        }
      ),
    );
  }
}
