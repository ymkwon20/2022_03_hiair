// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'safety_info_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SafetyInfoEventTearOff {
  const _$SafetyInfoEventTearOff();

  _FetchSafetyInfos fetchSafetyInfos(String code) {
    return _FetchSafetyInfos(
      code,
    );
  }
}

/// @nodoc
const $SafetyInfoEvent = _$SafetyInfoEventTearOff();

/// @nodoc
mixin _$SafetyInfoEvent {
  String get code => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) fetchSafetyInfos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String code)? fetchSafetyInfos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? fetchSafetyInfos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSafetyInfos value) fetchSafetyInfos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchSafetyInfos value)? fetchSafetyInfos,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSafetyInfos value)? fetchSafetyInfos,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SafetyInfoEventCopyWith<SafetyInfoEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SafetyInfoEventCopyWith<$Res> {
  factory $SafetyInfoEventCopyWith(
          SafetyInfoEvent value, $Res Function(SafetyInfoEvent) then) =
      _$SafetyInfoEventCopyWithImpl<$Res>;
  $Res call({String code});
}

/// @nodoc
class _$SafetyInfoEventCopyWithImpl<$Res>
    implements $SafetyInfoEventCopyWith<$Res> {
  _$SafetyInfoEventCopyWithImpl(this._value, this._then);

  final SafetyInfoEvent _value;
  // ignore: unused_field
  final $Res Function(SafetyInfoEvent) _then;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FetchSafetyInfosCopyWith<$Res>
    implements $SafetyInfoEventCopyWith<$Res> {
  factory _$FetchSafetyInfosCopyWith(
          _FetchSafetyInfos value, $Res Function(_FetchSafetyInfos) then) =
      __$FetchSafetyInfosCopyWithImpl<$Res>;
  @override
  $Res call({String code});
}

/// @nodoc
class __$FetchSafetyInfosCopyWithImpl<$Res>
    extends _$SafetyInfoEventCopyWithImpl<$Res>
    implements _$FetchSafetyInfosCopyWith<$Res> {
  __$FetchSafetyInfosCopyWithImpl(
      _FetchSafetyInfos _value, $Res Function(_FetchSafetyInfos) _then)
      : super(_value, (v) => _then(v as _FetchSafetyInfos));

  @override
  _FetchSafetyInfos get _value => super._value as _FetchSafetyInfos;

  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_FetchSafetyInfos(
      code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchSafetyInfos extends _FetchSafetyInfos {
  const _$_FetchSafetyInfos(this.code) : super._();

  @override
  final String code;

  @override
  String toString() {
    return 'SafetyInfoEvent.fetchSafetyInfos(code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchSafetyInfos &&
            const DeepCollectionEquality().equals(other.code, code));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(code));

  @JsonKey(ignore: true)
  @override
  _$FetchSafetyInfosCopyWith<_FetchSafetyInfos> get copyWith =>
      __$FetchSafetyInfosCopyWithImpl<_FetchSafetyInfos>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String code) fetchSafetyInfos,
  }) {
    return fetchSafetyInfos(code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String code)? fetchSafetyInfos,
  }) {
    return fetchSafetyInfos?.call(code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String code)? fetchSafetyInfos,
    required TResult orElse(),
  }) {
    if (fetchSafetyInfos != null) {
      return fetchSafetyInfos(code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchSafetyInfos value) fetchSafetyInfos,
  }) {
    return fetchSafetyInfos(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchSafetyInfos value)? fetchSafetyInfos,
  }) {
    return fetchSafetyInfos?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchSafetyInfos value)? fetchSafetyInfos,
    required TResult orElse(),
  }) {
    if (fetchSafetyInfos != null) {
      return fetchSafetyInfos(this);
    }
    return orElse();
  }
}

abstract class _FetchSafetyInfos extends SafetyInfoEvent {
  const factory _FetchSafetyInfos(String code) = _$_FetchSafetyInfos;
  const _FetchSafetyInfos._() : super._();

  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$FetchSafetyInfosCopyWith<_FetchSafetyInfos> get copyWith =>
      throw _privateConstructorUsedError;
}
