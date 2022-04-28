// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'fct_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FctEventTearOff {
  const _$FctEventTearOff();

  _GetFctItems getFctItems(String serial) {
    return _GetFctItems(
      serial,
    );
  }
}

/// @nodoc
const $FctEvent = _$FctEventTearOff();

/// @nodoc
mixin _$FctEvent {
  String get serial => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serial) getFctItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serial)? getFctItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serial)? getFctItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFctItems value) getFctItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFctItems value)? getFctItems,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFctItems value)? getFctItems,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FctEventCopyWith<FctEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FctEventCopyWith<$Res> {
  factory $FctEventCopyWith(FctEvent value, $Res Function(FctEvent) then) =
      _$FctEventCopyWithImpl<$Res>;
  $Res call({String serial});
}

/// @nodoc
class _$FctEventCopyWithImpl<$Res> implements $FctEventCopyWith<$Res> {
  _$FctEventCopyWithImpl(this._value, this._then);

  final FctEvent _value;
  // ignore: unused_field
  final $Res Function(FctEvent) _then;

  @override
  $Res call({
    Object? serial = freezed,
  }) {
    return _then(_value.copyWith(
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$GetFctItemsCopyWith<$Res> implements $FctEventCopyWith<$Res> {
  factory _$GetFctItemsCopyWith(
          _GetFctItems value, $Res Function(_GetFctItems) then) =
      __$GetFctItemsCopyWithImpl<$Res>;
  @override
  $Res call({String serial});
}

/// @nodoc
class __$GetFctItemsCopyWithImpl<$Res> extends _$FctEventCopyWithImpl<$Res>
    implements _$GetFctItemsCopyWith<$Res> {
  __$GetFctItemsCopyWithImpl(
      _GetFctItems _value, $Res Function(_GetFctItems) _then)
      : super(_value, (v) => _then(v as _GetFctItems));

  @override
  _GetFctItems get _value => super._value as _GetFctItems;

  @override
  $Res call({
    Object? serial = freezed,
  }) {
    return _then(_GetFctItems(
      serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetFctItems extends _GetFctItems {
  const _$_GetFctItems(this.serial) : super._();

  @override
  final String serial;

  @override
  String toString() {
    return 'FctEvent.getFctItems(serial: $serial)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetFctItems &&
            const DeepCollectionEquality().equals(other.serial, serial));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(serial));

  @JsonKey(ignore: true)
  @override
  _$GetFctItemsCopyWith<_GetFctItems> get copyWith =>
      __$GetFctItemsCopyWithImpl<_GetFctItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String serial) getFctItems,
  }) {
    return getFctItems(serial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String serial)? getFctItems,
  }) {
    return getFctItems?.call(serial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String serial)? getFctItems,
    required TResult orElse(),
  }) {
    if (getFctItems != null) {
      return getFctItems(serial);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetFctItems value) getFctItems,
  }) {
    return getFctItems(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_GetFctItems value)? getFctItems,
  }) {
    return getFctItems?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetFctItems value)? getFctItems,
    required TResult orElse(),
  }) {
    if (getFctItems != null) {
      return getFctItems(this);
    }
    return orElse();
  }
}

abstract class _GetFctItems extends FctEvent {
  const factory _GetFctItems(String serial) = _$_GetFctItems;
  const _GetFctItems._() : super._();

  @override
  String get serial;
  @override
  @JsonKey(ignore: true)
  _$GetFctItemsCopyWith<_GetFctItems> get copyWith =>
      throw _privateConstructorUsedError;
}
