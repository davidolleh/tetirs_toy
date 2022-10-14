import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tetris/domains/entities/acc_block.dart';
import 'package:tetris/domains/entities/block.dart';

class AccRepo {
  final BehaviorSubject<AccBlocks> _accStream = BehaviorSubject.seeded(const AccBlocks(blocks: []));
  Stream<AccBlocks> get accBlockStream => _accStream.asBroadcastStream();
  AccBlocks get accBlockValue => _accStream.value;

  void disposeAccStream() {
    _accStream.add(const AccBlocks(blocks: []));
  }

  AccBlocks _deleteRows(List<int> rows) {
    List<Block> newBlock = [];
    for (Block block in _accStream.value.blocks) {
      int cnt = 0;
      for (int deleteRow in rows) {
        if (deleteRow < block.blockLocation.yLocation) {
          cnt++;
        }
      }

      if (!rows.contains(block.blockLocation.yLocation)) {
        newBlock.add(block.copyWith(blockLocation: block.blockLocation.copyWith(yLocation: block.blockLocation.yLocation - cnt)));
      }
    }

    return AccBlocks(blocks: newBlock);
  }

  AccBlocks addBlock({required List<Block> addedBlocks}) {

    AccBlocks newAccBlocks = AccBlocks(blocks: [..._accStream.value.blocks, ...addedBlocks]);
    _accStream.add(newAccBlocks);

    final List<int> newRows = [...addedBlocks.map((e) => e.blockLocation.yLocation)];
    final Set<int> checkRows = newRows.toSet();
    final List<int> deleteRows = [];

    for (int row in checkRows) {
      if (_accStream.value.checkRowIsFull(row: row)) {
        deleteRows.add(row);
      }
    }

    if (deleteRows.isNotEmpty) {
      AccBlocks deleteAccBlocks =  _deleteRows(deleteRows);
      _accStream.add(deleteAccBlocks);
      return deleteAccBlocks;
    }
    return newAccBlocks;
  }
}