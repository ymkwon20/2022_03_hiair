// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qm_work_order_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QmWorkOrderEventTearOff {
  const _$QmWorkOrderEventTearOff();

  _FetchListByPage fetchListByPage() {
    return const _FetchListByPage();
  }

  _SearchQMList searchQMList(String startDate, String endDate) {
    return _SearchQMList(
      startDate,
      endDate,
    );
  }
}

/// @nodoc
const $QmWorkOrderEvent = _$QmWorkOrderEventTearOff();

/// @nodoc
mixin _$QmWorkOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchListByPage,
    required TResult Function(String startDate, String endDate) searchQMList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchQMList value) searchQMList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QmWorkOrderEventCopyWith<$Res> {
  factory $QmWorkOrderEventCopyWith(
          QmWorkOrderEvent value, $Res Function(QmWorkOrderEvent) then) =
      _$QmWorkOrderEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QmWorkOrderEventCopyWithImpl<$Res>
    implements $QmWorkOrderEventCopyWith<$Res> {
  _$QmWorkOrderEventCopyWithImpl(this._value, this._then);

  final QmWorkOrderEvent _value;
  // ignore: unused_field
  final $Res Function(QmWorkOrderEvent) _then;
}

/// @nodoc
abstract class _$FetchListByPageCopyWith<$Res> {
  factory _$FetchListByPageCopyWith(
          _FetchListByPage value, $Res Function(_FetchListByPage) then) =
      __$FetchListByPageCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchListByPageCopyWithImpl<$Res>
    extends _$QmWorkOrderEventCopyWithImpl<$Res>
    implements _$FetchListByPageCopyWith<$Res> {
  __$FetchListByPageCopyWithImpl(
      _FetchListByPage _value, $Res Function(_FetchListByPage) _then)
      : super(_value, (v) => _then(v as _FetchListByPage));

  @override
  _FetchListByPage get _value => super._value as _FetchListByPage;
}

/// @nodoc

class _$_FetchListByPage extends _FetchListByPage {
  const _$_FetchListByPage() : super._();

  @override
  String toString() {
    return 'QmWorkOrderEvent.fetchListByPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _FetchListByPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchListByPage,
    required TResult Function(String startDate, String endDate) searchQMList,
  }) {
    return fetchListByPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
  }) {
    return fetchListByPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
    required TResult orElse(),
  }) {
    if (fetchListByPage != null) {
      return fetchListByPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchQMList value) searchQMList,
  }) {
    return fetchListByPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
  }) {
    return fetchListByPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
    required TResult orElse(),
  }) {
    if (fetchListByPage != null) {
      return fetchListByPage(this);
    }
    return orElse();
  }
}

abstract class _FetchListByPage extends QmWorkOrderEvent {
  const factory _FetchListByPage() = _$_FetchListByPage;
  const _FetchListByPage._() : super._();
}

/// @nodoc
abstract class _$SearchQMListCopyWith<$Res> {
  factory _$SearchQMListCopyWith(
          _SearchQMList value, $Res Function(_SearchQMList) then) =
      __$SearchQMListCopyWithImpl<$Res>;
  $Res call({String startDate, String endDate});
}

/// @nodoc
class __$SearchQMListCopyWithImpl<$Res>
    extends _$QmWorkOrderEventCopyWithImpl<$Res>
    implements _$SearchQMListCopyWith<$Res> {
  __$SearchQMListCopyWithImpl(
      _SearchQMList _value, $Res Function(_SearchQMList) _then)
      : super(_value, (v) => _then(v as _SearchQMList));

  @override
  _SearchQMList get _value => super._value as _SearchQMList;

  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_SearchQMList(
      startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String,
      endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchQMList extends _SearchQMList {
  const _$_SearchQMList(this.startDate, this.endDate) : super._();

  @override
  final String startDate;
  @override
  final String endDate;

  @override
  String toString() {
    return 'QmWorkOrderEvent.searchQMList(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SearchQMList &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.endDate, endDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(endDate));

  @JsonKey(ignore: true)
  @override
  _$SearchQMListCopyWith<_SearchQMList> get copyWith =>
      __$SearchQMListCopyWithImpl<_SearchQMList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchListByPage,
    required TResult Function(String startDate, String endDate) searchQMList,
  }) {
    return searchQMList(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
  }) {
    return searchQMList?.call(startDate, endDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchListByPage,
    TResult Function(String startDate, String endDate)? searchQMList,
    required TResult orElse(),
  }) {
    if (searchQMList != null) {
      return searchQMList(startDate, endDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
    required TResult Function(_SearchQMList value) searchQMList,
  }) {
    return searchQMList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
  }) {
    return searchQMList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    TResult Function(_SearchQMList value)? searchQMList,
    required TResult orElse(),
  }) {
    if (searchQMList != null) {
      return searchQMList(this);
    }
    return orElse();
  }
}

abstract class _SearchQMList extends QmWorkOrderEvent {
  const factory _SearchQMList(String startDate, String endDate) =
      _$_SearchQMList;
  const _SearchQMList._() : super._();

  String get startDate;
  String get endDate;
  @JsonKey(ignore: true)
  _$SearchQMListCopyWith<_SearchQMList> get copyWith =>
      throw _privateConstructorUsedError;
}
