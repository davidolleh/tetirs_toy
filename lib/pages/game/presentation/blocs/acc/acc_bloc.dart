import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/domains/entities/acc_block.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/services/service.dart';

part 'acc_event.dart';
part 'acc_state.dart';

class AccBloc extends Bloc<AccEvent, AccState> {
  final AccumulateService _accumulateService;
  AccBloc({required AccumulateService accumulateService}) : _accumulateService = accumulateService, super(AccInitial()) {
    on<SubscribeAccBlocks>(_subscribeAccBlocks);
    add(SubscribeAccBlocks());
  }

  Future<void>  _subscribeAccBlocks(SubscribeAccBlocks event, Emitter<AccState> emit) async {
    await emit.forEach(
      _accumulateService.accStream,
      onData: (AccBlocks accBlocks) => AccUsing(accBlocks: accBlocks)
    );
  }

  @override
  Future<void> close() {
    _accumulateService.disposeAccStream();
    return super.close();
  }
}
