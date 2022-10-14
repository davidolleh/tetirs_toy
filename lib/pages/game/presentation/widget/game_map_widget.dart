import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/game_map.dart';
import 'package:tetris/pages/game/presentation/blocs/acc/acc_bloc.dart';
import 'package:tetris/pages/game/presentation/blocs/mino/mino_bloc.dart';

class GameMapWidget extends StatefulWidget {
  const GameMapWidget({Key? key}) : super(key: key);

  @override
  State<GameMapWidget> createState() => _GameMapWidgetState();
}

class _GameMapWidgetState extends State<GameMapWidget> {
  final GameMap gameMap = const GameMap();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MinoBloc, MinoState>(
      builder: (context, minoState) {
        return BlocBuilder<AccBloc, AccState>(
          builder: (context, accState) {
            return GridView.builder(
                itemCount: gameMap.maxRowBlock * gameMap.maxColumnBlock,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gameMap.maxRowBlock,
                ),
                itemBuilder: (BuildContext context, int index) {
                  int xLocation = changeIndexToXLocation(index);
                  int yLocation = changeIndexToYLocation(index);

                  if (xLocation == 0 || xLocation == 11 || yLocation == 0 || yLocation == 21) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          border: Border.all(
                            color: Colors.black54,
                          )
                      ),
                    );
                  } else if (minoState.movingMinoLocation.contains(BlockLocation(xLocation: xLocation, yLocation: yLocation))) {
                    return Container(
                      decoration: BoxDecoration(
                          color: minoState.movingMino.color,
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                    );
                  } else if (accState.accBlocksLocation.contains((BlockLocation(xLocation: xLocation, yLocation: yLocation)))) {
                    // TODO:: change this to block color
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.brown,
                          // color: accState.accBlocks..color,
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                    );
                  } else {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                    );
                  }
                }
            );
          },
        );
      },
    );
  }

  int changeIndexToXLocation(int index) {
    return index % gameMap.maxRowBlock;
  }

  int changeIndexToYLocation(int index) {
    return 21 - (index ~/ gameMap.maxRowBlock);
  }
}