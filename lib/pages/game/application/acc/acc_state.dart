part of 'acc_cubit.dart';

@immutable
abstract class AccState extends Equatable {
  final AccBlocks accBlocks;

  const AccState({required this.accBlocks});

  @override
  List<Object?> get props => [runtimeType];
}

class AccInitial extends AccState {
  const AccInitial() : super(accBlocks: const AccBlocks(blocks: []));
}

class AccUsing extends AccState {
  const AccUsing({required super.accBlocks});
}

