import 'package:tetris/core/domain_object/acc_block.dart';
import 'package:tetris/core/domain_object/mino.dart';
import 'package:tetris/pages/game/data/acc_repo.dart';

class AccumulateService {
  final AccRepo _accRepo;
  Stream get accStream => _accRepo.accBlockStream;

  const AccumulateService({required AccRepo accRepo}) : _accRepo = accRepo;


  AccBlocks addAccBlocks({required Mino mino}) {
    return _accRepo.addBlocks(mino: mino);
  }
}