import 'package:freezed_annotation/freezed_annotation.dart';

import 'block.dart';

part 'acc_block.freezed.dart';

@freezed
class AccBlocks with _$AccBlocks {
  const AccBlocks._();

  const factory AccBlocks({
    required List<Block> blocks,
  }) = _AccBlocks;

  void deleteAccBlocks({required int yLocation}) {
    blocks.removeWhere((block) => block.blockLocation.yLocation == yLocation);
  }
}