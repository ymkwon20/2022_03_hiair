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

  _FetchChecklist fetchChecklist(WorkOrder order) {
    return _FetchChecklist(
      order,
    );
  }
}

/// @nodoc
const $ChecklistEvent = _$ChecklistEventTearOff();

/// @nodoc
mixin _$ChecklistEvent {
  WorkOrder get order => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WorkOrder order) fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder order)? fetchChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder order)? fetchChecklist,
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
  $Res call({WorkOrder order});
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
    Object? order = freezed,
  }) {
    return _then(_value.copyWith(
      order: order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as WorkOrder,
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
  $Res call({WorkOrder order});
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
    Object? order = freezed,
  }) {
    return _then(_FetchChecklist(
      order == freezed
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as WorkOrder,
    ));
  }
}

/// @nodoc

class _$_FetchChecklist extends _FetchChecklist {
  const _$_FetchChecklist(this.order) : super._();

  @override
  final WorkOrder order;

  @override
  String toString() {
    return 'ChecklistEvent.fetchChecklist(order: $order)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchChecklist &&
            const DeepCollectionEquality().equals(other.order, order));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(order));

  @JsonKey(ignore: true)
  @override
  _$FetchChecklistCopyWith<_FetchChecklist> get copyWith =>
      __$FetchChecklistCopyWithImpl<_FetchChecklist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WorkOrder order) fetchChecklist,
  }) {
    return fetchChecklist(order);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder order)? fetchChecklist,
  }) {
    return fetchChecklist?.call(order);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder order)? fetchChecklist,
    required TResult orElse(),
  }) {
    if (fetchChecklist != null) {
      return fetchChecklist(order);
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
  const factory _FetchChecklist(WorkOrder order) = _$_FetchChecklist;
  const _FetchChecklist._() : super._();

  @override
  WorkOrder get order;
  @override
  @JsonKey(ignore: true)
  _$FetchChecklistCopyWith<_FetchChecklist> get copyWith =>
      throw _privateConstructorUsedError;
}
