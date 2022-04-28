// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  _LoadStoredUser loadStoredUser() {
    return const _LoadStoredUser();
  }

  _SignIn signIn(Map<String, dynamic> params) {
    return _SignIn(
      params,
    );
  }

  _SignOut signOut() {
    return const _SignOut();
  }
}

/// @nodoc
const $AuthEvent = _$AuthEventTearOff();

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStoredUser,
    required TResult Function(Map<String, dynamic> params) signIn,
    required TResult Function() signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStoredUser value) loadStoredUser,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignOut value) signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

/// @nodoc
abstract class _$LoadStoredUserCopyWith<$Res> {
  factory _$LoadStoredUserCopyWith(
          _LoadStoredUser value, $Res Function(_LoadStoredUser) then) =
      __$LoadStoredUserCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadStoredUserCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$LoadStoredUserCopyWith<$Res> {
  __$LoadStoredUserCopyWithImpl(
      _LoadStoredUser _value, $Res Function(_LoadStoredUser) _then)
      : super(_value, (v) => _then(v as _LoadStoredUser));

  @override
  _LoadStoredUser get _value => super._value as _LoadStoredUser;
}

/// @nodoc

class _$_LoadStoredUser extends _LoadStoredUser {
  const _$_LoadStoredUser() : super._();

  @override
  String toString() {
    return 'AuthEvent.loadStoredUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadStoredUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStoredUser,
    required TResult Function(Map<String, dynamic> params) signIn,
    required TResult Function() signOut,
  }) {
    return loadStoredUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
  }) {
    return loadStoredUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (loadStoredUser != null) {
      return loadStoredUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStoredUser value) loadStoredUser,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignOut value) signOut,
  }) {
    return loadStoredUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
  }) {
    return loadStoredUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (loadStoredUser != null) {
      return loadStoredUser(this);
    }
    return orElse();
  }
}

abstract class _LoadStoredUser extends AuthEvent {
  const factory _LoadStoredUser() = _$_LoadStoredUser;
  const _LoadStoredUser._() : super._();
}

/// @nodoc
abstract class _$SignInCopyWith<$Res> {
  factory _$SignInCopyWith(_SignIn value, $Res Function(_SignIn) then) =
      __$SignInCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> params});
}

/// @nodoc
class __$SignInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$SignInCopyWith<$Res> {
  __$SignInCopyWithImpl(_SignIn _value, $Res Function(_SignIn) _then)
      : super(_value, (v) => _then(v as _SignIn));

  @override
  _SignIn get _value => super._value as _SignIn;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_SignIn(
      params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_SignIn extends _SignIn {
  const _$_SignIn(this.params) : super._();

  @override
  final Map<String, dynamic> params;

  @override
  String toString() {
    return 'AuthEvent.signIn(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignIn &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$SignInCopyWith<_SignIn> get copyWith =>
      __$SignInCopyWithImpl<_SignIn>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStoredUser,
    required TResult Function(Map<String, dynamic> params) signIn,
    required TResult Function() signOut,
  }) {
    return signIn(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
  }) {
    return signIn?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStoredUser value) loadStoredUser,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn extends AuthEvent {
  const factory _SignIn(Map<String, dynamic> params) = _$_SignIn;
  const _SignIn._() : super._();

  Map<String, dynamic> get params;
  @JsonKey(ignore: true)
  _$SignInCopyWith<_SignIn> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SignOutCopyWith<$Res> {
  factory _$SignOutCopyWith(_SignOut value, $Res Function(_SignOut) then) =
      __$SignOutCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements _$SignOutCopyWith<$Res> {
  __$SignOutCopyWithImpl(_SignOut _value, $Res Function(_SignOut) _then)
      : super(_value, (v) => _then(v as _SignOut));

  @override
  _SignOut get _value => super._value as _SignOut;
}

/// @nodoc

class _$_SignOut extends _SignOut {
  const _$_SignOut() : super._();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadStoredUser,
    required TResult Function(Map<String, dynamic> params) signIn,
    required TResult Function() signOut,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadStoredUser,
    TResult Function(Map<String, dynamic> params)? signIn,
    TResult Function()? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadStoredUser value) loadStoredUser,
    required TResult Function(_SignIn value) signIn,
    required TResult Function(_SignOut value) signOut,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadStoredUser value)? loadStoredUser,
    TResult Function(_SignIn value)? signIn,
    TResult Function(_SignOut value)? signOut,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut extends AuthEvent {
  const factory _SignOut() = _$_SignOut;
  const _SignOut._() : super._();
}
