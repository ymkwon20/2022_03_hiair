// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cutting_check_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CuttingCheckEventTearOff {
  const _$CuttingCheckEventTearOff();

  _FetchChecks fetchChecks(CuttingSerial serial) {
    return _FetchChecks(
      serial,
    );
  }
}

/// @nodoc
const $CuttingCheckEvent = _$CuttingCheckEventTearOff();

/// @nodoc
mixin _$CuttingCheckEvent {
  CuttingSerial get serial => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingSerial serial) fetchChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChecks value) fetchChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchChecks value)? fetchChecks,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChecks value)? fetchChecks,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CuttingCheckEventCopyWith<CuttingCheckEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuttingCheckEventCopyWith<$Res> {
  factory $CuttingCheckEventCopyWith(
          CuttingCheckEvent value, $Res Function(CuttingCheckEvent) then) =
      _$CuttingCheckEventCopyWithImpl<$Res>;
  $Res call({CuttingSerial serial});
}

/// @nodoc
class _$CuttingCheckEventCopyWithImpl<$Res>
    implements $CuttingCheckEventCopyWith<$Res> {
  _$CuttingCheckEventCopyWithImpl(this._value, this._then);

  final CuttingCheckEvent _value;
  // ignore: unused_field
  final $Res Function(CuttingCheckEvent) _then;

  @override
  $Res call({
    Object? serial = freezed,
  }) {
    return _then(_value.copyWith(
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as CuttingSerial,
    ));
  }
}

/// @nodoc
abstract class _$FetchChecksCopyWith<$Res>
    implements $CuttingCheckEventCopyWith<$Res> {
  factory _$FetchChecksCopyWith(
          _FetchChecks value, $Res Function(_FetchChecks) then) =
      __$FetchChecksCopyWithImpl<$Res>;
  @override
  $Res call({CuttingSerial serial});
}

/// @nodoc
class __$FetchChecksCopyWithImpl<$Res>
    extends _$CuttingCheckEventCopyWithImpl<$Res>
    implements _$FetchChecksCopyWith<$Res> {
  __$FetchChecksCopyWithImpl(
      _FetchChecks _value, $Res Function(_FetchChecks) _then)
      : super(_value, (v) => _then(v as _FetchChecks));

  @override
  _FetchChecks get _value => super._value as _FetchChecks;

  @override
  $Res call({
    Object? serial = freezed,
  }) {
    return _then(_FetchChecks(
      serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as CuttingSerial,
    ));
  }
}

/// @nodoc

class _$_FetchChecks extends _FetchChecks {
  const _$_FetchChecks(this.serial) : super._();

  @override
  final CuttingSerial serial;

  @override
  String toString() {
    return 'CuttingCheckEvent.fetchChecks(serial: $serial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchChecks &&
            const DeepCollectionEquality().equals(other.serial, serial));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serial));

  @JsonKey(ignore: true)
  @override
  _$FetchChecksCopyWith<_FetchChecks> get copyWith =>
      __$FetchChecksCopyWithImpl<_FetchChecks>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingSerial serial) fetchChecks,
  }) {
    return fetchChecks(serial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchChecks,
  }) {
    return fetchChecks?.call(serial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchChecks,
    required TResult orElse(),
  }) {
    if (fetchChecks != null) {
      return fetchChecks(serial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChecks value) fetchChecks,
  }) {
    return fetchChecks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchChecks value)? fetchChecks,
  }) {
    return fetchChecks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChecks value)? fetchChecks,
    required TResult orElse(),
  }) {
    if (fetchChecks != null) {
      return fetchChecks(this);
    }
    return orElse();
  }
}

abstract class _FetchChecks extends CuttingCheckEvent {
  const factory _FetchChecks(CuttingSerial serial) = _$_FetchChecks;
  const _FetchChecks._() : super._();

  @override
  CuttingSerial get serial;
  @override
  @JsonKey(ignore: true)
  _$FetchChecksCopyWith<_FetchChecks> get copyWith =>
      throw _privateConstructorUsedError;
}
