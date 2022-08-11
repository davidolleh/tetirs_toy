import 'package:tetris/core/domain_object/acc_block.dart';
import 'package:tetris/core/domain_object/block.dart';
import 'package:tetris/core/domain_object/mino.dart';
import 'package:tetris/pages/game/data/acc_repo.dart';
import 'package:tetris/pages/game/data/mino_repo.dart';

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
    return _minoRepo.moveMinoLeft(mino: mino);
  }

  Mino moveMinoRight({required Mino mino}) {
    if (_checkAccBlocksExistInRight(mino: mino, accBlocks: _accRepo.accBlock) ||
        mino.maxRightBlockLocation() >= 10
    ) {
      return mino;
    }
    return _minoRepo.moveMinoRight(mino: mino);
  }

  Mino moveMinoDown({required Mino mino}) {
    if (_checkAccBlocksExistInDown(mino: mino, accBlocks: _accRepo.accBlock) ||
        mino.blocks.map((e) => e.blockLocation.yLocation).contains(1)) {
      return mino;
    }
    return _minoRepo.moveMinoDown(mino: mino);
  }

  Mino rotateMino({required Mino mino}) {
    Mino rotatedMino = _minoRepo.changeMinoLocationWhenRotateChange(mino: mino);

    if (_checkAccBlocksExistInDown(mino: mino, accBlocks: _accRepo.accBlock) ||
        _checkAccBlocksExistInLeft(mino: mino, accBlocks: _accRepo.accBlock) ||
        _checkAccBlocksExistInRight(mino: mino, accBlocks: _accRepo.accBlock)
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