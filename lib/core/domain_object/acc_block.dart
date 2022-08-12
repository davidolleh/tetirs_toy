import 'package:freezed_annotation/freezed_annotation.dart';

import 'block.dart';

part 'acc_block.freezed.dart';

@freezed
class AccBlocks with _$AccBlocks {
  const AccBlocks._();

  const factory AccBlocks({
    required List<Block> blocks,
  }) = _AccBlocks;

  bool checkRowIsFull({required int row}) {
    List<Block> yBlocks = [];
    for (Block block in blocks) {
      if (block.blockLocation.yLocation == row) {
        yBlocks.add(block);
      }
    }
    int xSum = 0;
    for (Block block in yBlocks) {
      xSum += block.blockLocation.xLocation;
    }
    if (xSum == 55) {
      return true;
    }
    return false;
  }
}