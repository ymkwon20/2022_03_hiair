// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_work_order_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentWorkOrderEventTearOff {
  const _$CurrentWorkOrderEventTearOff();

  _FetchCurrentWorkOrder fetchCurrentWorkOrder(
      List<CurrentWorkOrder> items, String yard, String hullNo) {
    return _FetchCurrentWorkOrder(
      items,
      yard,
      hullNo,
    );
  }
}

/// @nodoc
const $CurrentWorkOrderEvent = _$CurrentWorkOrderEventTearOff();

/// @nodoc
mixin _$CurrentWorkOrderEvent {
  List<CurrentWorkOrder> get items => throw _privateConstructorUsedError;
  String get yard => throw _privateConstructorUsedError;
  String get hullNo => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CurrentWorkOrder> items, String yard, String hullNo)
        fetchCurrentWorkOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items, String yard, String hullNo)?
        fetchCurrentWorkOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items, String yard, String hullNo)?
        fetchCurrentWorkOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCurrentWorkOrder value)
        fetchCurrentWorkOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchCurrentWorkOrder value)? fetchCurrentWorkOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCurrentWorkOrder value)? fetchCurrentWorkOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CurrentWorkOrderEventCopyWith<CurrentWorkOrderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWorkOrderEventCopyWith<$Res> {
  factory $CurrentWorkOrderEventCopyWith(CurrentWorkOrderEvent value,
          $Res Function(CurrentWorkOrderEvent) then) =
      _$CurrentWorkOrderEventCopyWithImpl<$Res>;
  $Res call({List<CurrentWorkOrder> items, String yard, String hullNo});
}

/// @nodoc
class _$CurrentWorkOrderEventCopyWithImpl<$Res>
    implements $CurrentWorkOrderEventCopyWith<$Res> {
  _$CurrentWorkOrderEventCopyWithImpl(this._value, this._then);

  final CurrentWorkOrderEvent _value;
  // ignore: unused_field
  final $Res Function(CurrentWorkOrderEvent) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? yard = freezed,
    Object? hullNo = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
      yard: yard == freezed
          ? _value.yard
          : yard // ignore: cast_nullable_to_non_nullable
              as String,
      hullNo: hullNo == freezed
          ? _value.hullNo
          : hullNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FetchCurrentWorkOrderCopyWith<$Res>
    implements $CurrentWorkOrderEventCopyWith<$Res> {
  factory _$FetchCurrentWorkOrderCopyWith(_FetchCurrentWorkOrder value,
          $Res Function(_FetchCurrentWorkOrder) then) =
      __$FetchCurrentWorkOrderCopyWithImpl<$Res>;
  @override
  $Res call({List<CurrentWorkOrder> items, String yard, String hullNo});
}

/// @nodoc
class __$FetchCurrentWorkOrderCopyWithImpl<$Res>
    extends _$CurrentWorkOrderEventCopyWithImpl<$Res>
    implements _$FetchCurrentWorkOrderCopyWith<$Res> {
  __$FetchCurrentWorkOrderCopyWithImpl(_FetchCurrentWorkOrder _value,
      $Res Function(_FetchCurrentWorkOrder) _then)
      : super(_value, (v) => _then(v as _FetchCurrentWorkOrder));

  @override
  _FetchCurrentWorkOrder get _value => super._value as _FetchCurrentWorkOrder;

  @override
  $Res call({
    Object? items = freezed,
    Object? yard = freezed,
    Object? hullNo = freezed,
  }) {
    return _then(_FetchCurrentWorkOrder(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CurrentWorkOrder>,
      yard == freezed
          ? _value.yard
          : yard // ignore: cast_nullable_to_non_nullable
              as String,
      hullNo == freezed
          ? _value.hullNo
          : hullNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchCurrentWorkOrder extends _FetchCurrentWorkOrder {
  const _$_FetchCurrentWorkOrder(this.items, this.yard, this.hullNo)
      : super._();

  @override
  final List<CurrentWorkOrder> items;
  @override
  final String yard;
  @override
  final String hullNo;

  @override
  String toString() {
    return 'CurrentWorkOrderEvent.fetchCurrentWorkOrder(items: $items, yard: $yard, hullNo: $hullNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchCurrentWorkOrder &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.yard, yard) &&
            const DeepCollectionEquality().equals(other.hullNo, hullNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(yard),
      const DeepCollectionEquality().hash(hullNo));

  @JsonKey(ignore: true)
  @override
  _$FetchCurrentWorkOrderCopyWith<_FetchCurrentWorkOrder> get copyWith =>
      __$FetchCurrentWorkOrderCopyWithImpl<_FetchCurrentWorkOrder>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            List<CurrentWorkOrder> items, String yard, String hullNo)
        fetchCurrentWorkOrder,
  }) {
    return fetchCurrentWorkOrder(items, yard, hullNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items, String yard, String hullNo)?
        fetchCurrentWorkOrder,
  }) {
    return fetchCurrentWorkOrder?.call(items, yard, hullNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CurrentWorkOrder> items, String yard, String hullNo)?
        fetchCurrentWorkOrder,
    required TResult orElse(),
  }) {
    if (fetchCurrentWorkOrder != null) {
      return fetchCurrentWorkOrder(items, yard, hullNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchCurrentWorkOrder value)
        fetchCurrentWorkOrder,
  }) {
    return fetchCurrentWorkOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchCurrentWorkOrder value)? fetchCurrentWorkOrder,
  }) {
    return fetchCurrentWorkOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchCurrentWorkOrder value)? fetchCurrentWorkOrder,
    required TResult orElse(),
  }) {
    if (fetchCurrentWorkOrder != null) {
      return fetchCurrentWorkOrder(this);
    }
    return orElse();
  }
}

abstract class _FetchCurrentWorkOrder extends CurrentWorkOrderEvent {
  const factory _FetchCurrentWorkOrder(
          List<CurrentWorkOrder> items, String yard, String hullNo) =
      _$_FetchCurrentWorkOrder;
  const _FetchCurrentWorkOrder._() : super._();

  @override
  List<CurrentWorkOrder> get items;
  @override
  String get yard;
  @override
  String get hullNo;
  @override
  @JsonKey(ignore: true)
  _$FetchCurrentWorkOrderCopyWith<_FetchCurrentWorkOrder> get copyWith =>
      throw _privateConstructorUsedError;
}
