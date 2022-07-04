// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qm_work_order_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QmWorkOrderSaveEventTearOff {
  const _$QmWorkOrderSaveEventTearOff();

  _SaveQmWorkOrder saveQmWorkOrder(QmWorkOrder item, int index) {
    return _SaveQmWorkOrder(
      item,
      index,
    );
  }

  _ResetToNone resetToNone() {
    return const _ResetToNone();
  }
}

/// @nodoc
const $QmWorkOrderSaveEvent = _$QmWorkOrderSaveEventTearOff();

/// @nodoc
mixin _$QmWorkOrderSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmWorkOrder item, int index) saveQmWorkOrder,
    required TResult Function() resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmWorkOrder value) saveQmWorkOrder,
    required TResult Function(_ResetToNone value) resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QmWorkOrderSaveEventCopyWith<$Res> {
  factory $QmWorkOrderSaveEventCopyWith(QmWorkOrderSaveEvent value,
          $Res Function(QmWorkOrderSaveEvent) then) =
      _$QmWorkOrderSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QmWorkOrderSaveEventCopyWithImpl<$Res>
    implements $QmWorkOrderSaveEventCopyWith<$Res> {
  _$QmWorkOrderSaveEventCopyWithImpl(this._value, this._then);

  final QmWorkOrderSaveEvent _value;
  // ignore: unused_field
  final $Res Function(QmWorkOrderSaveEvent) _then;
}

/// @nodoc
abstract class _$SaveQmWorkOrderCopyWith<$Res> {
  factory _$SaveQmWorkOrderCopyWith(
          _SaveQmWorkOrder value, $Res Function(_SaveQmWorkOrder) then) =
      __$SaveQmWorkOrderCopyWithImpl<$Res>;
  $Res call({QmWorkOrder item, int index});
}

/// @nodoc
class __$SaveQmWorkOrderCopyWithImpl<$Res>
    extends _$QmWorkOrderSaveEventCopyWithImpl<$Res>
    implements _$SaveQmWorkOrderCopyWith<$Res> {
  __$SaveQmWorkOrderCopyWithImpl(
      _SaveQmWorkOrder _value, $Res Function(_SaveQmWorkOrder) _then)
      : super(_value, (v) => _then(v as _SaveQmWorkOrder));

  @override
  _SaveQmWorkOrder get _value => super._value as _SaveQmWorkOrder;

  @override
  $Res call({
    Object? item = freezed,
    Object? index = freezed,
  }) {
    return _then(_SaveQmWorkOrder(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as QmWorkOrder,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SaveQmWorkOrder extends _SaveQmWorkOrder {
  const _$_SaveQmWorkOrder(this.item, this.index) : super._();

  @override
  final QmWorkOrder item;
  @override
  final int index;

  @override
  String toString() {
    return 'QmWorkOrderSaveEvent.saveQmWorkOrder(item: $item, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveQmWorkOrder &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$SaveQmWorkOrderCopyWith<_SaveQmWorkOrder> get copyWith =>
      __$SaveQmWorkOrderCopyWithImpl<_SaveQmWorkOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmWorkOrder item, int index) saveQmWorkOrder,
    required TResult Function() resetToNone,
  }) {
    return saveQmWorkOrder(item, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
  }) {
    return saveQmWorkOrder?.call(item, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmWorkOrder != null) {
      return saveQmWorkOrder(item, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmWorkOrder value) saveQmWorkOrder,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveQmWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveQmWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmWorkOrder != null) {
      return saveQmWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _SaveQmWorkOrder extends QmWorkOrderSaveEvent {
  const factory _SaveQmWorkOrder(QmWorkOrder item, int index) =
      _$_SaveQmWorkOrder;
  const _SaveQmWorkOrder._() : super._();

  QmWorkOrder get item;
  int get index;
  @JsonKey(ignore: true)
  _$SaveQmWorkOrderCopyWith<_SaveQmWorkOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetToNoneCopyWith<$Res> {
  factory _$ResetToNoneCopyWith(
          _ResetToNone value, $Res Function(_ResetToNone) then) =
      __$ResetToNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetToNoneCopyWithImpl<$Res>
    extends _$QmWorkOrderSaveEventCopyWithImpl<$Res>
    implements _$ResetToNoneCopyWith<$Res> {
  __$ResetToNoneCopyWithImpl(
      _ResetToNone _value, $Res Function(_ResetToNone) _then)
      : super(_value, (v) => _then(v as _ResetToNone));

  @override
  _ResetToNone get _value => super._value as _ResetToNone;
}

/// @nodoc

class _$_ResetToNone extends _ResetToNone {
  const _$_ResetToNone() : super._();

  @override
  String toString() {
    return 'QmWorkOrderSaveEvent.resetToNone()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ResetToNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmWorkOrder item, int index) saveQmWorkOrder,
    required TResult Function() resetToNone,
  }) {
    return resetToNone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
  }) {
    return resetToNone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmWorkOrder item, int index)? saveQmWorkOrder,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (resetToNone != null) {
      return resetToNone();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmWorkOrder value) saveQmWorkOrder,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return resetToNone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return resetToNone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmWorkOrder value)? saveQmWorkOrder,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (resetToNone != null) {
      return resetToNone(this);
    }
    return orElse();
  }
}

abstract class _ResetToNone extends QmWorkOrderSaveEvent {
  const factory _ResetToNone() = _$_ResetToNone;
  const _ResetToNone._() : super._();
}
