import 'package:injectable/injectable.dart';
import 'package:tetris/domains/entities/acc_block.dart';
import 'package:tetris/domains/entities/block.dart';
import 'package:tetris/domains/entities/mino.dart';
import 'package:tetris/datas/runtime_game/acc_repo.dart';
import 'package:tetris/datas/runtime_game/mino_repo.dart';

@injectable
class MoveService {
  final MinoRepo _minoRepo;
  final AccRepo _accRepo;

  const MoveService({required MinoRepo minoRepo, required AccRepo accRepo})
      : _minoRepo = minoRepo, _accRepo = accRepo;

  Mino moveMinoLeft({required Mino mino}) {
    if (
    _checkAccBlocksExistInLeft(mino: mino, accBlocks: _accRepo.accBlock) ||
        mino.leastLeftBlockLocation() <= 1
    ) {
      return mino;
    }


    Mino newMino = _minoRepo.moveMinoLeft(mino: mino);

    print(newMino.rotateCenterLocation!);

    return newMino;
  }

  Mino moveMinoRight({required Mino mino}) {
    if (_checkAccBlocksExistInRight(mino: mino, accBlocks: _accRepo.accBlock) ||
        mino.maxRightBlockLocation() >= 10
    ) {
      return mino;
    }

    Mino newMino = _minoRepo.moveMinoRight(mino: mino);


    return newMino;
  }

  Mino moveMinoDown({required Mino mino}) {
    if (_checkAccBlocksExistInDown(mino: mino, accBlocks: _accRepo.accBlock) ||
        mino.blocks.map((e) => e.blockLocation.yLocation).contains(1)) {
      return mino;
    }
    Mino newMino =  _minoRepo.moveMinoDown(mino: mino);

    return newMino;
  }

  Mino rotateMino({required Mino mino}) {
    Mino rotatedMino = _minoRepo.changeMinoLocationWhenRotateChange(mino: mino);
    if (_checkAccBlocksExistInDown(mino: rotatedMino, accBlocks: _accRepo.accBlock) ||
        _checkAccBlocksExistInLeft(mino: rotatedMino, accBlocks: _accRepo.accBlock) ||
        _checkAccBlocksExistInRight(mino: rotatedMino, accBlocks: _accRepo.accBlock) ||
        rotatedMino.blocks.map((e) => e.blockLocation.yLocation).any((e) => e <= 1)||
        rotatedMino.maxRightBlockLocation() >= 10 ||
        rotatedMino.leastLeftBlockLocation() <= 1
    ) {
      return mino;
    }
    return rotatedMino;
  }


  bool minoCantMoveDown({required Mino mino}) {
    return _checkAccBlocksExistInDown(mino: mino, accBlocks: _accRepo.accBlock) || mino.blocks.map((e) => e.blockLocation.yLocation).contains(1);
  }

  bool _checkAccBlocksExistInLeft({required Mino mino, required AccBlocks accBlocks}) {
    for (Block block in mino.blocks) {
      if (accBlocks.blocks.map((e) => e.blockLocation).contains(block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation - 1))) {
        return true;
      }
    }
    return false;
  }

  bool _checkAccBlocksExistInRight({required Mino mino, required AccBlocks accBlocks}) {
    for (Block block in mino.blocks) {
      if (accBlocks.blocks.map((e) => e.blockLocation).contains(block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation + 1))) {
        return true;
      }
    }
    return false;
  }

  bool _checkAccBlocksExistInDown({required Mino mino, required AccBlocks accBlocks}) {
    for (Block block in mino.blocks) {
      if (accBlocks.blocks.map((e) => e.blockLocation).contains(block.blockLocation.copyWith(yLocation: block.blockLocation.yLocation - 1))) {
        return true;
      }
    }
    return false;
  }
}