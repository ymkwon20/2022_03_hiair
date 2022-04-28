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

  _Saving save(CuttingCheck check) {
    return _Saving(
      check,
    );
  }
}

/// @nodoc
const $CuttingCheckSaveEvent = _$CuttingCheckSaveEventTearOff();

/// @nodoc
mixin _$CuttingCheckSaveEvent {
  CuttingCheck get check => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingCheck check) save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingCheck check)? save,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingCheck check)? save,
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
  $Res call({CuttingCheck check});
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
    Object? check = freezed,
  }) {
    return _then(_value.copyWith(
      check: check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as CuttingCheck,
    ));
  }
}

/// @nodoc
abstract class _$SavingCopyWith<$Res>
    implements $CuttingCheckSaveEventCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) then) =
      __$SavingCopyWithImpl<$Res>;
  @override
  $Res call({CuttingCheck check});
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
    Object? check = freezed,
  }) {
    return _then(_Saving(
      check == freezed
          ? _value.check
          : check // ignore: cast_nullable_to_non_nullable
              as CuttingCheck,
    ));
  }
}

/// @nodoc

class _$_Saving extends _Saving {
  const _$_Saving(this.check) : super._();

  @override
  final CuttingCheck check;

  @override
  String toString() {
    return 'CuttingCheckSaveEvent.save(check: $check)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Saving &&
            const DeepCollectionEquality().equals(other.check, check));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(check));

  @JsonKey(ignore: true)
  @override
  _$SavingCopyWith<_Saving> get copyWith =>
      __$SavingCopyWithImpl<_Saving>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(CuttingCheck check) save,
  }) {
    return save(check);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(CuttingCheck check)? save,
  }) {
    return save?.call(check);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(CuttingCheck check)? save,
    required TResult orElse(),
  }) {
    if (save != null) {
      return save(check);
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
  const factory _Saving(CuttingCheck check) = _$_Saving;
  const _Saving._() : super._();

  @override
  CuttingCheck get check;
  @override
  @JsonKey(ignore: true)
  _$SavingCopyWith<_Saving> get copyWith => throw _privateConstructorUsedError;
}
