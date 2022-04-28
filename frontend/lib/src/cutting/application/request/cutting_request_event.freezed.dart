// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cutting_request_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CuttingRequestEventTearOff {
  const _$CuttingRequestEventTearOff();

  _FetchRequest fetchRequest(CuttingSerial serial) {
    return _FetchRequest(
      serial,
    );
  }
}

/// @nodoc
const $CuttingRequestEvent = _$CuttingRequestEventTearOff();

/// @nodoc
mixin _$CuttingRequestEvent {
  CuttingSerial get serial => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingSerial serial) fetchRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequest value) fetchRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRequest value)? fetchRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequest value)? fetchRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CuttingRequestEventCopyWith<CuttingRequestEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuttingRequestEventCopyWith<$Res> {
  factory $CuttingRequestEventCopyWith(
          CuttingRequestEvent value, $Res Function(CuttingRequestEvent) then) =
      _$CuttingRequestEventCopyWithImpl<$Res>;
  $Res call({CuttingSerial serial});
}

/// @nodoc
class _$CuttingRequestEventCopyWithImpl<$Res>
    implements $CuttingRequestEventCopyWith<$Res> {
  _$CuttingRequestEventCopyWithImpl(this._value, this._then);

  final CuttingRequestEvent _value;
  // ignore: unused_field
  final $Res Function(CuttingRequestEvent) _then;

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
abstract class _$FetchRequestCopyWith<$Res>
    implements $CuttingRequestEventCopyWith<$Res> {
  factory _$FetchRequestCopyWith(
          _FetchRequest value, $Res Function(_FetchRequest) then) =
      __$FetchRequestCopyWithImpl<$Res>;
  @override
  $Res call({CuttingSerial serial});
}

/// @nodoc
class __$FetchRequestCopyWithImpl<$Res>
    extends _$CuttingRequestEventCopyWithImpl<$Res>
    implements _$FetchRequestCopyWith<$Res> {
  __$FetchRequestCopyWithImpl(
      _FetchRequest _value, $Res Function(_FetchRequest) _then)
      : super(_value, (v) => _then(v as _FetchRequest));

  @override
  _FetchRequest get _value => super._value as _FetchRequest;

  @override
  $Res call({
    Object? serial = freezed,
  }) {
    return _then(_FetchRequest(
      serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as CuttingSerial,
    ));
  }
}

/// @nodoc

class _$_FetchRequest extends _FetchRequest {
  const _$_FetchRequest(this.serial) : super._();

  @override
  final CuttingSerial serial;

  @override
  String toString() {
    return 'CuttingRequestEvent.fetchRequest(serial: $serial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchRequest &&
            const DeepCollectionEquality().equals(other.serial, serial));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serial));

  @JsonKey(ignore: true)
  @override
  _$FetchRequestCopyWith<_FetchRequest> get copyWith =>
      __$FetchRequestCopyWithImpl<_FetchRequest>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingSerial serial) fetchRequest,
  }) {
    return fetchRequest(serial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchRequest,
  }) {
    return fetchRequest?.call(serial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial)? fetchRequest,
    required TResult orElse(),
  }) {
    if (fetchRequest != null) {
      return fetchRequest(serial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchRequest value) fetchRequest,
  }) {
    return fetchRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchRequest value)? fetchRequest,
  }) {
    return fetchRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchRequest value)? fetchRequest,
    required TResult orElse(),
  }) {
    if (fetchRequest != null) {
      return fetchRequest(this);
    }
    return orElse();
  }
}

abstract class _FetchRequest extends CuttingRequestEvent {
  const factory _FetchRequest(CuttingSerial serial) = _$_FetchRequest;
  const _FetchRequest._() : super._();

  @override
  CuttingSerial get serial;
  @override
  @JsonKey(ignore: true)
  _$FetchRequestCopyWith<_FetchRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
