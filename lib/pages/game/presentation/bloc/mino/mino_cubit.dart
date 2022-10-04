import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/mino.dart';
import 'package:tetris/domains/services/move_service.dart';
import 'package:tetris/pages/game/presentation/game.dart';

part 'mino_state.dart';

class MinoCubit extends Cubit<MinoState> {
  final MoveService _moveService;
  final List<Mino> _initialMinos = [
    OMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 20)),
    IMino(rotateCenterLocation : const BlockLocation(xLocation: 5, yLocation: 19)),
    ZMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    SMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    JMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    LMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    TMino(rotateCenterLocation: const BlockLocation(xLocation: 5, yLocation: 19))
  ];
  final _random = Random();


  MinoCubit({required MoveService moveService}) : _moveService = moveService, super(MinoInitial()) {
   fallNewMino();
  }

  void fallNewMino() {
    emit(MinoFallingOff(mino: _initialMinos[_random.nextInt(_initialMinos.length)]));
  }

  void moveMinoPosition({required ButtonType buttonType}) {
    Mino newMino;
    switch(buttonType) {
      case ButtonType.left:
        newMino = _moveService.moveMinoLeft(mino: state.mino);
        break;
      case ButtonType.right:
        newMino = _moveService.moveMinoRight(mino: state.mino);
        break;
      case ButtonType.down:
        newMino = _moveService.moveMinoDown(mino: state.mino);
        break;
    }

    // if (newMino.blocks.map((e) => e.blockLocation.yLocation).contains(1) || ) {
    if (newMino.rotateCenterLocation == state.mino.rotateCenterLocation) {
      emit(MinoAccumulation(mino: newMino));
    }
    emit(MinoFallingOff(mino: newMino));
  }


  void rotateMino() {
    Mino newMino;
    newMino = _moveService.rotateMino(mino: state.mino);
    emit(MinoFallingOff(mino: state.mino));
  }
}
