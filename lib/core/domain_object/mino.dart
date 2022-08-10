import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tetris/core/domain_object/block_location.dart';
import 'block.dart';

enum Rotate {
  rotate0,
  rotate90,
  rotate180,
  rotate270
}

// TODO :: button type 은 여기 있으면 안됨 다른데 있어야 됨

enum ButtonType {
  left,
  right,
  down,
}


//TODO :: change Mino class to abstract class -> how to make abstract class copyWith function
// TODO :: this is VO cannot use setter inside this class
class Mino {
  final Color color;
  List<Block> blocks;
  Rotate blockRotate;
  BlockLocation? rotateCenterLocation;

  int leastLeftBlockLocation () {
    int least = blocks[0].blockLocation.xLocation;
    for (Block block in blocks) {
      if (block.blockLocation.xLocation < least) {
        least = block.blockLocation.xLocation;
      }
    }
    return least;
  }
  int maxRightBlockLocation() {
    int max = blocks[0].blockLocation.xLocation;
    for (Block block in blocks) {
      if (block.blockLocation.xLocation > max) {
        max = block.blockLocation.xLocation;
      }
    }
    return max;
  }

  Mino({
    required this.color,
    required this.blocks,
    required this.blockRotate,
    this.rotateCenterLocation,
  });

  Rotate _changeRotate() {
    switch(blockRotate) {
      case Rotate.rotate0:
        return Rotate.rotate90;
      case Rotate.rotate90:
        return  Rotate.rotate180;
      case Rotate.rotate180:
        return Rotate.rotate270;
      default:
        return blockRotate = Rotate.rotate0;
    }
  }

  Mino changeMinoLocationWhenRotateChange() {}

  Mino moveMinoLeft() {
    return Mino(
        color: color,
        blocks: [
          for (Block block in blocks)
            block.copyWith(blockLocation: block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation - 1))
        ],
        rotateCenterLocation: rotateCenterLocation!.copyWith(xLocation: rotateCenterLocation!.xLocation - 1),
        blockRotate: blockRotate
    );
  }

  Mino moveMinoRight() {
    return Mino(
        color: color,
        blocks: [
          for (Block block in blocks)
            block.copyWith(blockLocation: block.blockLocation.copyWith(xLocation: block.blockLocation.xLocation + 1))
        ],
        rotateCenterLocation: rotateCenterLocation!.copyWith(xLocation: rotateCenterLocation!.xLocation + 1),
        blockRotate: blockRotate
    );
  }

  Mino moveMinoDown() {
    return Mino(
        color: color,
        blocks: [
          for (Block block in blocks)
            block.copyWith(blockLocation: block.blockLocation.copyWith(yLocation: block.blockLocation.yLocation - 1))
        ],
        rotateCenterLocation: rotateCenterLocation!.copyWith(yLocation: rotateCenterLocation!.yLocation - 1),
        blockRotate: blockRotate
    );
  }

  // TODO:: change this to freezed
  Mino copyWith({
    Color? color,
    List<Block>? blocks,
    Rotate? blockRotate,
    BlockLocation? rotateCenterLocation
  }) {
    return Mino(
      color: color ?? this.color,
      blocks: blocks ?? this.blocks,
      blockRotate: blockRotate ?? this.blockRotate,
      rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation
    );
  }

  @override
  bool operator ==(o) =>
      o is Mino &&
      o.blocks.map((e) => e.blockLocation.xLocation) ==
          blocks.map((e) => e.blockLocation.xLocation) &&
      blocks.map((e) => e.blockLocation.yLocation) ==
          blocks.map((e) => e.blockLocation.yLocation);
}

