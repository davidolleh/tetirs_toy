// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tetris/pages/runtime_game/application/mino/mino_cubit.dart';
//
// class GameBoard extends StatelessWidget {
//   const GameBoard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         BlocBuilder<MinoCubit, MinoState>(
//           builder: (context, state) {
//             return GridView.builder(
//                 itemCount: 264,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 12,
//                 ),
//                 itemBuilder: (BuildContext context, int index) {
//                   if (index <= 11 || index % 12 == 0 || (index + 1) % 12 == 0 ||
//                       index >= 252) {
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: Colors.grey,
//                           border: Border.all(
//                             color: Colors.black,
//                           )
//                       ),
//                     );
//                   }
//                   if (index ~/ 12 == state.randomMino.blocks[0].point.y && index % 12 == state.randomMino.blocks[0].point.x){
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: state.randomMino.color,
//                           border: Border.all(
//                             color: Colors.black54,
//                           )
//                       ),
//                     );
//                   }
//                   if (index ~/ 12 == state.randomMino.blocks[1].point.y && index % 12 == state.randomMino.blocks[1].point.x){
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: state.randomMino.color,
//                           border: Border.all(
//                             color: Colors.black54,
//                           )
//                       ),
//                     );
//                   }
//                   if (index ~/ 12 == state.randomMino.blocks[2].point.y && index % 12 == state.randomMino.blocks[2].point.x){
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: state.randomMino.color,
//                           border: Border.all(
//                             color: Colors.black54,
//                           )
//                       ),
//                     );
//                   }
//                   if (index ~/ 12 == state.randomMino.blocks[3].point.y && index % 12 == state.randomMino.blocks[3].point.x){
//                     return Container(
//                       decoration: BoxDecoration(
//                           color: state.randomMino.color,
//                           border: Border.all(
//                             color: Colors.black54,
//                           )
//                       ),
//                     );
//                   }
//
//                   return Container(
//                     decoration: BoxDecoration(
//                         color: Colors.black54,
//                         border: Border.all(
//                           color: Colors.black54,
//                         )
//                     ),
//                   );
//                 }
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/game_map.dart';
import 'package:tetris/pages/game/presentation/bloc/acc/acc_cubit.dart';
import 'package:tetris/pages/game/presentation/bloc/mino/mino_cubit.dart';

class GameMapWidget extends StatefulWidget {
  const GameMapWidget({Key? key}) : super(key: key);

  @override
  State<GameMapWidget> createState() => _GameMapWidgetState();
}

class _GameMapWidgetState extends State<GameMapWidget> {
  final GameMap gameMap = const GameMap();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MinoCubit, MinoState>(
      listener: (context, state) {
        if (state is MinoAccumulation) {
          context.read<AccCubit>().addBlock(mino: state.mino);
          context.read<MinoCubit>().fallNewMino();
        }
      },
      builder: (context, minoState) {
        return BlocBuilder<AccCubit, AccState>(
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
                    // state.mino.blocks.map((e) => {e.blockLocation.xLocation, e.blockLocation.yLocation}) == {xLocation, yLocation}
                  } else if (minoState.mino.blocks.map((e) => e.blockLocation).contains(BlockLocation(xLocation: xLocation, yLocation: yLocation))) {
                    return Container(
                      decoration: BoxDecoration(
                          color: minoState.mino.color,
                          border: Border.all(
                            color: Colors.black,
                          )
                      ),
                    );
                  } else if (accState.accBlocks.blocks.map((e) => e.blockLocation).contains((BlockLocation(xLocation: xLocation, yLocation: yLocation)))) {
                    // int index = accState.accBlocks.blocks.map((e) => e.blockLocation).firstWhere((element) => false);
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