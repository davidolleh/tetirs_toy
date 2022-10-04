// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Block {
  BlockLocation get blockLocation => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockCopyWith<Block> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockCopyWith<$Res> {
  factory $BlockCopyWith(Block value, $Res Function(Block) then) =
      _$BlockCopyWithImpl<$Res>;
  $Res call({BlockLocation blockLocation, Color color});

  $BlockLocationCopyWith<$Res> get blockLocation;
}

/// @nodoc
class _$BlockCopyWithImpl<$Res> implements $BlockCopyWith<$Res> {
  _$BlockCopyWithImpl(this._value, this._then);

  final Block _value;
  // ignore: unused_field
  final $Res Function(Block) _then;

  @override
  $Res call({
    Object? blockLocation = freezed,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      blockLocation: blockLocation == freezed
          ? _value.blockLocation
          : blockLocation // ignore: cast_nullable_to_non_nullable
              as BlockLocation,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }

  @override
  $BlockLocationCopyWith<$Res> get blockLocation {
    return $BlockLocationCopyWith<$Res>(_value.blockLocation, (value) {
      return _then(_value.copyWith(blockLocation: value));
    });
  }
}

/// @nodoc
abstract class _$$_BlockCopyWith<$Res> implements $BlockCopyWith<$Res> {
  factory _$$_BlockCopyWith(_$_Block value, $Res Function(_$_Block) then) =
      __$$_BlockCopyWithImpl<$Res>;
  @override
  $Res call({BlockLocation blockLocation, Color color});

  @override
  $BlockLocationCopyWith<$Res> get blockLocation;
}

/// @nodoc
class __$$_BlockCopyWithImpl<$Res> extends _$BlockCopyWithImpl<$Res>
    implements _$$_BlockCopyWith<$Res> {
  __$$_BlockCopyWithImpl(_$_Block _value, $Res Function(_$_Block) _then)
      : super(_value, (v) => _then(v as _$_Block));

  @override
  _$_Block get _value => super._value as _$_Block;

  @override
  $Res call({
    Object? blockLocation = freezed,
    Object? color = freezed,
  }) {
    return _then(_$_Block(
      blockLocation: blockLocation == freezed
          ? _value.blockLocation
          : blockLocation // ignore: cast_nullable_to_non_nullable
              as BlockLocation,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc

class _$_Block implements _Block {
  const _$_Block({required this.blockLocation, required this.color});

  @override
  final BlockLocation blockLocation;
  @override
  final Color color;

  @override
  String toString() {
    return 'Block(blockLocation: $blockLocation, color: $color)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Block &&
            const DeepCollectionEquality()
                .equals(other.blockLocation, blockLocation) &&
            const DeepCollectionEquality().equals(other.color, color));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(blockLocation),
      const DeepCollectionEquality().hash(color));

  @JsonKey(ignore: true)
  @override
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      __$$_BlockCopyWithImpl<_$_Block>(this, _$identity);
}

abstract class _Block implements Block {
  const factory _Block(
      {required final BlockLocation blockLocation,
      required final Color color}) = _$_Block;

  @override
  BlockLocation get blockLocation;
  @override
  Color get color;
  @override
  @JsonKey(ignore: true)
  _$$_BlockCopyWith<_$_Block> get copyWith =>
      throw _privateConstructorUsedError;
}
