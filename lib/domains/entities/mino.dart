import 'package:flutter/material.dart';
import 'package:tetris/domains/entities/block.dart';
import 'package:tetris/domains/entities/block_location.dart';



enum Rotate {
  rotate0,
  rotate90,
  rotate180,
  rotate270
}

enum Offset {
  offset1,
  offset2,
  offset3,
  offset4,
  offset5
}

Rotate getNextRotate(Rotate rotate) {
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


abstract class Mino {
  final BlockLocation centerLocation;
  final Color color;
  final Rotate rotate;

  Mino({required this.centerLocation, required this.color, required this.rotate});

  List<Block> drawMino();
  int leftMost();
  int rightMost();
  int downMost();

  List<BlockLocation> rotateOffset();

  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation});
}

class IMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: 2, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: 2, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: -2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: -1, yLocation: 1),
      const BlockLocation(xLocation: 1, yLocation: 1),
      const BlockLocation(xLocation: -2, yLocation: 1),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: -2, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
    ],
  };

  IMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );
  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 2;
      case Rotate.rotate180:
        return centerLocation.yLocation;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 2;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 2;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 2), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 2), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 2), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 2), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class OMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: -1, yLocation: 1),
      const BlockLocation(xLocation: -1, yLocation: 1),
      const BlockLocation(xLocation: -1, yLocation: 1),
      const BlockLocation(xLocation: -1, yLocation: 1),
      const BlockLocation(xLocation: -1, yLocation: 1),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
      const BlockLocation(xLocation: 0, yLocation: 1),
    ],
  };

  OMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );

  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation - 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return OMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class JMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: 1, yLocation: 2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: -1, yLocation: 2),
    ],
  };

  JMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );
  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return JMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class LMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: 1, yLocation: 2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: -1, yLocation: 2),
    ],
  };
  LMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );
  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return LMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class SMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: 1, yLocation: 2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: -1, yLocation: 2),
    ],
  };

  SMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );
  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return SMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class ZMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: 1, yLocation: 2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: -1, yLocation: 2),
    ],
  };

  ZMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );
  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1, yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return ZMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class TMino extends Mino {
  static final  Map<Rotate, List<BlockLocation>> offset = {
    Rotate.rotate0 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate90 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: 0),
      const BlockLocation(xLocation: 1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: 1, yLocation: 2),
    ],
    Rotate.rotate180 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: 0, yLocation: 0),
    ],
    Rotate.rotate270 : [
      const BlockLocation(xLocation: 0, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: 0),
      const BlockLocation(xLocation: -1, yLocation: -1),
      const BlockLocation(xLocation: 0, yLocation: 2),
      const BlockLocation(xLocation: -1, yLocation: 2),
    ],
  };

  TMino({
    required BlockLocation centerLocation,
    Rotate? rotate
  }) : super(
      centerLocation: centerLocation,
      color: Colors.lightBlueAccent,
      rotate: rotate ?? Rotate.rotate0
  );

  @override
  int downMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.yLocation;
      case Rotate.rotate90:
        return centerLocation.yLocation - 1;
      case Rotate.rotate180:
        return centerLocation.yLocation - 1;
      case Rotate.rotate270:
        return centerLocation.yLocation - 1;
    }
  }

  @override
  int leftMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation - 1;
      case Rotate.rotate90:
        return centerLocation.xLocation;
      case Rotate.rotate180:
        return centerLocation.xLocation - 1;
      case Rotate.rotate270:
        return centerLocation.xLocation - 1;
    }
  }

  @override
  int rightMost() {
    switch (rotate) {
      case Rotate.rotate0:
        return centerLocation.xLocation + 1;
      case Rotate.rotate90:
        return centerLocation.xLocation + 1;
      case Rotate.rotate180:
        return centerLocation.xLocation + 1;
      case Rotate.rotate270:
        return centerLocation.xLocation;
    }
  }

  @override
  List<Block> drawMino() {
    switch(rotate) {
      case Rotate.rotate0:
        return [
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate90:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
        ];
      case Rotate.rotate180:
        return [
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
        ];
      case Rotate.rotate270:
        return [
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation - 1), color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation - 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.yLocation + 1), color: color),
        ];
    }
  }

  @override
  List<BlockLocation> rotateOffset() {
    Rotate currentRotate = rotate;
    Rotate nextRotate = getNextRotate(rotate);

    List<BlockLocation> currentRotateOffset = offset[currentRotate]!;
    List<BlockLocation> nextRotateOffset = offset[nextRotate]!;

    List<int> indexes = [0 ,1, 2, 3, 4];
    List<BlockLocation> rotateOffsets = [];
    for (int index in indexes) {
      BlockLocation tCurrentRotateOffset = currentRotateOffset[index];
      BlockLocation tNextRotateOffset = nextRotateOffset[index];

      rotateOffsets.add(BlockLocation(xLocation: tCurrentRotateOffset.xLocation - tNextRotateOffset.xLocation, yLocation: tCurrentRotateOffset.yLocation - tNextRotateOffset.yLocation));
    }

    return rotateOffsets;
  }

  @override
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return TMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}