part of 'acc_bloc.dart';

@immutable
abstract class AccState extends Equatable {
  final AccBlocks accBlocks;

  List<BlockLocation> get accBlocksLocation => accBlocks.blocks.map((e) => e.blockLocation).toList();

  const AccState({required this.accBlocks});

  @override
  List<Object?> get props => [runtimeType, accBlocks];
}

class AccInitial extends AccState {
  AccInitial() : super(accBlocks: const AccBlocks(blocks: []));
}

class AccUsing extends AccState {
  const AccUsing({required super.accBlocks});
}
