// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_order_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkOrderSaveEventTearOff {
  const _$WorkOrderSaveEventTearOff();

  _SaveWorkOrder saveWorkOrder(
      WorkOrder item, WorkOrderStatus status, int index) {
    return _SaveWorkOrder(
      item,
      status,
      index,
    );
  }

  _SaveWorkOrderList saveWorkOrderList(
      List<WorkOrder> list, WorkOrderStatus status, List<int> indice) {
    return _SaveWorkOrderList(
      list,
      status,
      indice,
    );
  }

  _ResetToNone resetToNone() {
    return const _ResetToNone();
  }
}

/// @nodoc
const $WorkOrderSaveEvent = _$WorkOrderSaveEventTearOff();

/// @nodoc
mixin _$WorkOrderSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WorkOrder item, WorkOrderStatus status, int index)
        saveWorkOrder,
    required TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)
        saveWorkOrderList,
    required TResult Function() resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveWorkOrder value) saveWorkOrder,
    required TResult Function(_SaveWorkOrderList value) saveWorkOrderList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderSaveEventCopyWith<$Res> {
  factory $WorkOrderSaveEventCopyWith(
          WorkOrderSaveEvent value, $Res Function(WorkOrderSaveEvent) then) =
      _$WorkOrderSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$WorkOrderSaveEventCopyWithImpl<$Res>
    implements $WorkOrderSaveEventCopyWith<$Res> {
  _$WorkOrderSaveEventCopyWithImpl(this._value, this._then);

  final WorkOrderSaveEvent _value;
  // ignore: unused_field
  final $Res Function(WorkOrderSaveEvent) _then;
}

/// @nodoc
abstract class _$SaveWorkOrderCopyWith<$Res> {
  factory _$SaveWorkOrderCopyWith(
          _SaveWorkOrder value, $Res Function(_SaveWorkOrder) then) =
      __$SaveWorkOrderCopyWithImpl<$Res>;
  $Res call({WorkOrder item, WorkOrderStatus status, int index});
}

/// @nodoc
class __$SaveWorkOrderCopyWithImpl<$Res>
    extends _$WorkOrderSaveEventCopyWithImpl<$Res>
    implements _$SaveWorkOrderCopyWith<$Res> {
  __$SaveWorkOrderCopyWithImpl(
      _SaveWorkOrder _value, $Res Function(_SaveWorkOrder) _then)
      : super(_value, (v) => _then(v as _SaveWorkOrder));

  @override
  _SaveWorkOrder get _value => super._value as _SaveWorkOrder;

  @override
  $Res call({
    Object? item = freezed,
    Object? status = freezed,
    Object? index = freezed,
  }) {
    return _then(_SaveWorkOrder(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as WorkOrder,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SaveWorkOrder extends _SaveWorkOrder {
  const _$_SaveWorkOrder(this.item, this.status, this.index) : super._();

  @override
  final WorkOrder item;
  @override
  final WorkOrderStatus status;
  @override
  final int index;

  @override
  String toString() {
    return 'WorkOrderSaveEvent.saveWorkOrder(item: $item, status: $status, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveWorkOrder &&
            const DeepCollectionEquality().equals(other.item, item) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.index, index));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(item),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(index));

  @JsonKey(ignore: true)
  @override
  _$SaveWorkOrderCopyWith<_SaveWorkOrder> get copyWith =>
      __$SaveWorkOrderCopyWithImpl<_SaveWorkOrder>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WorkOrder item, WorkOrderStatus status, int index)
        saveWorkOrder,
    required TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)
        saveWorkOrderList,
    required TResult Function() resetToNone,
  }) {
    return saveWorkOrder(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
  }) {
    return saveWorkOrder?.call(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveWorkOrder != null) {
      return saveWorkOrder(item, status, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveWorkOrder value) saveWorkOrder,
    required TResult Function(_SaveWorkOrderList value) saveWorkOrderList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveWorkOrder != null) {
      return saveWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _SaveWorkOrder extends WorkOrderSaveEvent {
  const factory _SaveWorkOrder(
      WorkOrder item, WorkOrderStatus status, int index) = _$_SaveWorkOrder;
  const _SaveWorkOrder._() : super._();

  WorkOrder get item;
  WorkOrderStatus get status;
  int get index;
  @JsonKey(ignore: true)
  _$SaveWorkOrderCopyWith<_SaveWorkOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveWorkOrderListCopyWith<$Res> {
  factory _$SaveWorkOrderListCopyWith(
          _SaveWorkOrderList value, $Res Function(_SaveWorkOrderList) then) =
      __$SaveWorkOrderListCopyWithImpl<$Res>;
  $Res call({List<WorkOrder> list, WorkOrderStatus status, List<int> indice});
}

/// @nodoc
class __$SaveWorkOrderListCopyWithImpl<$Res>
    extends _$WorkOrderSaveEventCopyWithImpl<$Res>
    implements _$SaveWorkOrderListCopyWith<$Res> {
  __$SaveWorkOrderListCopyWithImpl(
      _SaveWorkOrderList _value, $Res Function(_SaveWorkOrderList) _then)
      : super(_value, (v) => _then(v as _SaveWorkOrderList));

  @override
  _SaveWorkOrderList get _value => super._value as _SaveWorkOrderList;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? indice = freezed,
  }) {
    return _then(_SaveWorkOrderList(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<WorkOrder>,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderStatus,
      indice == freezed
          ? _value.indice
          : indice // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_SaveWorkOrderList extends _SaveWorkOrderList {
  const _$_SaveWorkOrderList(this.list, this.status, this.indice) : super._();

  @override
  final List<WorkOrder> list;
  @override
  final WorkOrderStatus status;
  @override
  final List<int> indice;

  @override
  String toString() {
    return 'WorkOrderSaveEvent.saveWorkOrderList(list: $list, status: $status, indice: $indice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveWorkOrderList &&
            const DeepCollectionEquality().equals(other.list, list) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.indice, indice));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(list),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(indice));

  @JsonKey(ignore: true)
  @override
  _$SaveWorkOrderListCopyWith<_SaveWorkOrderList> get copyWith =>
      __$SaveWorkOrderListCopyWithImpl<_SaveWorkOrderList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(WorkOrder item, WorkOrderStatus status, int index)
        saveWorkOrder,
    required TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)
        saveWorkOrderList,
    required TResult Function() resetToNone,
  }) {
    return saveWorkOrderList(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
  }) {
    return saveWorkOrderList?.call(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveWorkOrderList != null) {
      return saveWorkOrderList(list, status, indice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveWorkOrder value) saveWorkOrder,
    required TResult Function(_SaveWorkOrderList value) saveWorkOrderList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveWorkOrderList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveWorkOrderList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveWorkOrderList != null) {
      return saveWorkOrderList(this);
    }
    return orElse();
  }
}

