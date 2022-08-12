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


//TODO :: change Mino class to abstract class -> how to make abstract class copyWith function
// TODO :: this is VO cannot use setter inside this class
// TODO :: moveLeft, moveRight, moveDown은 스스로 움직이는게 아니라 당하는 것이기에 service단에서 시켜야지
abstract class Mino {
  final Color color;
  final List<Block> blocks;
  final Rotate blockRotate;
  final BlockLocation? rotateCenterLocation;


  // TODO:: kind of getter
  int leastLeftBlockLocation () {
    int least = blocks[0].blockLocation.xLocation;
    for (Block block in blocks) {
      if (block.blockLocation.xLocation < least) {
        least = block.blockLocation.xLocation;
      }
    }
    return least;
  }

  //TODO :: getter의 일종
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

  //TODO :: this is setter
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation});
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation});

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
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Color? color,
    Rotate? blockRotate,
  }) : super(
      color: Colors.lightBlueAccent,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.lightBlueAccent),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.lightBlueAccent),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.lightBlueAccent),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 2, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.lightBlueAccent),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );


  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 2, yLocation: rotateCenterLocation.yLocation + 1), color: color),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 2), color: color),
      ];
    } else if (Rotate.rotate180 == rotate) {

      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation -2, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
      ];
    } else {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 2), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
      ];
    }
  }

  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation}) {
    return IMino(
        blockRotate: blockRotate ?? this.blockRotate,
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blocks: blocks ?? this.blocks
    );
  }
}

class LMino extends Mino {
  LMino({
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.orange,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1), color: Colors.orange),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.orange),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.orange),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.orange),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
      ];
    } else if (Rotate.rotate180 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
      ];
    } else {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
      ];
    }
  }

  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation,BlockLocation? centerBlockLocation}) {
    return LMino(
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blockRotate: blockRotate ?? this.blockRotate,
        blocks: blocks ?? this.blocks
    );
  }
}

class JMino extends Mino {
  JMino({
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.blueAccent,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.blueAccent,),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.blueAccent,),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: Colors.blueAccent,),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation), color: Colors.blueAccent,),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation), color: color),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation - 1), color: color),
      ];
    } else if (Rotate.rotate180 == rotate) {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation), color: color),
      ];
    } else {
      return [
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1), color: color),
        Block(blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation, yLocation: rotateCenterLocation.yLocation + 1), color: color),
      ];
    }
  }

  @override
  Mino copyWith({
    Color? color,
    List<Block>? blocks,
    Rotate? blockRotate,
    BlockLocation? rotateCenterLocation,
    BlockLocation? centerBlockLocation
  }) {
    return JMino(
        blockRotate: blockRotate ?? this.blockRotate,
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blocks: blocks ?? this.blocks
    );
  }
}

class OMino extends Mino {
  OMino({
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.yellow,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(
            blockLocation: rotateCenterLocation,
            color: Colors.yellow
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: Colors.yellow
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: Colors.yellow
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: Colors.yellow
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    return [
      Block(
          blockLocation: rotateCenterLocation,
          color: color
      ),
      Block(
          blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
          color: color
      ),
      Block(
          blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
          color: color
      ),
      Block(
          blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
          color: color
      ),
    ];
  }

  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation,BlockLocation? centerBlockLocation}) {
    return OMino(
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blockRotate: blockRotate ?? this.blockRotate,
        blocks: blocks ?? this.blocks
    );
  }
}

class SMino extends Mino {
  SMino({
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.lightGreen,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: Colors.lightGreen
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: Colors.lightGreen
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: color
        ),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
      ];
    } else if (Rotate.rotate180 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: color
        ),
      ];
    } else {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
      ];
    }
  }

  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation, BlockLocation? centerBlockLocation}) {
    return SMino(
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blockRotate: blockRotate ?? this.blockRotate,
        blocks: blocks ?? this.blocks
    );
  }
}

class TMino extends Mino {
  TMino({
    required BlockLocation rotateCenterLocation,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.purple,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.purple
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: Colors.purple
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
          blockLocation: rotateCenterLocation,
          color: color,
        ),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
      ];
    } else if (Rotate.rotate180 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
      ];
    } else {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
      ];
    }
  }


  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation, BlockLocation? centerBlockLocation}) {
    return TMino(
        blockRotate: blockRotate ?? this.blockRotate,
        rotateCenterLocation: rotateCenterLocation ?? this.rotateCenterLocation!,
        blocks: blocks ?? this.blocks
    );
  }
}

class ZMino extends Mino {
  ZMino({
    required BlockLocation rotateCenterLocation,
    Color? color,
    List<Block>? blocks,
    Rotate? blockRotate,
  }) : super(
      color: Colors.red,
      rotateCenterLocation: rotateCenterLocation,
      blocks: blocks ?? [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.red
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: Colors.red
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: Colors.red
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: Colors.red
        ),
      ],
      blockRotate: blockRotate ?? Rotate.rotate0
  );

  @override
  List<Block> createBlocks({required Rotate rotate, required BlockLocation rotateCenterLocation}) {
    if (Rotate.rotate0 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: color
        ),
      ];
    }
    else if (Rotate.rotate90 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
      ];
    } else if (Rotate.rotate180 == rotate) {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation + 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: color
        ),
      ];
    } else {
      return [
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1, yLocation: rotateCenterLocation.yLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(xLocation: rotateCenterLocation.xLocation - 1),
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation,
            color: color
        ),
        Block(
            blockLocation: rotateCenterLocation.copyWith(yLocation: rotateCenterLocation.yLocation + 1),
            color: color
        ),
      ];
    }
  }


  @override
  Mino copyWith({List<Block>? blocks, Rotate? blockRotate, BlockLocation? rotateCenterLocation, BlockLocation? centerBlockLocation}) {
    return ZMino(
        blockRotate: blockRotate ?? this.blockRotate,
        rotateCenterLocation: centerBlockLocation ?? this.rotateCenterLocation!,
        blocks: blocks ?? this.blocks
    );
  }
}