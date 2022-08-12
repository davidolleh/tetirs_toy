import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/core/domain_object/acc_block.dart';
import 'package:tetris/core/domain_object/mino.dart';
import 'package:tetris/pages/game/application/accumulation_block_service.dart';

part 'acc_state.dart';

class AccCubit extends Cubit<AccState> {
  final AccumulateService _accumulateService;

  AccCubit({required AccumulateService accumulateService}) : _accumulateService = accumulateService, super(const AccInitial()) {
    subscribe();
  }

  // void addAccBlock() {
  //   _accBlocks.
  // }

  void subscribe() {
    _accumulateService.accStream.listen((data) {
      emit(AccUsing(accBlocks: data));
    });
  }

  void addBlock({required Mino mino}) {
    _accumulateService.addAccBlocks(mino: mino);
  }
}
