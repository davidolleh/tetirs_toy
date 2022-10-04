// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameMap {
  int get maxRowBlock => throw _privateConstructorUsedError;
  int get maxColumnBlock => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameMapCopyWith<GameMap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameMapCopyWith<$Res> {
  factory $GameMapCopyWith(GameMap value, $Res Function(GameMap) then) =
      _$GameMapCopyWithImpl<$Res>;
  $Res call({int maxRowBlock, int maxColumnBlock});
}

/// @nodoc
class _$GameMapCopyWithImpl<$Res> implements $GameMapCopyWith<$Res> {
  _$GameMapCopyWithImpl(this._value, this._then);

  final GameMap _value;
  // ignore: unused_field
  final $Res Function(GameMap) _then;

  @override
  $Res call({
    Object? maxRowBlock = freezed,
    Object? maxColumnBlock = freezed,
  }) {
    return _then(_value.copyWith(
      maxRowBlock: maxRowBlock == freezed
          ? _value.maxRowBlock
          : maxRowBlock // ignore: cast_nullable_to_non_nullable
              as int,
      maxColumnBlock: maxColumnBlock == freezed
          ? _value.maxColumnBlock
          : maxColumnBlock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_GameMapCopyWith<$Res> implements $GameMapCopyWith<$Res> {
  factory _$$_GameMapCopyWith(
          _$_GameMap value, $Res Function(_$_GameMap) then) =
      __$$_GameMapCopyWithImpl<$Res>;
  @override
  $Res call({int maxRowBlock, int maxColumnBlock});
}

/// @nodoc
class __$$_GameMapCopyWithImpl<$Res> extends _$GameMapCopyWithImpl<$Res>
    implements _$$_GameMapCopyWith<$Res> {
  __$$_GameMapCopyWithImpl(_$_GameMap _value, $Res Function(_$_GameMap) _then)
      : super(_value, (v) => _then(v as _$_GameMap));

  @override
  _$_GameMap get _value => super._value as _$_GameMap;

  @override
  $Res call({
    Object? maxRowBlock = freezed,
    Object? maxColumnBlock = freezed,
  }) {
    return _then(_$_GameMap(
      maxRowBlock: maxRowBlock == freezed
          ? _value.maxRowBlock
          : maxRowBlock // ignore: cast_nullable_to_non_nullable
              as int,
      maxColumnBlock: maxColumnBlock == freezed
          ? _value.maxColumnBlock
          : maxColumnBlock // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GameMap implements _GameMap {
  const _$_GameMap({this.maxRowBlock = 12, this.maxColumnBlock = 22});

  @override
  @JsonKey()
  final int maxRowBlock;
  @override
  @JsonKey()
  final int maxColumnBlock;

  @override
  String toString() {
    return 'GameMap(maxRowBlock: $maxRowBlock, maxColumnBlock: $maxColumnBlock)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameMap &&
            const DeepCollectionEquality()
                .equals(other.maxRowBlock, maxRowBlock) &&
            const DeepCollectionEquality()
                .equals(other.maxColumnBlock, maxColumnBlock));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(maxRowBlock),
      const DeepCollectionEquality().hash(maxColumnBlock));

  @JsonKey(ignore: true)
  @override
  _$$_GameMapCopyWith<_$_GameMap> get copyWith =>
      __$$_GameMapCopyWithImpl<_$_GameMap>(this, _$identity);
}

abstract class _GameMap implements GameMap {
  const factory _GameMap({final int maxRowBlock, final int maxColumnBlock}) =
      _$_GameMap;

  @override
  int get maxRowBlock;
  @override
  int get maxColumnBlock;
  @override
  @JsonKey(ignore: true)
  _$$_GameMapCopyWith<_$_GameMap> get copyWith =>
      throw _privateConstructorUsedError;
}