abstract class _SaveWorkOrderList extends WorkOrderSaveEvent {
  const factory _SaveWorkOrderList(
          List<WorkOrder> list, WorkOrderStatus status, List<int> indice) =
      _$_SaveWorkOrderList;
  const _SaveWorkOrderList._() : super._();

  List<WorkOrder> get list;
  WorkOrderStatus get status;
  List<int> get indice;
  @JsonKey(ignore: true)
  _$SaveWorkOrderListCopyWith<_SaveWorkOrderList> get copyWith =>
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
    extends _$WorkOrderSaveEventCopyWithImpl<$Res>
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
    return 'WorkOrderSaveEvent.resetToNone()';
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
    required TResult Function(WorkOrder item, WorkOrderStatus status, int index)
        saveWorkOrder,
    required TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)
        saveWorkOrderList,
    required TResult Function() resetToNone,
  }) {
    return resetToNone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
    TResult Function()? resetToNone,
  }) {
    return resetToNone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(WorkOrder item, WorkOrderStatus status, int index)?
        saveWorkOrder,
    TResult Function(
            List<WorkOrder> list, WorkOrderStatus status, List<int> indice)?
        saveWorkOrderList,
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
    required TResult Function(_SaveWorkOrder value) saveWorkOrder,
    required TResult Function(_SaveWorkOrderList value) saveWorkOrderList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return resetToNone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return resetToNone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveWorkOrder value)? saveWorkOrder,
    TResult Function(_SaveWorkOrderList value)? saveWorkOrderList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (resetToNone != null) {
      return resetToNone(this);
    }
    return orElse();
  }
}

abstract class _ResetToNone extends WorkOrderSaveEvent {
  const factory _ResetToNone() = _$_ResetToNone;
  const _ResetToNone._() : super._();
}
