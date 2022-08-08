import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/core/domain_object/block_location.dart';
import 'package:tetris/core/domain_object/mino.dart';

part 'mino_state.dart';

class MinoCubit extends Cubit<MinoState> {
  final List<Mino> _initialMinos = [
    OMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 1)),
    IMino(centerBlockLocation : const BlockLocation(xLocation: 5, yLocation: 20)),
    ZMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 1)),
    SMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 2)),
    JMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 1)),
    LMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 2)),
    TMino(centerBlockLocation: const BlockLocation(xLocation: 5, yLocation: 1))
  ];
  final _random = Random();
  // final _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //   state.
  // });

  MinoCubit() : super(MinoInitial()) {
   fallNewMino();
  }

  void fallNewMino() {
    emit(MinoFallingOff(mino: IMino(centerBlockLocation : const BlockLocation(xLocation: 5, yLocation: 20)),));
    // print(state.mino.blocks.map((e) => e.blockLocation.yLocation));
    // state.mino.moveMinoDown();
    // emit(MinoFallingOff(mino: state.mino));
    // print(state.mino.blocks.map((e) => e.blockLocation.yLocation));



    // Timer.periodic(Duration(seconds: 1), (timer) {
    //   state.mino.moveMinoDown();
    //   emit(MinoFallingOff(mino: state.mino));
    // });

  }

  void moveMinoPosition({required ButtonType buttonType}) {
    if (buttonType == ButtonType.left && state.mino.leastLeftBlockLocation() <= 1) {
      return;
    }
    if (buttonType == ButtonType.right && state.mino.maxRightBlockLocation() >= 10) {
      return;
    }



    switch(buttonType) {
      case ButtonType.left:
        state.mino.moveMinoLeft();
        break;
      case ButtonType.right:
        state.mino.moveMinoRight();
        break;
      case ButtonType.down:
        state.mino.moveMinoDown();
        break;
    }
    emit(MinoFallingOff(mino: state.mino));
  }


  void rotateMino() {
    state.mino.changeRotate();
    emit(MinoFallingOff(mino: state.mino));
  }
}
