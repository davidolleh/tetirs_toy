import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tetris/core/domain_object/acc_block.dart';
import 'package:tetris/core/domain_object/block.dart';
import 'package:tetris/core/domain_object/mino.dart';

class AccRepo {
  final BehaviorSubject<AccBlocks> _accStream = BehaviorSubject.seeded(const AccBlocks(blocks: []));

  Stream get accBlockStream => _accStream.asBroadcastStream();
  AccBlocks get accBlock => _accStream.value;

  AccBlocks addBlocks({required Mino mino}) {
    AccBlocks newAccBlocks = AccBlocks(blocks: [..._accStream.value.blocks, ...mino.blocks]);

    _accStream.add(newAccBlocks);


    newAccBlocks = _deleteRows(rows: mino.blocks.map((block) => block.blockLocation.yLocation).toList());

    _accStream.add(newAccBlocks);
    //
    return newAccBlocks;
  }


  bool _checkRowIsFull({required int row}) {
    return _accStream.value.checkRowIsFull(row: row);
  }

  AccBlocks _deleteRows({required List<int> rows}) {

    List<int> fullRows = [];
    for (int row in rows) {
      if(_checkRowIsFull(row: row)) {
        fullRows.add(row);
      }
    }

    List<Block> newBlocks = [];

    AccBlocks newAccBlocks;
    for (Block block in _accStream.value.blocks) {
      var cnt = 0;
      if (!fullRows.contains(block.blockLocation.yLocation)) {
        for (int row in fullRows) {
          if (block.blockLocation.yLocation > row) {
            cnt++;
          }
        }
        newBlocks.add(block.copyWith(blockLocation: block.blockLocation.copyWith(yLocation: block.blockLocation.yLocation - cnt)));
      }
    }
    newAccBlocks = AccBlocks(blocks: newBlocks);

    return newAccBlocks;
  }
}