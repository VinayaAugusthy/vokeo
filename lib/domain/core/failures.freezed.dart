// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ValueFailures {
  dynamic get failedValue => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic failedValue) invalidEmailFailure,
    required TResult Function(dynamic failedValue) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic failedValue)? invalidEmailFailure,
    TResult? Function(dynamic failedValue)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic failedValue)? invalidEmailFailure,
    TResult Function(dynamic failedValue)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_invalidEmailFailure value) invalidEmailFailure,
    required TResult Function(_shortPassword value) shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult? Function(_shortPassword value)? shortPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult Function(_shortPassword value)? shortPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ValueFailuresCopyWith<ValueFailures> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValueFailuresCopyWith<$Res> {
  factory $ValueFailuresCopyWith(
          ValueFailures value, $Res Function(ValueFailures) then) =
      _$ValueFailuresCopyWithImpl<$Res, ValueFailures>;
  @useResult
  $Res call({dynamic failedValue});
}

/// @nodoc
class _$ValueFailuresCopyWithImpl<$Res, $Val extends ValueFailures>
    implements $ValueFailuresCopyWith<$Res> {
  _$ValueFailuresCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: freezed == failedValue
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$invalidEmailFailureImplCopyWith<$Res>
    implements $ValueFailuresCopyWith<$Res> {
  factory _$$invalidEmailFailureImplCopyWith(_$invalidEmailFailureImpl value,
          $Res Function(_$invalidEmailFailureImpl) then) =
      __$$invalidEmailFailureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic failedValue});
}

/// @nodoc
class __$$invalidEmailFailureImplCopyWithImpl<$Res>
    extends _$ValueFailuresCopyWithImpl<$Res, _$invalidEmailFailureImpl>
    implements _$$invalidEmailFailureImplCopyWith<$Res> {
  __$$invalidEmailFailureImplCopyWithImpl(_$invalidEmailFailureImpl _value,
      $Res Function(_$invalidEmailFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$invalidEmailFailureImpl(
      failedValue: freezed == failedValue ? _value.failedValue! : failedValue,
    ));
  }
}

/// @nodoc

class _$invalidEmailFailureImpl implements _invalidEmailFailure {
  const _$invalidEmailFailureImpl({this.failedValue});

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailures.invalidEmailFailure(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$invalidEmailFailureImpl &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$invalidEmailFailureImplCopyWith<_$invalidEmailFailureImpl> get copyWith =>
      __$$invalidEmailFailureImplCopyWithImpl<_$invalidEmailFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic failedValue) invalidEmailFailure,
    required TResult Function(dynamic failedValue) shortPassword,
  }) {
    return invalidEmailFailure(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic failedValue)? invalidEmailFailure,
    TResult? Function(dynamic failedValue)? shortPassword,
  }) {
    return invalidEmailFailure?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic failedValue)? invalidEmailFailure,
    TResult Function(dynamic failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmailFailure != null) {
      return invalidEmailFailure(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_invalidEmailFailure value) invalidEmailFailure,
    required TResult Function(_shortPassword value) shortPassword,
  }) {
    return invalidEmailFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult? Function(_shortPassword value)? shortPassword,
  }) {
    return invalidEmailFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult Function(_shortPassword value)? shortPassword,
    required TResult orElse(),
  }) {
    if (invalidEmailFailure != null) {
      return invalidEmailFailure(this);
    }
    return orElse();
  }
}

abstract class _invalidEmailFailure implements ValueFailures {
  const factory _invalidEmailFailure({final dynamic failedValue}) =
      _$invalidEmailFailureImpl;

  @override
  dynamic get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$invalidEmailFailureImplCopyWith<_$invalidEmailFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$shortPasswordImplCopyWith<$Res>
    implements $ValueFailuresCopyWith<$Res> {
  factory _$$shortPasswordImplCopyWith(
          _$shortPasswordImpl value, $Res Function(_$shortPasswordImpl) then) =
      __$$shortPasswordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic failedValue});
}

/// @nodoc
class __$$shortPasswordImplCopyWithImpl<$Res>
    extends _$ValueFailuresCopyWithImpl<$Res, _$shortPasswordImpl>
    implements _$$shortPasswordImplCopyWith<$Res> {
  __$$shortPasswordImplCopyWithImpl(
      _$shortPasswordImpl _value, $Res Function(_$shortPasswordImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_$shortPasswordImpl(
      failedValue: freezed == failedValue ? _value.failedValue! : failedValue,
    ));
  }
}

/// @nodoc

class _$shortPasswordImpl implements _shortPassword {
  const _$shortPasswordImpl({this.failedValue});

  @override
  final dynamic failedValue;

  @override
  String toString() {
    return 'ValueFailures.shortPassword(failedValue: $failedValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$shortPasswordImpl &&
            const DeepCollectionEquality()
                .equals(other.failedValue, failedValue));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failedValue));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$shortPasswordImplCopyWith<_$shortPasswordImpl> get copyWith =>
      __$$shortPasswordImplCopyWithImpl<_$shortPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic failedValue) invalidEmailFailure,
    required TResult Function(dynamic failedValue) shortPassword,
  }) {
    return shortPassword(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic failedValue)? invalidEmailFailure,
    TResult? Function(dynamic failedValue)? shortPassword,
  }) {
    return shortPassword?.call(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic failedValue)? invalidEmailFailure,
    TResult Function(dynamic failedValue)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_invalidEmailFailure value) invalidEmailFailure,
    required TResult Function(_shortPassword value) shortPassword,
  }) {
    return shortPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult? Function(_shortPassword value)? shortPassword,
  }) {
    return shortPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_invalidEmailFailure value)? invalidEmailFailure,
    TResult Function(_shortPassword value)? shortPassword,
    required TResult orElse(),
  }) {
    if (shortPassword != null) {
      return shortPassword(this);
    }
    return orElse();
  }
}

abstract class _shortPassword implements ValueFailures {
  const factory _shortPassword({final dynamic failedValue}) =
      _$shortPasswordImpl;

  @override
  dynamic get failedValue;
  @override
  @JsonKey(ignore: true)
  _$$shortPasswordImplCopyWith<_$shortPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
