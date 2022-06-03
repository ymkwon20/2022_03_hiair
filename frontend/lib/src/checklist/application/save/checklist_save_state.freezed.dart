// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checklist_save_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChecklistSaveStateTearOff {
  const _$ChecklistSaveStateTearOff();

  _Init init() {
    return const _Init();
  }

  _Saving saving() {
    return const _Saving();
  }

  _Saved saved() {
    return const _Saved();
  }

  _SavedAndNext savedAndNext(WorkOrderSaveStatus status) {
    return _SavedAndNext(
      status,
    );
  }

  _Failure failure(String message) {
    return _Failure(
      message,
    );
  }
}

/// @nodoc
const $ChecklistSaveState = _$ChecklistSaveStateTearOff();

/// @nodoc
mixin _$ChecklistSaveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistSaveStateCopyWith<$Res> {
  factory $ChecklistSaveStateCopyWith(
          ChecklistSaveState value, $Res Function(ChecklistSaveState) then) =
      _$ChecklistSaveStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChecklistSaveStateCopyWithImpl<$Res>
    implements $ChecklistSaveStateCopyWith<$Res> {
  _$ChecklistSaveStateCopyWithImpl(this._value, this._then);

  final ChecklistSaveState _value;
  // ignore: unused_field
  final $Res Function(ChecklistSaveState) _then;
}

/// @nodoc
abstract class _$InitCopyWith<$Res> {
  factory _$InitCopyWith(_Init value, $Res Function(_Init) then) =
      __$InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitCopyWithImpl<$Res> extends _$ChecklistSaveStateCopyWithImpl<$Res>
    implements _$InitCopyWith<$Res> {
  __$InitCopyWithImpl(_Init _value, $Res Function(_Init) _then)
      : super(_value, (v) => _then(v as _Init));

  @override
  _Init get _value => super._value as _Init;
}

/// @nodoc

class _$_Init extends _Init {
  const _$_Init() : super._();

  @override
  String toString() {
    return 'ChecklistSaveState.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init extends ChecklistSaveState {
  const factory _Init() = _$_Init;
  const _Init._() : super._();
}

/// @nodoc
abstract class _$SavingCopyWith<$Res> {
  factory _$SavingCopyWith(_Saving value, $Res Function(_Saving) then) =
      __$SavingCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavingCopyWithImpl<$Res> extends _$ChecklistSaveStateCopyWithImpl<$Res>
    implements _$SavingCopyWith<$Res> {
  __$SavingCopyWithImpl(_Saving _value, $Res Function(_Saving) _then)
      : super(_value, (v) => _then(v as _Saving));

  @override
  _Saving get _value => super._value as _Saving;
}

/// @nodoc

class _$_Saving extends _Saving {
  const _$_Saving() : super._();

  @override
  String toString() {
    return 'ChecklistSaveState.saving()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Saving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving extends ChecklistSaveState {
  const factory _Saving() = _$_Saving;
  const _Saving._() : super._();
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$ChecklistSaveStateCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc

class _$_Saved extends _Saved {
  const _$_Saved() : super._();

  @override
  String toString() {
    return 'ChecklistSaveState.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved extends ChecklistSaveState {
  const factory _Saved() = _$_Saved;
  const _Saved._() : super._();
}

/// @nodoc
abstract class _$SavedAndNextCopyWith<$Res> {
  factory _$SavedAndNextCopyWith(
          _SavedAndNext value, $Res Function(_SavedAndNext) then) =
      __$SavedAndNextCopyWithImpl<$Res>;
  $Res call({WorkOrderSaveStatus status});
}

/// @nodoc
class __$SavedAndNextCopyWithImpl<$Res>
    extends _$ChecklistSaveStateCopyWithImpl<$Res>
    implements _$SavedAndNextCopyWith<$Res> {
  __$SavedAndNextCopyWithImpl(
      _SavedAndNext _value, $Res Function(_SavedAndNext) _then)
      : super(_value, (v) => _then(v as _SavedAndNext));

  @override
  _SavedAndNext get _value => super._value as _SavedAndNext;

  @override
  $Res call({
    Object? status = freezed,
  }) {
    return _then(_SavedAndNext(
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderSaveStatus,
    ));
  }
}

/// @nodoc

class _$_SavedAndNext extends _SavedAndNext {
  const _$_SavedAndNext(this.status) : super._();

  @override
  final WorkOrderSaveStatus status;

  @override
  String toString() {
    return 'ChecklistSaveState.savedAndNext(status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SavedAndNext &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(status));

  @JsonKey(ignore: true)
  @override
  _$SavedAndNextCopyWith<_SavedAndNext> get copyWith =>
      __$SavedAndNextCopyWithImpl<_SavedAndNext>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) {
    return savedAndNext(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) {
    return savedAndNext?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (savedAndNext != null) {
      return savedAndNext(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) {
    return savedAndNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) {
    return savedAndNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (savedAndNext != null) {
      return savedAndNext(this);
    }
    return orElse();
  }
}

abstract class _SavedAndNext extends ChecklistSaveState {
  const factory _SavedAndNext(WorkOrderSaveStatus status) = _$_SavedAndNext;
  const _SavedAndNext._() : super._();

  WorkOrderSaveStatus get status;
  @JsonKey(ignore: true)
  _$SavedAndNextCopyWith<_SavedAndNext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$ChecklistSaveStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Failure(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.message) : super._();

  @override
  final String message;

  @override
  String toString() {
    return 'ChecklistSaveState.failure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function() saving,
    required TResult Function() saved,
    required TResult Function(WorkOrderSaveStatus status) savedAndNext,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function()? saving,
    TResult Function()? saved,
    TResult Function(WorkOrderSaveStatus status)? savedAndNext,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Saved value) saved,
    required TResult Function(_SavedAndNext value) savedAndNext,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Saving value)? saving,
    TResult Function(_Saved value)? saved,
    TResult Function(_SavedAndNext value)? savedAndNext,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends ChecklistSaveState {
  const factory _Failure(String message) = _$_Failure;
  const _Failure._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
