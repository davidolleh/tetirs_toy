// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'block_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BlockLocation {
  int get xLocation => throw _privateConstructorUsedError;
  int get yLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BlockLocationCopyWith<BlockLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockLocationCopyWith<$Res> {
  factory $BlockLocationCopyWith(
          BlockLocation value, $Res Function(BlockLocation) then) =
      _$BlockLocationCopyWithImpl<$Res>;
  $Res call({int xLocation, int yLocation});
}

/// @nodoc
class _$BlockLocationCopyWithImpl<$Res>
    implements $BlockLocationCopyWith<$Res> {
  _$BlockLocationCopyWithImpl(this._value, this._then);

  final BlockLocation _value;
  // ignore: unused_field
  final $Res Function(BlockLocation) _then;

  @override
  $Res call({
    Object? xLocation = freezed,
    Object? yLocation = freezed,
  }) {
    return _then(_value.copyWith(
      xLocation: xLocation == freezed
          ? _value.xLocation
          : xLocation // ignore: cast_nullable_to_non_nullable
              as int,
      yLocation: yLocation == freezed
          ? _value.yLocation
          : yLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_BlockLocationCopyWith<$Res>
    implements $BlockLocationCopyWith<$Res> {
  factory _$$_BlockLocationCopyWith(
          _$_BlockLocation value, $Res Function(_$_BlockLocation) then) =
      __$$_BlockLocationCopyWithImpl<$Res>;
  @override
  $Res call({int xLocation, int yLocation});
}

/// @nodoc
class __$$_BlockLocationCopyWithImpl<$Res>
    extends _$BlockLocationCopyWithImpl<$Res>
    implements _$$_BlockLocationCopyWith<$Res> {
  __$$_BlockLocationCopyWithImpl(
      _$_BlockLocation _value, $Res Function(_$_BlockLocation) _then)
      : super(_value, (v) => _then(v as _$_BlockLocation));

  @override
  _$_BlockLocation get _value => super._value as _$_BlockLocation;

  @override
  $Res call({
    Object? xLocation = freezed,
    Object? yLocation = freezed,
  }) {
    return _then(_$_BlockLocation(
      xLocation: xLocation == freezed
          ? _value.xLocation
          : xLocation // ignore: cast_nullable_to_non_nullable
              as int,
      yLocation: yLocation == freezed
          ? _value.yLocation
          : yLocation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_BlockLocation extends _BlockLocation {
  const _$_BlockLocation({required this.xLocation, required this.yLocation})
      : super._();

  @override
  final int xLocation;
  @override
  final int yLocation;

  @override
  String toString() {
    return 'BlockLocation(xLocation: $xLocation, yLocation: $yLocation)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BlockLocation &&
            const DeepCollectionEquality().equals(other.xLocation, xLocation) &&
            const DeepCollectionEquality().equals(other.yLocation, yLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(xLocation),
      const DeepCollectionEquality().hash(yLocation));

  @JsonKey(ignore: true)
  @override
  _$$_BlockLocationCopyWith<_$_BlockLocation> get copyWith =>
      __$$_BlockLocationCopyWithImpl<_$_BlockLocation>(this, _$identity);
}

abstract class _BlockLocation extends BlockLocation {
  const factory _BlockLocation(
      {required final int xLocation,
      required final int yLocation}) = _$_BlockLocation;
  const _BlockLocation._() : super._();

  @override
  int get xLocation;
  @override
  int get yLocation;
  @override
  @JsonKey(ignore: true)
  _$$_BlockLocationCopyWith<_$_BlockLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
