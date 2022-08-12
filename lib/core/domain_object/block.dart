import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tetris/core/domain_object/block_location.dart';

part 'block.freezed.dart';

@freezed
class Block with _$Block {
  const factory Block({
    required BlockLocation blockLocation,
    required Color color,
  }) = _Block;
}