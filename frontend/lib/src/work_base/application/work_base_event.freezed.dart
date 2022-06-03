// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_base_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkBaseEventTearOff {
  const _$WorkBaseEventTearOff();

  _FetchWorkBases fetchWorkBases() {
    return const _FetchWorkBases();
  }
}

/// @nodoc
const $WorkBaseEvent = _$WorkBaseEventTearOff();

/// @nodoc
mixin _$WorkBaseEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchWorkBases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchWorkBases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchWorkBases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchWorkBases value) fetchWorkBases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchWorkBases value)? fetchWorkBases,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchWorkBases value)? fetchWorkBases,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkBaseEventCopyWith<$Res> {
  factory $WorkBaseEventCopyWith(
          WorkBaseEvent value, $Res Function(WorkBaseEvent) then) =
      _$WorkBaseEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkBaseEventCopyWithImpl<$Res>
    implements $WorkBaseEventCopyWith<$Res> {
  _$WorkBaseEventCopyWithImpl(this._value, this._then);

  final WorkBaseEvent _value;
  // ignore: unused_field
  final $Res Function(WorkBaseEvent) _then;
}

/// @nodoc
abstract class _$FetchWorkBasesCopyWith<$Res> {
  factory _$FetchWorkBasesCopyWith(
          _FetchWorkBases value, $Res Function(_FetchWorkBases) then) =
      __$FetchWorkBasesCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchWorkBasesCopyWithImpl<$Res>
    extends _$WorkBaseEventCopyWithImpl<$Res>
    implements _$FetchWorkBasesCopyWith<$Res> {
  __$FetchWorkBasesCopyWithImpl(
      _FetchWorkBases _value, $Res Function(_FetchWorkBases) _then)
      : super(_value, (v) => _then(v as _FetchWorkBases));

  @override
  _FetchWorkBases get _value => super._value as _FetchWorkBases;
}

/// @nodoc

class _$_FetchWorkBases extends _FetchWorkBases {
  const _$_FetchWorkBases() : super._();

  @override
  String toString() {
    return 'WorkBaseEvent.fetchWorkBases()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchWorkBases);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchWorkBases,
  }) {
    return fetchWorkBases();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchWorkBases,
  }) {
    return fetchWorkBases?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchWorkBases,
    required TResult orElse(),
  }) {
    if (fetchWorkBases != null) {
      return fetchWorkBases();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchWorkBases value) fetchWorkBases,
  }) {
    return fetchWorkBases(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchWorkBases value)? fetchWorkBases,
  }) {
    return fetchWorkBases?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchWorkBases value)? fetchWorkBases,
    required TResult orElse(),
  }) {
    if (fetchWorkBases != null) {
      return fetchWorkBases(this);
    }
    return orElse();
  }
}

abstract class _FetchWorkBases extends WorkBaseEvent {
  const factory _FetchWorkBases() = _$_FetchWorkBases;
  const _FetchWorkBases._() : super._();
}
