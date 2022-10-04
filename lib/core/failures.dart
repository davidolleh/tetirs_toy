import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@Freezed()
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.minLength({
    required T failedValue,
    required int min
  }) = MinLength<T>;
  const factory ValueFailure.invalidPhoneNumber({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;
  const factory ValueFailure.invalidNicknm({
    required T failedValue,
  }) = InvalidNicknm<T>;
  const factory ValueFailure.invalidBirthday({
    required T failedValue
  }) = InvalidBirthday<T>;
}