class IMino extends Mino {
  IMino({
    required BlockLocation centerBlockLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.lightBlueAccent,
      rotateCenterLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation, yLocation: centerBlockLocation.yLocation - 1),
      blocks: [
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1),
            color: Colors.lightBlueAccent
        ),
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.lightBlueAccent
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1),
            color: Colors.lightBlueAccent
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 2),
            color: Colors.lightBlueAccent
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  Mino changeMinoLocationWhenRotateChange() {
    List<Block> newBlock = [];
    int index = 0;
    switch (blockRotate) {
      case Rotate.rotate0:
        for (int i = 1; i > -3; i--) {
          newBlock.add(
              blocks[index].copyWith(
                  blockLocation: blocks[index].blockLocation.copyWith(
                      xLocation: rotateCenterLocation!.xLocation + 1,
                      yLocation: rotateCenterLocation!.yLocation + i
                  )
              )
          );
          index++;
        }
        return Mino(color: color, blocks: newBlock, blockRotate: _changeRotate());
      case Rotate.rotate90:
        for (int i = 1; i > -3; i--) {
          newBlock.add(
              blocks[index].copyWith(
                  blockLocation: blocks[index].blockLocation.copyWith(
                      xLocation: rotateCenterLocation!.xLocation + i,
                      yLocation: rotateCenterLocation!.yLocation - 1
                  )
              )
          );
          index++;
        }
        return Mino(color: color, blocks: newBlock, blockRotate: _changeRotate());
      case Rotate.rotate180:
        for (int i = 1; i > -3; i--) {
          newBlock.add(
              blocks[index].copyWith(
                  blockLocation: blocks[index].blockLocation.copyWith(
                      xLocation: rotateCenterLocation!.xLocation - 1,
                      yLocation: rotateCenterLocation!.yLocation - i,
                  )
              )
          );
          index++;
        }
        return Mino(color: color, blocks: newBlock, blockRotate: _changeRotate());
      case Rotate.rotate270:
        for (int i = 1; i > -3; i--) {
          newBlock.add(
              blocks[index].copyWith(
                  blockLocation: blocks[index].blockLocation.copyWith(
                      xLocation: rotateCenterLocation!.xLocation - i,
                      yLocation: rotateCenterLocation!.yLocation + 1,
                  )
              )
          );
          index++;
        }
        return Mino(color: color, blocks: newBlock, blockRotate: _changeRotate());
    }
  }
}

class LMino extends Mino {
  LMino({
    required BlockLocation centerBlockLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.orange,
      rotateCenterLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.xLocation + 1),
      blocks: [
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.orange
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.orange
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.orange
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 2, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.orange
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );


}

class JMino extends Mino {
  JMino({
    required BlockLocation centerBlockLocation,
    // required BlockLocation rotateCenterLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.blueAccent,
      // rotateCenterLocation: rotateCenterLocation,
      rotateCenterLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1),
      blocks: [
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 2, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.blueAccent
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.blueAccent
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.blueAccent
        ),
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.blueAccent
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );
}

class OMino extends Mino {
  OMino({
    required BlockLocation centerBlockLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.yellow,
      blocks: [
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.yellow
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1),
            color: Colors.yellow
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation - 1),
            color: Colors.yellow
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1, yLocation: centerBlockLocation.yLocation - 1),
            color: Colors.yellow
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );
}

class SMino extends Mino {
  SMino({
    required BlockLocation centerBlockLocation,
    // required BlockLocation rotateCenterLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.lightGreen,
      // rotateCenterLocation: rotateCenterLocation,
      rotateCenterLocation: centerBlockLocation,
      blocks: [
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1),
            color: Colors.lightGreen
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );
}

class TMino extends Mino {
  TMino({
    required BlockLocation centerBlockLocation,
    // required BlockLocation rotateCenterLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.purple,
      // rotateCenterLocation: rotateCenterLocation,
      rotateCenterLocation: centerBlockLocation,
      blocks: [
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1, yLocation: centerBlockLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.purple
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );
}

class ZMino extends Mino {
  ZMino({
    required BlockLocation centerBlockLocation,
    // required BlockLocation rotateCenterLocation,
    Rotate? blockRotate,
  }) : super(
      color: Colors.red,
      rotateCenterLocation: centerBlockLocation,
      blocks: [
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation - 1),
            color: Colors.red
        ),
        Block(
            blockLocation: centerBlockLocation,
            color: Colors.red
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(yLocation: centerBlockLocation.yLocation - 1),
            color: Colors.red
        ),
        Block(
            blockLocation: centerBlockLocation.copyWith(xLocation: centerBlockLocation.xLocation + 1, yLocation: centerBlockLocation.yLocation - 1),
            color: Colors.red
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );
}