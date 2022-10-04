import 'package:dartz/dartz.dart';
import 'package:tetris/core/failures.dart';

Either<ValueFailure<String>, String> validateNicknm(String input, int maxLength, int minLength) {
  const nicknmRegex = r'^([a-z0-9]|[\uac00-\ud7a3])*$';
  bool hasMatchEmailRegex = RegExp(nicknmRegex).hasMatch(input);

  if (hasMatchEmailRegex && input.length <= maxLength && input.length >= minLength) {
    return right(input);
  } else if (hasMatchEmailRegex == false) {
    return left(ValueFailure.invalidNicknm(failedValue: input));
  } else if (input.length > maxLength) {
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  } else if (input.length < minLength) {
    return left(ValueFailure.minLength(failedValue: input, min: minLength));
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String input, int maxLength) {
  //TODO :: 폰번호 regex 적용
  const phoneNumberRegex = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  bool hasMatchEmailRegex = RegExp(phoneNumberRegex).hasMatch(input);

  if (hasMatchEmailRegex && input.length == maxLength) {
    return right(input);
  } else if (hasMatchEmailRegex == false) {
    return left(ValueFailure.invalidNicknm(failedValue: input));
  } else if (input.length > maxLength) {
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  } else {
    return left(ValueFailure.minLength(failedValue: input, min: maxLength));
  }
}

Either<ValueFailure<String>, String> validateBirthday(String input) {
  // const phoneNumberRegex = r'[^0-9]';
  // bool hasMatchEmailRegex = RegExp(phoneNumberRegex).hasMatch(input);


  // if (_checkBirthdayPolicy(input: input) && input.length <= maxLength) {
  //   return right(input);
  // } else if (hasMatchEmailRegex == false) {
  //   return left(ValueFailure.invalidNicknm(failedValue: input));
  // } else if (input.length > maxLength) {
  //   return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  // } else {
  //   return left(ValueFailure.empty(failedValue: input));
  // }

  if (_checkBirthdayPolicy(input: input)) {
    return right(input);
  }

  return left(ValueFailure.invalidBirthday(failedValue: input));
}

bool _checkBirthdayPolicy({required String input}) {
  int year = int.parse(input.substring(0, 3));
  int month = int.parse(input.substring(4, 5));
  int date = int.parse(input.substring(6, 7));

  return year >= 1900 && year <= 2022 && month >= 1 && month <= 12 && date >=1 && date <= 31;
}

Either<ValueFailure<String>, String> validatePostingContent(String input, int maxLength) {
  if (input.length <= maxLength && input.isNotEmpty) {
    return right(input);
  } else if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}
Either<ValueFailure<String>, String> validateMaxStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}