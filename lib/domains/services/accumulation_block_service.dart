import 'package:injectable/injectable.dart';
import 'package:tetris/domains/entities/acc_block.dart';
import 'package:tetris/domains/entities/mino.dart';
import 'package:tetris/datas/runtime_game/acc_repo.dart';

@injectable
class AccumulateService {
  final AccRepo _accRepo;
  Stream get accStream => _accRepo.accBlockStream;

  const AccumulateService({required AccRepo accRepo}) : _accRepo = accRepo;


  AccBlocks addAccBlocks({required Mino mino}) {
    return _accRepo.addBlocks(mino: mino);
  }
}