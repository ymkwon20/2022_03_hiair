// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'safety_check_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SafetyCheckSaveEventTearOff {
  const _$SafetyCheckSaveEventTearOff();

  _SaveChecks saveChecks(String date) {
    return _SaveChecks(
      date,
    );
  }
}

/// @nodoc
const $SafetyCheckSaveEvent = _$SafetyCheckSaveEventTearOff();

/// @nodoc
mixin _$SafetyCheckSaveEvent {
  String get date => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) saveChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date)? saveChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? saveChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveChecks value) saveChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveChecks value)? saveChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveChecks value)? saveChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SafetyCheckSaveEventCopyWith<SafetyCheckSaveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyCheckSaveEventCopyWith<$Res> {
  factory $SafetyCheckSaveEventCopyWith(SafetyCheckSaveEvent value,
          $Res Function(SafetyCheckSaveEvent) then) =
      _$SafetyCheckSaveEventCopyWithImpl<$Res>;
  $Res call({String date});
}

/// @nodoc
class _$SafetyCheckSaveEventCopyWithImpl<$Res>
    implements $SafetyCheckSaveEventCopyWith<$Res> {
  _$SafetyCheckSaveEventCopyWithImpl(this._value, this._then);

  final SafetyCheckSaveEvent _value;
  // ignore: unused_field
  final $Res Function(SafetyCheckSaveEvent) _then;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SaveChecksCopyWith<$Res>
    implements $SafetyCheckSaveEventCopyWith<$Res> {
  factory _$SaveChecksCopyWith(
          _SaveChecks value, $Res Function(_SaveChecks) then) =
      __$SaveChecksCopyWithImpl<$Res>;
  @override
  $Res call({String date});
}

/// @nodoc
class __$SaveChecksCopyWithImpl<$Res>
    extends _$SafetyCheckSaveEventCopyWithImpl<$Res>
    implements _$SaveChecksCopyWith<$Res> {
  __$SaveChecksCopyWithImpl(
      _SaveChecks _value, $Res Function(_SaveChecks) _then)
      : super(_value, (v) => _then(v as _SaveChecks));

  @override
  _SaveChecks get _value => super._value as _SaveChecks;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_SaveChecks(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveChecks extends _SaveChecks {
  const _$_SaveChecks(this.date) : super._();

  @override
  final String date;

  @override
  String toString() {
    return 'SafetyCheckSaveEvent.saveChecks(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveChecks &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$SaveChecksCopyWith<_SaveChecks> get copyWith =>
      __$SaveChecksCopyWithImpl<_SaveChecks>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String date) saveChecks,
  }) {
    return saveChecks(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String date)? saveChecks,
  }) {
    return saveChecks?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String date)? saveChecks,
    required TResult orElse(),
  }) {
    if (saveChecks != null) {
      return saveChecks(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveChecks value) saveChecks,
  }) {
    return saveChecks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveChecks value)? saveChecks,
  }) {
    return saveChecks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveChecks value)? saveChecks,
    required TResult orElse(),
  }) {
    if (saveChecks != null) {
      return saveChecks(this);
    }
    return orElse();
  }
}

abstract class _SaveChecks extends SafetyCheckSaveEvent {
  const factory _SaveChecks(String date) = _$_SaveChecks;
  const _SaveChecks._() : super._();

  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$SaveChecksCopyWith<_SaveChecks> get copyWith =>
      throw _privateConstructorUsedError;
}
