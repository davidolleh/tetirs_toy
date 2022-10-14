// import 'package:tetris/domains/entities/block.dart';
import 'dart:math';

import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/mino.dart';
//
// //TODO :: if we need to request in backend mino repo need to have datasource
import 'package:rxdart/rxdart.dart';

class MinoRepo {
  static final List<Mino> _initialMinos = [
    OMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    IMino(centerLocation : const BlockLocation(xLocation: 5, yLocation: 20)),
    ZMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    SMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    JMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    LMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19)),
    TMino(centerLocation: const BlockLocation(xLocation: 5, yLocation: 19))
  ];

  final BehaviorSubject<Mino> _movingMino = BehaviorSubject.seeded(_initialMinos[Random().nextInt(_initialMinos.length)]);

  Stream<Mino> get movingMino => _movingMino.asBroadcastStream();
  Mino get movingMinoValue => _movingMino.value;


  void moveMinoLeft() {
    final Mino currentMino = _movingMino.value;
    final Mino newMino = currentMino.copyWith(centerLocation: currentMino.centerLocation.copyWith(xLocation: currentMino.centerLocation.xLocation - 1));
    _movingMino.add(newMino);
  }

  void moveMinoRight() {
    final Mino currentMino = _movingMino.value;
    final Mino newMino = currentMino.copyWith(centerLocation: currentMino.centerLocation.copyWith(xLocation: currentMino.centerLocation.xLocation + 1));
    _movingMino.add(newMino);
  }

  void moveMinoDown() {
    final Mino currentMino = _movingMino.value;
    final Mino newMino = currentMino.copyWith(centerLocation: currentMino.centerLocation.copyWith(yLocation: currentMino.centerLocation.yLocation - 1));
    _movingMino.add(newMino);
  }

  void fallNewMino() {
    _movingMino.add(_initialMinos[Random().nextInt(_initialMinos.length)]);
  }

  void rotateMino({required BlockLocation offset}) {
    Mino currentMovingMino = _movingMino.value;
    BlockLocation centerLocation = currentMovingMino.centerLocation;
    BlockLocation changedCenterLocation  = BlockLocation(
        xLocation: centerLocation.xLocation + offset.xLocation,
        yLocation: centerLocation.yLocation + offset.yLocation
    );
    switch (_movingMino.value.rotate) {
      case Rotate.rotate0:
        _movingMino.add(currentMovingMino.copyWith(centerLocation: changedCenterLocation, rotate: Rotate.rotate90));
        break;
      case Rotate.rotate90:
        _movingMino.add(currentMovingMino.copyWith(centerLocation: changedCenterLocation, rotate: Rotate.rotate180));
        break;
      case Rotate.rotate180:
        _movingMino.add(currentMovingMino.copyWith(centerLocation: changedCenterLocation, rotate: Rotate.rotate270));
        break;
      case Rotate.rotate270:
        _movingMino.add(currentMovingMino.copyWith(centerLocation: changedCenterLocation, rotate: Rotate.rotate0));
        break;
    }
  }
}

