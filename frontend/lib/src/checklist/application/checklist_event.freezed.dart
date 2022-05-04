// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checklist_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChecklistEventTearOff {
  const _$ChecklistEventTearOff();

  _FetchChecklist fetchChecklist(Map<String, dynamic> params) {
    return _FetchChecklist(
      params,
    );
  }
}

/// @nodoc
const $ChecklistEvent = _$ChecklistEventTearOff();

/// @nodoc
mixin _$ChecklistEvent {
  Map<String, dynamic> get params => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> params) fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<String, dynamic> params)? fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> params)? fetchChecklist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChecklist value) fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchChecklist value)? fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChecklist value)? fetchChecklist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChecklistEventCopyWith<ChecklistEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistEventCopyWith<$Res> {
  factory $ChecklistEventCopyWith(
          ChecklistEvent value, $Res Function(ChecklistEvent) then) =
      _$ChecklistEventCopyWithImpl<$Res>;
  $Res call({Map<String, dynamic> params});
}

/// @nodoc
class _$ChecklistEventCopyWithImpl<$Res>
    implements $ChecklistEventCopyWith<$Res> {
  _$ChecklistEventCopyWithImpl(this._value, this._then);

  final ChecklistEvent _value;
  // ignore: unused_field
  final $Res Function(ChecklistEvent) _then;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_value.copyWith(
      params: params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc
abstract class _$FetchChecklistCopyWith<$Res>
    implements $ChecklistEventCopyWith<$Res> {
  factory _$FetchChecklistCopyWith(
          _FetchChecklist value, $Res Function(_FetchChecklist) then) =
      __$FetchChecklistCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, dynamic> params});
}

/// @nodoc
class __$FetchChecklistCopyWithImpl<$Res>
    extends _$ChecklistEventCopyWithImpl<$Res>
    implements _$FetchChecklistCopyWith<$Res> {
  __$FetchChecklistCopyWithImpl(
      _FetchChecklist _value, $Res Function(_FetchChecklist) _then)
      : super(_value, (v) => _then(v as _FetchChecklist));

  @override
  _FetchChecklist get _value => super._value as _FetchChecklist;

  @override
  $Res call({
    Object? params = freezed,
  }) {
    return _then(_FetchChecklist(
      params == freezed
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$_FetchChecklist extends _FetchChecklist {
  const _$_FetchChecklist(this.params) : super._();

  @override
  final Map<String, dynamic> params;

  @override
  String toString() {
    return 'ChecklistEvent.fetchChecklist(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchChecklist &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  _$FetchChecklistCopyWith<_FetchChecklist> get copyWith =>
      __$FetchChecklistCopyWithImpl<_FetchChecklist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Map<String, dynamic> params) fetchChecklist,
  }) {
    return fetchChecklist(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Map<String, dynamic> params)? fetchChecklist,
  }) {
    return fetchChecklist?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> params)? fetchChecklist,
    required TResult orElse(),
  }) {
    if (fetchChecklist != null) {
      return fetchChecklist(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchChecklist value) fetchChecklist,
  }) {
    return fetchChecklist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchChecklist value)? fetchChecklist,
  }) {
    return fetchChecklist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchChecklist value)? fetchChecklist,
    required TResult orElse(),
  }) {
    if (fetchChecklist != null) {
      return fetchChecklist(this);
    }
    return orElse();
  }
}

abstract class _FetchChecklist extends ChecklistEvent {
  const factory _FetchChecklist(Map<String, dynamic> params) =
      _$_FetchChecklist;
  const _FetchChecklist._() : super._();

  @override
  Map<String, dynamic> get params;
  @override
  @JsonKey(ignore: true)
  _$FetchChecklistCopyWith<_FetchChecklist> get copyWith =>
      throw _privateConstructorUsedError;
}
