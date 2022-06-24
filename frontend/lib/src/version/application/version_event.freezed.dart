// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'version_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$VersionEventTearOff {
  const _$VersionEventTearOff();

  _CheckVersion checkVersion() {
    return const _CheckVersion();
  }
}

/// @nodoc
const $VersionEvent = _$VersionEventTearOff();

/// @nodoc
mixin _$VersionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkVersion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? checkVersion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkVersion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckVersion value) checkVersion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CheckVersion value)? checkVersion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckVersion value)? checkVersion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionEventCopyWith<$Res> {
  factory $VersionEventCopyWith(
          VersionEvent value, $Res Function(VersionEvent) then) =
      _$VersionEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$VersionEventCopyWithImpl<$Res> implements $VersionEventCopyWith<$Res> {
  _$VersionEventCopyWithImpl(this._value, this._then);

  final VersionEvent _value;
  // ignore: unused_field
  final $Res Function(VersionEvent) _then;
}

/// @nodoc
abstract class _$CheckVersionCopyWith<$Res> {
  factory _$CheckVersionCopyWith(
          _CheckVersion value, $Res Function(_CheckVersion) then) =
      __$CheckVersionCopyWithImpl<$Res>;
}

/// @nodoc
class __$CheckVersionCopyWithImpl<$Res> extends _$VersionEventCopyWithImpl<$Res>
    implements _$CheckVersionCopyWith<$Res> {
  __$CheckVersionCopyWithImpl(
      _CheckVersion _value, $Res Function(_CheckVersion) _then)
      : super(_value, (v) => _then(v as _CheckVersion));

  @override
  _CheckVersion get _value => super._value as _CheckVersion;
}

/// @nodoc

class _$_CheckVersion extends _CheckVersion {
  const _$_CheckVersion() : super._();

  @override
  String toString() {
    return 'VersionEvent.checkVersion()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _CheckVersion);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() checkVersion,
  }) {
    return checkVersion();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? checkVersion,
  }) {
    return checkVersion?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? checkVersion,
    required TResult orElse(),
  }) {
    if (checkVersion != null) {
      return checkVersion();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CheckVersion value) checkVersion,
  }) {
    return checkVersion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_CheckVersion value)? checkVersion,
  }) {
    return checkVersion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CheckVersion value)? checkVersion,
    required TResult orElse(),
  }) {
    if (checkVersion != null) {
      return checkVersion(this);
    }
    return orElse();
  }
}

abstract class _CheckVersion extends VersionEvent {
  const factory _CheckVersion() = _$_CheckVersion;
  const _CheckVersion._() : super._();
}
