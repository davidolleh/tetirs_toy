import 'package:injectable/injectable.dart';
import 'package:tetris/domains/entities/acc_block.dart';
import 'package:tetris/datas/runtime_game/acc_repo.dart';

@injectable
class AccumulateService {
  final AccRepo _accRepo;
  Stream<AccBlocks> get accStream => _accRepo.accBlockStream;

  const AccumulateService({required AccRepo accRepo}) : _accRepo = accRepo;

  void disposeAccStream() {
    _accRepo.disposeAccStream();
  }
}