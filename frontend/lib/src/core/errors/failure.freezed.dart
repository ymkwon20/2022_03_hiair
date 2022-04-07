// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$FailureTearOff {
  const _$FailureTearOff();

  _Internal internal([String? message]) {
    return _Internal(
      message,
    );
  }

  _Server server([String? message]) {
    return _Server(
      message,
    );
  }

  _NoConnection noConnection() {
    return const _NoConnection();
  }
}

/// @nodoc
const $Failure = _$FailureTearOff();

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) internal,
    required TResult Function(String? message) server,
    required TResult Function() noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Internal value) internal,
    required TResult Function(_Server value) server,
    required TResult Function(_NoConnection value) noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  final Failure _value;
  // ignore: unused_field
  final $Res Function(Failure) _then;
}

/// @nodoc
abstract class _$InternalCopyWith<$Res> {
  factory _$InternalCopyWith(_Internal value, $Res Function(_Internal) then) =
      __$InternalCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$InternalCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$InternalCopyWith<$Res> {
  __$InternalCopyWithImpl(_Internal _value, $Res Function(_Internal) _then)
      : super(_value, (v) => _then(v as _Internal));

  @override
  _Internal get _value => super._value as _Internal;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Internal(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Internal extends _Internal {
  const _$_Internal([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.internal(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Internal &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$InternalCopyWith<_Internal> get copyWith =>
      __$InternalCopyWithImpl<_Internal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) internal,
    required TResult Function(String? message) server,
    required TResult Function() noConnection,
  }) {
    return internal(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
  }) {
    return internal?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Internal value) internal,
    required TResult Function(_Server value) server,
    required TResult Function(_NoConnection value) noConnection,
  }) {
    return internal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
  }) {
    return internal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(this);
    }
    return orElse();
  }
}

abstract class _Internal extends Failure {
  const factory _Internal([String? message]) = _$_Internal;
  const _Internal._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$InternalCopyWith<_Internal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ServerCopyWith<$Res> {
  factory _$ServerCopyWith(_Server value, $Res Function(_Server) then) =
      __$ServerCopyWithImpl<$Res>;
  $Res call({String? message});
}

/// @nodoc
class __$ServerCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$ServerCopyWith<$Res> {
  __$ServerCopyWithImpl(_Server _value, $Res Function(_Server) _then)
      : super(_value, (v) => _then(v as _Server));

  @override
  _Server get _value => super._value as _Server;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_Server(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Server extends _Server {
  const _$_Server([this.message]) : super._();

  @override
  final String? message;

  @override
  String toString() {
    return 'Failure.server(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Server &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$ServerCopyWith<_Server> get copyWith =>
      __$ServerCopyWithImpl<_Server>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) internal,
    required TResult Function(String? message) server,
    required TResult Function() noConnection,
  }) {
    return server(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
  }) {
    return server?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Internal value) internal,
    required TResult Function(_Server value) server,
    required TResult Function(_NoConnection value) noConnection,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class _Server extends Failure {
  const factory _Server([String? message]) = _$_Server;
  const _Server._() : super._();

  String? get message;
  @JsonKey(ignore: true)
  _$ServerCopyWith<_Server> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$NoConnectionCopyWith<$Res> {
  factory _$NoConnectionCopyWith(
          _NoConnection value, $Res Function(_NoConnection) then) =
      __$NoConnectionCopyWithImpl<$Res>;
}

/// @nodoc
class __$NoConnectionCopyWithImpl<$Res> extends _$FailureCopyWithImpl<$Res>
    implements _$NoConnectionCopyWith<$Res> {
  __$NoConnectionCopyWithImpl(
      _NoConnection _value, $Res Function(_NoConnection) _then)
      : super(_value, (v) => _then(v as _NoConnection));

  @override
  _NoConnection get _value => super._value as _NoConnection;
}

/// @nodoc

class _$_NoConnection extends _NoConnection {
  const _$_NoConnection() : super._();

  @override
  String toString() {
    return 'Failure.noConnection()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NoConnection);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? message) internal,
    required TResult Function(String? message) server,
    required TResult Function() noConnection,
  }) {
    return noConnection();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
  }) {
    return noConnection?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? message)? internal,
    TResult Function(String? message)? server,
    TResult Function()? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Internal value) internal,
    required TResult Function(_Server value) server,
    required TResult Function(_NoConnection value) noConnection,
  }) {
    return noConnection(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
  }) {
    return noConnection?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Internal value)? internal,
    TResult Function(_Server value)? server,
    TResult Function(_NoConnection value)? noConnection,
    required TResult orElse(),
  }) {
    if (noConnection != null) {
      return noConnection(this);
    }
    return orElse();
  }
}

abstract class _NoConnection extends Failure {
  const factory _NoConnection() = _$_NoConnection;
  const _NoConnection._() : super._();
}
