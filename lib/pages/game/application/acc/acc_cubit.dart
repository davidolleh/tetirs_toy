import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:tetris/core/domain_object/acc_block.dart';

part 'acc_state.dart';

class AccCubit extends Cubit<AccState> {
  AccCubit() : super(const AccInitial()) {

  }

  // void addAccBlock() {
  //   _accBlocks.
  // }

  void deleteAccBlocks({required int yLocation}) {
    state.accBlocks.deleteAccBlocks(yLocation: yLocation);
    emit(AccUsing(accBlocks: state.accBlocks));
  }
}
