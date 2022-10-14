import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/di/injectable.dart';
import 'package:tetris/domains/services/accumulation_block_service.dart';
import 'package:tetris/domains/services/move_service.dart';
import 'package:tetris/domains/services/rotate_service.dart';
import 'package:tetris/pages/game/presentation/blocs/acc/acc_bloc.dart';
import 'package:tetris/pages/game/presentation/blocs/mino/mino_bloc.dart';
import 'package:tetris/pages/game/presentation/blocs/score/score_bloc.dart';
import 'package:tetris/pages/game/presentation/widget/widgets.dart';

class GamePage extends StatefulWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ScoreBloc(),),
        BlocProvider(create: (context) => MinoBloc(
            moveService: getIt<MoveService>(),
            rotateService: getIt<RotateService>(),
        ),),
        BlocProvider(create: (context) => AccBloc(accumulateService: getIt<AccumulateService>())),
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
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                context.read<MinoBloc>().add(MoveMinoDown());
                              },
                              child: Container(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              onTap: () {
                                context.read<MinoBloc>().add(MoveMinoLeft());
                              },
                              child: Container(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      )
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
                                context.read<MinoBloc>().add(RotateMino());
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
                                context.read<MinoBloc>().add(MoveMinoRight());
                              },
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}