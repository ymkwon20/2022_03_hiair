// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cutting_check_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CuttingCheckSaveEventTearOff {
  const _$CuttingCheckSaveEventTearOff();

  _Saving save(
      CuttingSerial serial, CuttingCheck check, CuttingCheckResult result) {
    return _Saving(
      serial,
      check,
      result,
    );
  }
}

/// @nodoc
const $CuttingCheckSaveEvent = _$CuttingCheckSaveEventTearOff();

/// @nodoc
mixin _$CuttingCheckSaveEvent {
  CuttingSerial get serial => throw _privateConstructorUsedError;
  CuttingCheck get check => throw _privateConstructorUsedError;
  CuttingCheckResult get result => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CuttingSerial serial, CuttingCheck check, CuttingCheckResult result)
        save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial, CuttingCheck check,
            CuttingCheckResult result)?
        save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial, CuttingCheck check,
            CuttingCheckResult result)?
        save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Saving value) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Saving value)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Saving value)? save,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CuttingCheckSaveEventCopyWith<CuttingCheckSaveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CuttingCheckSaveEventCopyWith<$Res> {
  factory $CuttingCheckSaveEventCopyWith(CuttingCheckSaveEvent value,
          $Res Function(CuttingCheckSaveEvent) then) =
      _$CuttingCheckSaveEventCopyWithImpl<$Res>;
  $Res call(
      {CuttingSerial serial, CuttingCheck check, CuttingCheckResult result});
}

/// @nodoc
class _$CuttingCheckSaveEventCopyWithImpl<$Res>
    implements $CuttingCheckSaveEventCopyWith<$Res> {
  _$CuttingCheckSaveEventCopyWithImpl(this._value, this._then);

  final CuttingCheckSaveEvent _value;
  // ignore: unused_field
  final $Res Function(CuttingCheckSaveEvent) _then;

  @override
  $Res call({
    Object? serial = freezed,
    Object? check = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      serial: serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as CuttingSerial,
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as CuttingCheck,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CuttingCheckResult,
    ));
  }
}

/// @nodoc
abstract class _$SavingCopyWith<$Res>
    implements $CuttingCheckSaveEventCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) then) =
      __$SavingCopyWithImpl<$Res>;
  @override
  $Res call(
      {CuttingSerial serial, CuttingCheck check, CuttingCheckResult result});
}

/// @nodoc
class __$SavingCopyWithImpl<$Res>
    extends _$CuttingCheckSaveEventCopyWithImpl<$Res>
    implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(_Saving _value, $Res Function(_Saving) _then)
      : super(_value, (v) => _then(v as _Saving));

  @override
  _Saving get _value => super._value as _Saving;

  @override
  $Res call({
    Object? serial = freezed,
    Object? check = freezed,
    Object? result = freezed,
  }) {
    return _then(_Saving(
      serial == freezed
          ? _value.serial
          : serial // ignore: cast_nullable_to_non_nullable
              as CuttingSerial,
      check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as CuttingCheck,
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as CuttingCheckResult,
    ));
  }
}

/// @nodoc

class _$_Saving extends _Saving {
  const _$_Saving(this.serial, this.check, this.result) : super._();

  @override
  final CuttingSerial serial;
  @override
  final CuttingCheck check;
  @override
  final CuttingCheckResult result;

  @override
  String toString() {
    return 'CuttingCheckSaveEvent.save(serial: $serial, check: $check, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Saving &&
            const DeepCollectionEquality().equals(other.serial, serial) &&
            const DeepCollectionEquality().equals(other.check, check) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(serial),
      const DeepCollectionEquality().hash(check),
      const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$SavingCopyWith<_Saving> get copyWith =>
      __$SavingCopyWithImpl<_Saving>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            CuttingSerial serial, CuttingCheck check, CuttingCheckResult result)
        save,
  }) {
    return save(serial, check, result);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingSerial serial, CuttingCheck check,
            CuttingCheckResult result)?
        save,
  }) {
    return save?.call(serial, check, result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingSerial serial, CuttingCheck check,
            CuttingCheckResult result)?
        save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(serial, check, result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Saving value) save,
  }) {
    return save(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Saving value)? save,
  }) {
    return save?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Saving value)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(this);
    }
    return orElse();
  }
}

abstract class _Saving extends CuttingCheckSaveEvent {
  const factory _Saving(
          CuttingSerial serial, CuttingCheck check, CuttingCheckResult result) =
      _$_Saving;
  const _Saving._() : super._();

  @override
  CuttingSerial get serial;
  @override
  CuttingCheck get check;
  @override
  CuttingCheckResult get result;
  @override
  @JsonKey(ignore: true)
  _$SavingCopyWith<_Saving> get copyWith => throw _privateConstructorUsedError;
}
