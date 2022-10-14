import 'package:injectable/injectable.dart';
import 'package:tetris/datas/runtime_game/repositories.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/mino.dart';

@injectable
class RotateService {
  final MinoRepo _minoRepo;
  final AccRepo _accRepo;

  RotateService({required MinoRepo minoRepo, required AccRepo accRepo}) : _minoRepo = minoRepo, _accRepo = accRepo;

  void rotateMino() {
    BlockLocation? offset = _checkCanRotate();

    if (offset != null) {
      _minoRepo.rotateMino(offset: offset);
    }
  }

  BlockLocation? _checkCanRotate() {
     Mino currentMovingMino = _minoRepo.movingMinoValue;
    BlockLocation centerLocation = currentMovingMino.centerLocation;
    List<BlockLocation> accBlocks = _accRepo.accBlockValue.blocks.map((e) => e.blockLocation).toList();


     List<BlockLocation> minoOffsets = currentMovingMino.rotateOffset();


    int cnt = 0;
     for (BlockLocation offset in minoOffsets) {
       BlockLocation changedCenterLocation  = BlockLocation(
           xLocation: centerLocation.xLocation + offset.xLocation,
           yLocation: centerLocation.yLocation + offset.yLocation
       );

       Mino rotatedMino = currentMovingMino.copyWith(centerLocation: changedCenterLocation, rotate: _nextRotate(currentMovingMino.rotate));

       List<BlockLocation> rotatedMinoBlockLocation = rotatedMino.drawMino().map((e) => e.blockLocation).toList();

       if (rotatedMino.leftMost() >= 1 && rotatedMino.rightMost() <= 10 && rotatedMino.downMost() >= 1) {
         if (!rotatedMinoBlockLocation.any((element) => accBlocks.contains(element))) {
           return offset;
         }
       }
       cnt++;
     }

     return null;
  }

  Rotate _nextRotate(Rotate rotate) {
    switch (rotate) {
      case Rotate.rotate0:
        return Rotate.rotate90;
      case Rotate.rotate90:
        return Rotate.rotate180;
      case Rotate.rotate180:
        return Rotate.rotate270;
      case Rotate.rotate270:
        return Rotate.rotate0;
    }
  }
}