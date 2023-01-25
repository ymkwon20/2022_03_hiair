// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'work_order_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WorkOrderEventTearOff {
  const _$WorkOrderEventTearOff();

  _FetchListByPage fetchListByPage(List<WorkOrder> items, int page) {
    return _FetchListByPage(
      items,
      page,
    );
  }

  _SearchByYardHullNo searchByYardHullNo(
      List<WorkOrder> items, int page, String yard, String hullNo) {
    return _SearchByYardHullNo(
      items,
      page,
      yard,
      hullNo,
    );
  }
}

/// @nodoc
const $WorkOrderEvent = _$WorkOrderEventTearOff();

/// @nodoc
mixin _$WorkOrderEvent {
  List<WorkOrder> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WorkOrder> items, int page) fetchListByPage,
    required TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)
        searchByYardHullNo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchByYardHullNo value) searchByYardHullNo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkOrderEventCopyWith<WorkOrderEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderEventCopyWith<$Res> {
  factory $WorkOrderEventCopyWith(
          WorkOrderEvent value, $Res Function(WorkOrderEvent) then) =
      _$WorkOrderEventCopyWithImpl<$Res>;
  $Res call({List<WorkOrder> items, int page});
}

/// @nodoc
class _$WorkOrderEventCopyWithImpl<$Res>
    implements $WorkOrderEventCopyWith<$Res> {
  _$WorkOrderEventCopyWithImpl(this._value, this._then);

  final WorkOrderEvent _value;
  // ignore: unused_field
  final $Res Function(WorkOrderEvent) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WorkOrder>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FetchListByPageCopyWith<$Res>
    implements $WorkOrderEventCopyWith<$Res> {
  factory _$FetchListByPageCopyWith(
          _FetchListByPage value, $Res Function(_FetchListByPage) then) =
      __$FetchListByPageCopyWithImpl<$Res>;
  @override
  $Res call({List<WorkOrder> items, int page});
}

/// @nodoc
class __$FetchListByPageCopyWithImpl<$Res>
    extends _$WorkOrderEventCopyWithImpl<$Res>
    implements _$FetchListByPageCopyWith<$Res> {
  __$FetchListByPageCopyWithImpl(
      _FetchListByPage _value, $Res Function(_FetchListByPage) _then)
      : super(_value, (v) => _then(v as _FetchListByPage));

  @override
  _FetchListByPage get _value => super._value as _FetchListByPage;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
  }) {
    return _then(_FetchListByPage(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WorkOrder>,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchListByPage extends _FetchListByPage {
  const _$_FetchListByPage(this.items, this.page) : super._();

  @override
  final List<WorkOrder> items;
  @override
  final int page;

  @override
  String toString() {
    return 'WorkOrderEvent.fetchListByPage(items: $items, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchListByPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.page, page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(page));

  @JsonKey(ignore: true)
  @override
  _$FetchListByPageCopyWith<_FetchListByPage> get copyWith =>
      __$FetchListByPageCopyWithImpl<_FetchListByPage>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WorkOrder> items, int page) fetchListByPage,
    required TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)
        searchByYardHullNo,
  }) {
    return fetchListByPage(items, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
  }) {
    return fetchListByPage?.call(items, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
    required TResult orElse(),
  }) {
    if (fetchListByPage != null) {
      return fetchListByPage(items, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchByYardHullNo value) searchByYardHullNo,
  }) {
    return fetchListByPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
  }) {
    return fetchListByPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
    required TResult orElse(),
  }) {
    if (fetchListByPage != null) {
      return fetchListByPage(this);
    }
    return orElse();
  }
}

abstract class _FetchListByPage extends WorkOrderEvent {
  const factory _FetchListByPage(List<WorkOrder> items, int page) =
      _$_FetchListByPage;
  const _FetchListByPage._() : super._();

  @override
  List<WorkOrder> get items;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$FetchListByPageCopyWith<_FetchListByPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SearchByYardHullNoCopyWith<$Res>
    implements $WorkOrderEventCopyWith<$Res> {
  factory _$SearchByYardHullNoCopyWith(
          _SearchByYardHullNo value, $Res Function(_SearchByYardHullNo) then) =
      __$SearchByYardHullNoCopyWithImpl<$Res>;
  @override
  $Res call({List<WorkOrder> items, int page, String yard, String hullNo});
}

/// @nodoc
class __$SearchByYardHullNoCopyWithImpl<$Res>
    extends _$WorkOrderEventCopyWithImpl<$Res>
    implements _$SearchByYardHullNoCopyWith<$Res> {
  __$SearchByYardHullNoCopyWithImpl(
      _SearchByYardHullNo _value, $Res Function(_SearchByYardHullNo) _then)
      : super(_value, (v) => _then(v as _SearchByYardHullNo));

  @override
  _SearchByYardHullNo get _value => super._value as _SearchByYardHullNo;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
    Object? yard = freezed,
    Object? hullNo = freezed,
  }) {
    return _then(_SearchByYardHullNo(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<WorkOrder>,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
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

class _$_SearchByYardHullNo extends _SearchByYardHullNo {
  const _$_SearchByYardHullNo(this.items, this.page, this.yard, this.hullNo)
      : super._();

  @override
  final List<WorkOrder> items;
  @override
  final int page;
  @override
  final String yard;
  @override
  final String hullNo;

  @override
  String toString() {
    return 'WorkOrderEvent.searchByYardHullNo(items: $items, page: $page, yard: $yard, hullNo: $hullNo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchByYardHullNo &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality().equals(other.yard, yard) &&
            const DeepCollectionEquality().equals(other.hullNo, hullNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(yard),
      const DeepCollectionEquality().hash(hullNo));

  @JsonKey(ignore: true)
  @override
  _$SearchByYardHullNoCopyWith<_SearchByYardHullNo> get copyWith =>
      __$SearchByYardHullNoCopyWithImpl<_SearchByYardHullNo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<WorkOrder> items, int page) fetchListByPage,
    required TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)
        searchByYardHullNo,
  }) {
    return searchByYardHullNo(items, page, yard, hullNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
  }) {
    return searchByYardHullNo?.call(items, page, yard, hullNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<WorkOrder> items, int page)? fetchListByPage,
    TResult Function(
            List<WorkOrder> items, int page, String yard, String hullNo)?
        searchByYardHullNo,
    required TResult orElse(),
  }) {
    if (searchByYardHullNo != null) {
      return searchByYardHullNo(items, page, yard, hullNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchByYardHullNo value) searchByYardHullNo,
  }) {
    return searchByYardHullNo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
  }) {
    return searchByYardHullNo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchByYardHullNo value)? searchByYardHullNo,
    required TResult orElse(),
  }) {
    if (searchByYardHullNo != null) {
      return searchByYardHullNo(this);
    }
    return orElse();
  }
}

abstract class _SearchByYardHullNo extends WorkOrderEvent {
  const factory _SearchByYardHullNo(
          List<WorkOrder> items, int page, String yard, String hullNo) =
      _$_SearchByYardHullNo;
  const _SearchByYardHullNo._() : super._();

  @override
  List<WorkOrder> get items;
  @override
  int get page;
  String get yard;
  String get hullNo;
  @override
  @JsonKey(ignore: true)
  _$SearchByYardHullNoCopyWith<_SearchByYardHullNo> get copyWith =>
      throw _privateConstructorUsedError;
}
