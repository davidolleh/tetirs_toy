part of 'acc_bloc.dart';

@immutable
abstract class AccEvent extends Equatable {
  @override
  List<Object?> get props => [runtimeType];
}

class SubscribeAccBlocks extends AccEvent {}
