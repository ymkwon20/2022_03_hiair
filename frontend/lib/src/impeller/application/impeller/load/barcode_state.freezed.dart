// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'barcode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$BarcodeStateTearOff {
  const _$BarcodeStateTearOff();

  _Initial initial(Barcode barcode) {
    return _Initial(
      barcode,
    );
  }

  _Loading loading(Barcode barcode) {
    return _Loading(
      barcode,
    );
  }

  _Loaded loaded(Barcode barcode) {
    return _Loaded(
      barcode,
    );
  }

  _Failure failure(Barcode barcode, String meessage) {
    return _Failure(
      barcode,
      meessage,
    );
  }
}

/// @nodoc
const $BarcodeState = _$BarcodeStateTearOff();

/// @nodoc
mixin _$BarcodeState {
  Barcode get barcode => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Barcode barcode) initial,
    required TResult Function(Barcode barcode) loading,
    required TResult Function(Barcode barcode) loaded,
    required TResult Function(Barcode barcode, String meessage) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
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
  $BarcodeStateCopyWith<BarcodeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BarcodeStateCopyWith<$Res> {
  factory $BarcodeStateCopyWith(
          BarcodeState value, $Res Function(BarcodeState) then) =
      _$BarcodeStateCopyWithImpl<$Res>;
  $Res call({Barcode barcode});
}

/// @nodoc
class _$BarcodeStateCopyWithImpl<$Res> implements $BarcodeStateCopyWith<$Res> {
  _$BarcodeStateCopyWithImpl(this._value, this._then);

  final BarcodeState _value;
  // ignore: unused_field
  final $Res Function(BarcodeState) _then;

  @override
  $Res call({
    Object? barcode = freezed,
  }) {
    return _then(_value.copyWith(
      barcode: barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode,
    ));
  }
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> implements $BarcodeStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
  @override
  $Res call({Barcode barcode});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$BarcodeStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;

  @override
  $Res call({
    Object? barcode = freezed,
  }) {
    return _then(_Initial(
      barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode,
    ));
  }
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial(this.barcode) : super._();

  @override
  final Barcode barcode;

  @override
  String toString() {
    return 'BarcodeState.initial(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other.barcode, barcode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(barcode));

  @JsonKey(ignore: true)
  @override
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Barcode barcode) initial,
    required TResult Function(Barcode barcode) loading,
    required TResult Function(Barcode barcode) loaded,
    required TResult Function(Barcode barcode, String meessage) failure,
  }) {
    return initial(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
  }) {
    return initial?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(barcode);
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

abstract class _Initial extends BarcodeState {
  const factory _Initial(Barcode barcode) = _$_Initial;
  const _Initial._() : super._();

  @override
  Barcode get barcode;
  @override
  @JsonKey(ignore: true)
  _$InitialCopyWith<_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> implements $BarcodeStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
  @override
  $Res call({Barcode barcode});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$BarcodeStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;

  @override
  $Res call({
    Object? barcode = freezed,
  }) {
    return _then(_Loading(
      barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode,
    ));
  }
}

/// @nodoc

class _$_Loading extends _Loading {
  const _$_Loading(this.barcode) : super._();

  @override
  final Barcode barcode;

  @override
  String toString() {
    return 'BarcodeState.loading(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            const DeepCollectionEquality().equals(other.barcode, barcode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(barcode));

  @JsonKey(ignore: true)
  @override
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Barcode barcode) initial,
    required TResult Function(Barcode barcode) loading,
    required TResult Function(Barcode barcode) loaded,
    required TResult Function(Barcode barcode, String meessage) failure,
  }) {
    return loading(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
  }) {
    return loading?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(barcode);
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

abstract class _Loading extends BarcodeState {
  const factory _Loading(Barcode barcode) = _$_Loading;
  const _Loading._() : super._();

  @override
  Barcode get barcode;
  @override
  @JsonKey(ignore: true)
  _$LoadingCopyWith<_Loading> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$LoadedCopyWith<$Res> implements $BarcodeStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) then) =
      __$LoadedCopyWithImpl<$Res>;
  @override
  $Res call({Barcode barcode});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> extends _$BarcodeStateCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(_Loaded _value, $Res Function(_Loaded) _then)
      : super(_value, (v) => _then(v as _Loaded));

  @override
  _Loaded get _value => super._value as _Loaded;

  @override
  $Res call({
    Object? barcode = freezed,
  }) {
    return _then(_Loaded(
      barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode,
    ));
  }
}

/// @nodoc

class _$_Loaded extends _Loaded {
  const _$_Loaded(this.barcode) : super._();

  @override
  final Barcode barcode;

  @override
  String toString() {
    return 'BarcodeState.loaded(barcode: $barcode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality().equals(other.barcode, barcode));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(barcode));

  @JsonKey(ignore: true)
  @override
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Barcode barcode) initial,
    required TResult Function(Barcode barcode) loading,
    required TResult Function(Barcode barcode) loaded,
    required TResult Function(Barcode barcode, String meessage) failure,
  }) {
    return loaded(barcode);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
  }) {
    return loaded?.call(barcode);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(barcode);
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

abstract class _Loaded extends BarcodeState {
  const factory _Loaded(Barcode barcode) = _$_Loaded;
  const _Loaded._() : super._();

  @override
  Barcode get barcode;
  @override
  @JsonKey(ignore: true)
  _$LoadedCopyWith<_Loaded> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$FailureCopyWith<$Res> implements $BarcodeStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) then) =
      __$FailureCopyWithImpl<$Res>;
  @override
  $Res call({Barcode barcode, String meessage});
}

/// @nodoc
class __$FailureCopyWithImpl<$Res> extends _$BarcodeStateCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(_Failure _value, $Res Function(_Failure) _then)
      : super(_value, (v) => _then(v as _Failure));

  @override
  _Failure get _value => super._value as _Failure;

  @override
  $Res call({
    Object? barcode = freezed,
    Object? meessage = freezed,
  }) {
    return _then(_Failure(
      barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as Barcode,
      meessage == freezed
          ? _value.meessage
          : meessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Failure extends _Failure {
  const _$_Failure(this.barcode, this.meessage) : super._();

  @override
  final Barcode barcode;
  @override
  final String meessage;

  @override
  String toString() {
    return 'BarcodeState.failure(barcode: $barcode, meessage: $meessage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Failure &&
            const DeepCollectionEquality().equals(other.barcode, barcode) &&
            const DeepCollectionEquality().equals(other.meessage, meessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(barcode),
      const DeepCollectionEquality().hash(meessage));

  @JsonKey(ignore: true)
  @override
  _$FailureCopyWith<_Failure> get copyWith =>
      __$FailureCopyWithImpl<_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Barcode barcode) initial,
    required TResult Function(Barcode barcode) loading,
    required TResult Function(Barcode barcode) loaded,
    required TResult Function(Barcode barcode, String meessage) failure,
  }) {
    return failure(barcode, meessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
  }) {
    return failure?.call(barcode, meessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Barcode barcode)? initial,
    TResult Function(Barcode barcode)? loading,
    TResult Function(Barcode barcode)? loaded,
    TResult Function(Barcode barcode, String meessage)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(barcode, meessage);
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

abstract class _Failure extends BarcodeState {
  const factory _Failure(Barcode barcode, String meessage) = _$_Failure;
  const _Failure._() : super._();

  @override
  Barcode get barcode;
  String get meessage;
  @override
  @JsonKey(ignore: true)
  _$FailureCopyWith<_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
