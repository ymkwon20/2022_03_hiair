// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_work_order_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentWorkOrderStateTearOff {
  const _$CurrentWorkOrderStateTearOff();

  _Initial initial(List<CurrentWorkOrder> items) {
    return _Initial(
      items,
    );
  }

  _Loading loading(List<CurrentWorkOrder> items) {
    return _Loading(
      items,
    );
  }

  _Loaded loaded(List<CurrentWorkOrder> items) {
    return _Loaded(
      items,
    );
  }

  _Failure failure(List<CurrentWorkOrder> items, String message) {
    return _Failure(
      items,
      message,
    );
  }
}

/// @nodoc
const $CurrentWorkOrderState = _$CurrentWorkOrderStateTearOff();

/// @nodoc
mixin _$CurrentWorkOrderState {
  List<CurrentWorkOrder> get items => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrentWorkOrder> items) initial,
    required TResult Function(List<CurrentWorkOrder> items) loading,
    required TResult Function(List<CurrentWorkOrder> items) loaded,
    required TResult Function(List<CurrentWorkOrder> items, String message)
        failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentWorkOrderStateCopyWith<CurrentWorkOrderState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWorkOrderStateCopyWith<$Res> {
  factory $CurrentWorkOrderStateCopyWith(CurrentWorkOrderState value,
          $Res Function(CurrentWorkOrderState) then) =
      _$CurrentWorkOrderStateCopyWithImpl<$Res>;
  $Res call({List<CurrentWorkOrder> items});
}

/// @nodoc
class _$CurrentWorkOrderStateCopyWithImpl<$Res>
    implements $CurrentWorkOrderStateCopyWith<$Res> {
  _$CurrentWorkOrderStateCopyWithImpl(this._value, this._then);

  final CurrentWorkOrderState _value;
  // ignore: unused_field
  final $Res Function(CurrentWorkOrderState) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res>
    implements $CurrentWorkOrderStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({List<CurrentWorkOrder> items});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$CurrentWorkOrderStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_Initial(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.items) : super._();

  @override
  final List<CurrentWorkOrder> items;

  @override
  String toString() {
    return 'CurrentWorkOrderState.initial(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrentWorkOrder> items) initial,
    required TResult Function(List<CurrentWorkOrder> items) loading,
    required TResult Function(List<CurrentWorkOrder> items) loaded,
    required TResult Function(List<CurrentWorkOrder> items, String message)
        failure,
  }) {
    return initial(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
  }) {
    return initial?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends CurrentWorkOrderState {
  const factory _Initial(List<CurrentWorkOrder> items) = _$_Initial;
  const _Initial._() : super._();

  @override
  List<CurrentWorkOrder> get items;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res>
    implements $CurrentWorkOrderStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({List<CurrentWorkOrder> items});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$CurrentWorkOrderStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_Loading(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
    ));
  }
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading(this.items) : super._();

  @override
  final List<CurrentWorkOrder> items;

  @override
  String toString() {
    return 'CurrentWorkOrderState.loading(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrentWorkOrder> items) initial,
    required TResult Function(List<CurrentWorkOrder> items) loading,
    required TResult Function(List<CurrentWorkOrder> items) loaded,
    required TResult Function(List<CurrentWorkOrder> items, String message)
        failure,
  }) {
    return loading(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
  }) {
    return loading?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading extends CurrentWorkOrderState {
  const factory _Loading(List<CurrentWorkOrder> items) = _$_Loading;
  const _Loading._() : super._();

  @override
  List<CurrentWorkOrder> get items;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res>
    implements $CurrentWorkOrderStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({List<CurrentWorkOrder> items});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    extends _$CurrentWorkOrderStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_Loaded(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
    ));
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(this.items) : super._();

  @override
  final List<CurrentWorkOrder> items;

  @override
  String toString() {
    return 'CurrentWorkOrderState.loaded(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrentWorkOrder> items) initial,
    required TResult Function(List<CurrentWorkOrder> items) loading,
    required TResult Function(List<CurrentWorkOrder> items) loaded,
    required TResult Function(List<CurrentWorkOrder> items, String message)
        failure,
  }) {
    return loaded(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
  }) {
    return loaded?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded extends CurrentWorkOrderState {
  const factory _Loaded(List<CurrentWorkOrder> items) = _$_Loaded;
  const _Loaded._() : super._();

  @override
  List<CurrentWorkOrder> get items;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res>
    implements $CurrentWorkOrderStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call({List<CurrentWorkOrder> items, String message});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res>
    extends _$CurrentWorkOrderStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? items = freezed,
    Object? message = freezed,
  }) {
    return _then(_Failure(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.items, this.message) : super._();

  @override
  final List<CurrentWorkOrder> items;
  @override
  final String message;

  @override
  String toString() {
    return 'CurrentWorkOrderState.failure(items: $items, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CurrentWorkOrder> items) initial,
    required TResult Function(List<CurrentWorkOrder> items) loading,
    required TResult Function(List<CurrentWorkOrder> items) loaded,
    required TResult Function(List<CurrentWorkOrder> items, String message)
        failure,
  }) {
    return failure(items, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
  }) {
    return failure?.call(items, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items)? initial,
    TResult Function(List<CurrentWorkOrder> items)? loading,
    TResult Function(List<CurrentWorkOrder> items)? loaded,
    TResult Function(List<CurrentWorkOrder> items, String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(items, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure extends CurrentWorkOrderState {
  const factory _Failure(List<CurrentWorkOrder> items, String message) =
      _$_Failure;
  const _Failure._() : super._();

  @override
  List<CurrentWorkOrder> get items;
  String get message;
  @override
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
