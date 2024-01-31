import 'dart:core';

import 'package:vokeo/domain/core/failures.dart';
import 'package:dartz/dartz.dart';

Either<ValueFailures, String> validateEmail(String email) {
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(email)) {
    return right(email);
  } else {
    return left(ValueFailures.invalidEmailFailure(failedValue: email));
  }
}
