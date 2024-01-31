import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

@freezed
class ValueFailures with _$ValueFailures {
  const factory ValueFailures.invalidEmailFailure({ failedValue}) = _invalidEmailFailure;
  const factory ValueFailures.shortPassword({ failedValue}) = _shortPassword;
}
