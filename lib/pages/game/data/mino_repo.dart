import 'package:tetris/core/domain_object/block.dart';
import 'package:tetris/core/domain_object/mino.dart';

//TODO :: if we need to request in backend mino repo need to have datasource
class MinoRepo {
  Mino moveMinoLeft({required Mino mino}) {
    return mino.copyWith(
        blocks: [
          for (Block block in mino.blocks)
            block.copyWith(blockLocation: block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation - 1))
        ],
        rotateCenterLocation: mino.rotateCenterLocation!.copyWith(xLocation: mino.rotateCenterLocation!.xLocation - 1)
    );
  }
  Mino moveMinoRight({required Mino mino}) {
    return mino.copyWith(
      blocks: [
        for (Block block in mino.blocks)
          block.copyWith(blockLocation: block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation + 1))
      ],
      rotateCenterLocation: mino.rotateCenterLocation!.copyWith(xLocation: mino.rotateCenterLocation!.xLocation + 1),
    );
  }

  Mino moveMinoDown({required Mino mino}) {
    return mino.copyWith(
      blocks: [
        for (Block block in mino.blocks)
          block.copyWith(blockLocation: block.blockLocation.copyWith(yLocation: block.blockLocation.yLocation - 1))
      ],
      rotateCenterLocation: mino.rotateCenterLocation!.copyWith(yLocation: mino.rotateCenterLocation!.yLocation - 1),
    );
  }

  Mino changeMinoLocationWhenRotateChange({required Mino mino}) {
    Mino newMino = mino.copyWith(
        rotateCenterLocation: mino.rotateCenterLocation,
        blockRotate: _findNextRotate(currentRotate: mino.blockRotate),
        blocks: mino.createBlocks(rotate: _findNextRotate(currentRotate: mino.blockRotate), rotateCenterLocation: mino.rotateCenterLocation!)
    );
    return newMino;
  }

  Rotate _findNextRotate({required Rotate currentRotate}) {
    switch(currentRotate) {
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

