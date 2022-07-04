// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'safety_check_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SafetyCheckEventTearOff {
  const _$SafetyCheckEventTearOff();

  _FetchSafetyChecks fetchSafetyChecks(String code, String type, String date) {
    return _FetchSafetyChecks(
      code,
      type,
      date,
    );
  }
}

/// @nodoc
const $SafetyCheckEvent = _$SafetyCheckEventTearOff();

/// @nodoc
mixin _$SafetyCheckEvent {
  String get code => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get date => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, String type, String date)
        fetchSafetyChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String code, String type, String date)? fetchSafetyChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, String type, String date)? fetchSafetyChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSafetyChecks value) fetchSafetyChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchSafetyChecks value)? fetchSafetyChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSafetyChecks value)? fetchSafetyChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SafetyCheckEventCopyWith<SafetyCheckEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyCheckEventCopyWith<$Res> {
  factory $SafetyCheckEventCopyWith(
          SafetyCheckEvent value, $Res Function(SafetyCheckEvent) then) =
      _$SafetyCheckEventCopyWithImpl<$Res>;
  $Res call({String code, String type, String date});
}

/// @nodoc
class _$SafetyCheckEventCopyWithImpl<$Res>
    implements $SafetyCheckEventCopyWith<$Res> {
  _$SafetyCheckEventCopyWithImpl(this._value, this._then);

  final SafetyCheckEvent _value;
  // ignore: unused_field
  final $Res Function(SafetyCheckEvent) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? type = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date: date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FetchSafetyChecksCopyWith<$Res>
    implements $SafetyCheckEventCopyWith<$Res> {
  factory _$FetchSafetyChecksCopyWith(
          _FetchSafetyChecks value, $Res Function(_FetchSafetyChecks) then) =
      __$FetchSafetyChecksCopyWithImpl<$Res>;
  @override
  $Res call({String code, String type, String date});
}

/// @nodoc
class __$FetchSafetyChecksCopyWithImpl<$Res>
    extends _$SafetyCheckEventCopyWithImpl<$Res>
    implements _$FetchSafetyChecksCopyWith<$Res> {
  __$FetchSafetyChecksCopyWithImpl(
      _FetchSafetyChecks _value, $Res Function(_FetchSafetyChecks) _then)
      : super(_value, (v) => _then(v as _FetchSafetyChecks));

  @override
  _FetchSafetyChecks get _value => super._value as _FetchSafetyChecks;

  @override
  $Res call({
    Object? code = freezed,
    Object? type = freezed,
    Object? date = freezed,
  }) {
    return _then(_FetchSafetyChecks(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchSafetyChecks extends _FetchSafetyChecks {
  const _$_FetchSafetyChecks(this.code, this.type, this.date) : super._();

  @override
  final String code;
  @override
  final String type;
  @override
  final String date;

  @override
  String toString() {
    return 'SafetyCheckEvent.fetchSafetyChecks(code: $code, type: $type, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchSafetyChecks &&
            const DeepCollectionEquality().equals(other.code, code) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(code),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$FetchSafetyChecksCopyWith<_FetchSafetyChecks> get copyWith =>
      __$FetchSafetyChecksCopyWithImpl<_FetchSafetyChecks>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code, String type, String date)
        fetchSafetyChecks,
  }) {
    return fetchSafetyChecks(code, type, date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String code, String type, String date)? fetchSafetyChecks,
  }) {
    return fetchSafetyChecks?.call(code, type, date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code, String type, String date)? fetchSafetyChecks,
    required TResult orElse(),
  }) {
    if (fetchSafetyChecks != null) {
      return fetchSafetyChecks(code, type, date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSafetyChecks value) fetchSafetyChecks,
  }) {
    return fetchSafetyChecks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchSafetyChecks value)? fetchSafetyChecks,
  }) {
    return fetchSafetyChecks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSafetyChecks value)? fetchSafetyChecks,
    required TResult orElse(),
  }) {
    if (fetchSafetyChecks != null) {
      return fetchSafetyChecks(this);
    }
    return orElse();
  }
}

abstract class _FetchSafetyChecks extends SafetyCheckEvent {
  const factory _FetchSafetyChecks(String code, String type, String date) =
      _$_FetchSafetyChecks;
  const _FetchSafetyChecks._() : super._();

  @override
  String get code;
  @override
  String get type;
  @override
  String get date;
  @override
  @JsonKey(ignore: true)
  _$FetchSafetyChecksCopyWith<_FetchSafetyChecks> get copyWith =>
      throw _privateConstructorUsedError;
}
