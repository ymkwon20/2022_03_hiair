// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'settings_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsEventTearOff {
  const _$SettingsEventTearOff();

  _LoadTheme loadTheme() {
    return const _LoadTheme();
  }

  _UpdateTheme updateTheme(String theme) {
    return _UpdateTheme(
      theme,
    );
  }
}

/// @nodoc
const $SettingsEvent = _$SettingsEventTearOff();

/// @nodoc
mixin _$SettingsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateTheme value) updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsEventCopyWith<$Res> {
  factory $SettingsEventCopyWith(
          SettingsEvent value, $Res Function(SettingsEvent) then) =
      _$SettingsEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SettingsEventCopyWithImpl<$Res>
    implements $SettingsEventCopyWith<$Res> {
  _$SettingsEventCopyWithImpl(this._value, this._then);

  final SettingsEvent _value;
  // ignore: unused_field
  final $Res Function(SettingsEvent) _then;
}

/// @nodoc
abstract class _$LoadThemeCopyWith<$Res> {
  factory _$LoadThemeCopyWith(
          _LoadTheme value, $Res Function(_LoadTheme) then) =
      __$LoadThemeCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadThemeCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$LoadThemeCopyWith<$Res> {
  __$LoadThemeCopyWithImpl(_LoadTheme _value, $Res Function(_LoadTheme) _then)
      : super(_value, (v) => _then(v as _LoadTheme));

  @override
  _LoadTheme get _value => super._value as _LoadTheme;
}

/// @nodoc

class _$_LoadTheme extends _LoadTheme {
  const _$_LoadTheme() : super._();

  @override
  String toString() {
    return 'SettingsEvent.loadTheme()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadTheme);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateTheme,
  }) {
    return loadTheme();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
  }) {
    return loadTheme?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
    required TResult orElse(),
  }) {
    if (loadTheme != null) {
      return loadTheme();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateTheme value) updateTheme,
  }) {
    return loadTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
  }) {
    return loadTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
    required TResult orElse(),
  }) {
    if (loadTheme != null) {
      return loadTheme(this);
    }
    return orElse();
  }
}

abstract class _LoadTheme extends SettingsEvent {
  const factory _LoadTheme() = _$_LoadTheme;
  const _LoadTheme._() : super._();
}

/// @nodoc
abstract class _$UpdateThemeCopyWith<$Res> {
  factory _$UpdateThemeCopyWith(
          _UpdateTheme value, $Res Function(_UpdateTheme) then) =
      __$UpdateThemeCopyWithImpl<$Res>;
  $Res call({String theme});
}

/// @nodoc
class __$UpdateThemeCopyWithImpl<$Res> extends _$SettingsEventCopyWithImpl<$Res>
    implements _$UpdateThemeCopyWith<$Res> {
  __$UpdateThemeCopyWithImpl(
      _UpdateTheme _value, $Res Function(_UpdateTheme) _then)
      : super(_value, (v) => _then(v as _UpdateTheme));

  @override
  _UpdateTheme get _value => super._value as _UpdateTheme;

  @override
  $Res call({
    Object? theme = freezed,
  }) {
    return _then(_UpdateTheme(
      theme == freezed
          ? _value.theme
          : theme // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UpdateTheme extends _UpdateTheme {
  const _$_UpdateTheme(this.theme) : super._();

  @override
  final String theme;

  @override
  String toString() {
    return 'SettingsEvent.updateTheme(theme: $theme)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTheme &&
            const DeepCollectionEquality().equals(other.theme, theme));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(theme));

  @JsonKey(ignore: true)
  @override
  _$UpdateThemeCopyWith<_UpdateTheme> get copyWith =>
      __$UpdateThemeCopyWithImpl<_UpdateTheme>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadTheme,
    required TResult Function(String theme) updateTheme,
  }) {
    return updateTheme(theme);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
  }) {
    return updateTheme?.call(theme);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadTheme,
    TResult Function(String theme)? updateTheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(theme);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadTheme value) loadTheme,
    required TResult Function(_UpdateTheme value) updateTheme,
  }) {
    return updateTheme(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
  }) {
    return updateTheme?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadTheme value)? loadTheme,
    TResult Function(_UpdateTheme value)? updateTheme,
    required TResult orElse(),
  }) {
    if (updateTheme != null) {
      return updateTheme(this);
    }
    return orElse();
  }
}

abstract class _UpdateTheme extends SettingsEvent {
  const factory _UpdateTheme(String theme) = _$_UpdateTheme;
  const _UpdateTheme._() : super._();

  String get theme;
  @JsonKey(ignore: true)
  _$UpdateThemeCopyWith<_UpdateTheme> get copyWith =>
      throw _privateConstructorUsedError;
}
