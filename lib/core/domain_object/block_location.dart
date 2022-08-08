import 'package:freezed_annotation/freezed_annotation.dart';

part 'block_location.freezed.dart';

@freezed
class BlockLocation with _$BlockLocation {
  const BlockLocation._();

  const factory BlockLocation({
    required int xLocation,
    required int yLocation,
  }) = _BlockLocation;
}