import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/domains/entities/block_location.dart';
import 'package:tetris/domains/entities/mino.dart';
import 'package:tetris/domains/services/service.dart';

part 'mino_event.dart';
part 'mino_state.dart';

class MinoBloc extends Bloc<MinoEvent, MinoState> {
  final MoveService _moveService;
  final RotateService _rotateService;
  late final Timer _timer;

  MinoBloc({
    required MoveService moveService,
    required RotateService rotateService
  }) : _moveService = moveService,
        _rotateService = rotateService,
        super(MinoInitial()) {
    on<SubscribeMovingMino>(_subscribeMovingMino);
    on<MoveMinoLeft>(_moveMinoLeft);
    on<MoveMinoRight>(_moveMinoRight);
    on<MoveMinoDown>(_moveMinoDown);
    on<RotateMino>(_rotateMino);

    add(SubscribeMovingMino());
  }
  Future<void> _subscribeMovingMino(SubscribeMovingMino event, Emitter<MinoState> emit) async {
    _timer = Timer.periodic(
        const Duration(seconds: 1), (timer) {
      add(MoveMinoDown());
    });

    await emit.forEach(
        _moveService.movingMino,
        onData: (Mino movingMino) => MinoFalling(movingMino: movingMino),
        onError: (e, s) => MinoFailed(movingMino: state.movingMino)
    );
  }

  void _fallNewMino(FallNewMino event, Emitter<MinoState> emit) {
    _moveService.moveLeft();
  }

  void _moveMinoLeft(MoveMinoLeft event, Emitter<MinoState> emit) {
    _moveService.moveLeft();
  }
  void _moveMinoRight(MoveMinoRight event, Emitter<MinoState> emit) {
    _moveService.moveRight();
  }
  void _moveMinoDown(MoveMinoDown event, Emitter<MinoState> emit) {
    _moveService.moveDown();
  }

  void _rotateMino(RotateMino event, Emitter<MinoState> emit) {
    _rotateService.rotateMino();
  }

  @override
  Future<void> close() {
    _timer.cancel();
    _moveService.fallNewMino();
    return super.close();
  }
}