import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tetris/domains/entities/block.dart';
import 'package:tetris/domains/entities/block_location.dart';



enum Rotate {
  rotate0,
  rotate90,
  rotate180,
  rotate270
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

  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation});
}

class IMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class OMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class JMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class LMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class SMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class ZMino extends Mino {
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}

class TMino extends Mino {
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
          Block(blockLocation: centerLocation.copyWith(xLocation: centerLocation.xLocation + 1), color: color),
          Block(blockLocation: centerLocation, color: color),
          Block(blockLocation: centerLocation.copyWith(yLocation: centerLocation.xLocation - 1), color: color),
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
  Mino copyWith({Rotate? rotate, BlockLocation? centerLocation}) {
    return IMino(
        centerLocation: centerLocation ?? this.centerLocation,
        rotate: rotate ?? this.rotate
    );
  }
}