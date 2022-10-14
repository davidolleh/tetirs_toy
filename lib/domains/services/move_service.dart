import 'package:injectable/injectable.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/mino.dart';
import 'package:tetris/datas/runtime_game/acc_repo.dart';
import 'package:tetris/datas/runtime_game/mino_repo.dart';

@injectable
class MoveService {
  final MinoRepo _minoRepo;
  final AccRepo _accRepo;

  MoveService({
    required MinoRepo minoRepo,
    required AccRepo accRepo
  }) : _minoRepo = minoRepo,
        _accRepo = accRepo;

  Stream<Mino> get movingMino => _minoRepo.movingMino;

  void fallNewMino() {
    _minoRepo.fallNewMino();
  }

  void moveRight() {
    if(_checkCanMoveRight()) {
      _minoRepo.moveMinoRight();
    }
  }

  void moveLeft() {
    if (_checkCanMoveLeft()) {
      _minoRepo.moveMinoLeft();
    }
  }

  void moveDown() {
    if (_checkCanMoveDown()) {
      _minoRepo.moveMinoDown();
    } else {
      _accRepo.addBlock(addedBlocks: _minoRepo.movingMinoValue.drawMino());
      _minoRepo.fallNewMino();
    }
  }

  bool _checkCanMoveRight() {
    Mino movingMino = _minoRepo.movingMinoValue;
    Mino movedMino = movingMino.copyWith(centerLocation: movingMino.centerLocation.copyWith(xLocation: movingMino.centerLocation.xLocation + 1));

    int rightMost = movedMino.rightMost();

    if (rightMost > 10) {
      return false;
    }


    List<BlockLocation> accBlocks = _accRepo.accBlockValue.blocks.map((e) => e.blockLocation).toList();
    List<BlockLocation> movedMinoBlockLocations = movedMino.drawMino().map((e) => e.blockLocation).toList();

    return !movedMinoBlockLocations.any((element) => accBlocks.contains(element));
  }

  bool _checkCanMoveLeft() {
    Mino movingMino = _minoRepo.movingMinoValue;
    Mino movedMino = movingMino.copyWith(centerLocation: movingMino.centerLocation.copyWith(xLocation: movingMino.centerLocation.xLocation - 1));

    int leftMost = movedMino.leftMost();

    if (leftMost < 1) {
      return false;
    }

    List<BlockLocation> accBlocks = _accRepo.accBlockValue.blocks.map((e) => e.blockLocation).toList();
    List<BlockLocation> movedMinoBlockLocations = movedMino.drawMino().map((e) => e.blockLocation).toList();

    return !movedMinoBlockLocations.any((element) => accBlocks.contains(element));
  }

  bool _checkCanMoveDown() {
    Mino movingMino = _minoRepo.movingMinoValue;
    Mino movedMino = movingMino.copyWith(centerLocation: movingMino.centerLocation.copyWith(yLocation: movingMino.centerLocation.yLocation - 1));

    int downMost = movedMino.downMost();

    if (downMost < 1) {
      return false;
    }

    List<BlockLocation> accBlocks = _accRepo.accBlockValue.blocks.map((e) => e.blockLocation).toList();

    List<BlockLocation> movedMinoBlockLocations = movedMino.drawMino().map((e) => e.blockLocation).toList();
    for (BlockLocation movedMinoBlockLocation in movedMinoBlockLocations) {
      if (accBlocks.contains(movedMinoBlockLocation)) {
        return false;
      }
    }
    return true;
  }
}