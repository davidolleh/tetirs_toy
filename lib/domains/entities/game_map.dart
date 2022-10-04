import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_map.freezed.dart';

@freezed
class GameMap with _$GameMap {
  const factory GameMap({
    @Default(12) int maxRowBlock,
    @Default(22) int maxColumnBlock,
  }) = _GameMap;
}