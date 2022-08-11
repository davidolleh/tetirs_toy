import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:tetris/core/domain_object/acc_block.dart';
import 'package:tetris/core/domain_object/mino.dart';

class AccRepo {
  final BehaviorSubject<AccBlocks> _accStream = BehaviorSubject.seeded(AccBlocks(blocks: []));

  Stream get accBlockStream => _accStream.asBroadcastStream();
  AccBlocks get accBlock => _accStream.value;

  AccBlocks addBlocks({required Mino mino}) {
    print('no!');
    AccBlocks addedAccBlocks = AccBlocks(blocks: [..._accStream.value.blocks, ...mino.blocks]);

    print('add!');
    _accStream.add(addedAccBlocks);
    print('added');
    return addedAccBlocks;
  }
}