// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'acc_block.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccBlocks {
  List<Block> get blocks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccBlocksCopyWith<AccBlocks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccBlocksCopyWith<$Res> {
  factory $AccBlocksCopyWith(AccBlocks value, $Res Function(AccBlocks) then) =
      _$AccBlocksCopyWithImpl<$Res>;
  $Res call({List<Block> blocks});
}

/// @nodoc
class _$AccBlocksCopyWithImpl<$Res> implements $AccBlocksCopyWith<$Res> {
  _$AccBlocksCopyWithImpl(this._value, this._then);

  final AccBlocks _value;
  // ignore: unused_field
  final $Res Function(AccBlocks) _then;

  @override
  $Res call({
    Object? blocks = freezed,
  }) {
    return _then(_value.copyWith(
      blocks: blocks == freezed
          ? _value.blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ));
  }
}

/// @nodoc
abstract class _$$_AccBlocksCopyWith<$Res> implements $AccBlocksCopyWith<$Res> {
  factory _$$_AccBlocksCopyWith(
          _$_AccBlocks value, $Res Function(_$_AccBlocks) then) =
      __$$_AccBlocksCopyWithImpl<$Res>;
  @override
  $Res call({List<Block> blocks});
}

/// @nodoc
class __$$_AccBlocksCopyWithImpl<$Res> extends _$AccBlocksCopyWithImpl<$Res>
    implements _$$_AccBlocksCopyWith<$Res> {
  __$$_AccBlocksCopyWithImpl(
      _$_AccBlocks _value, $Res Function(_$_AccBlocks) _then)
      : super(_value, (v) => _then(v as _$_AccBlocks));

  @override
  _$_AccBlocks get _value => super._value as _$_AccBlocks;

  @override
  $Res call({
    Object? blocks = freezed,
  }) {
    return _then(_$_AccBlocks(
      blocks: blocks == freezed
          ? _value._blocks
          : blocks // ignore: cast_nullable_to_non_nullable
              as List<Block>,
    ));
  }
}

/// @nodoc

class _$_AccBlocks extends _AccBlocks {
  const _$_AccBlocks({required final List<Block> blocks})
      : _blocks = blocks,
        super._();

  final List<Block> _blocks;
  @override
  List<Block> get blocks {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_blocks);
  }

  @override
  String toString() {
    return 'AccBlocks(blocks: $blocks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccBlocks &&
            const DeepCollectionEquality().equals(other._blocks, _blocks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_blocks));

  @JsonKey(ignore: true)
  @override
  _$$_AccBlocksCopyWith<_$_AccBlocks> get copyWith =>
      __$$_AccBlocksCopyWithImpl<_$_AccBlocks>(this, _$identity);
}

abstract class _AccBlocks extends AccBlocks {
  const factory _AccBlocks({required final List<Block> blocks}) = _$_AccBlocks;
  const _AccBlocks._() : super._();

  @override
  List<Block> get blocks;
  @override
  @JsonKey(ignore: true)
  _$$_AccBlocksCopyWith<_$_AccBlocks> get copyWith =>
      throw _privateConstructorUsedError;
}
