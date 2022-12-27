// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'impeller_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImpellerEventTearOff {
  const _$ImpellerEventTearOff();

  _FetchListByPage fetchListByPage(List<Impeller> items, int page) {
    return _FetchListByPage(
      items,
      page,
    );
  }
}

/// @nodoc
const $ImpellerEvent = _$ImpellerEventTearOff();

/// @nodoc
mixin _$ImpellerEvent {
  List<Impeller> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Impeller> items, int page) fetchListByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Impeller> items, int page)? fetchListByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Impeller> items, int page)? fetchListByPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchListByPage value) fetchListByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImpellerEventCopyWith<ImpellerEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpellerEventCopyWith<$Res> {
  factory $ImpellerEventCopyWith(
          ImpellerEvent value, $Res Function(ImpellerEvent) then) =
      _$ImpellerEventCopyWithImpl<$Res>;
  $Res call({List<Impeller> items, int page});
}

/// @nodoc
class _$ImpellerEventCopyWithImpl<$Res>
    implements $ImpellerEventCopyWith<$Res> {
  _$ImpellerEventCopyWithImpl(this._value, this._then);

  final ImpellerEvent _value;
  // ignore: unused_field
  final $Res Function(ImpellerEvent) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<Impeller>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FetchListByPageCopyWith<$Res>
    implements $ImpellerEventCopyWith<$Res> {
  factory _$FetchListByPageCopyWith(
          _FetchListByPage value, $Res Function(_FetchListByPage) then) =
      __$FetchListByPageCopyWithImpl<$Res>;
  @override
  $Res call({List<Impeller> items, int page});
}

/// @nodoc
class __$FetchListByPageCopyWithImpl<$Res>
    extends _$ImpellerEventCopyWithImpl<$Res>
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
              as List<Impeller>,
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
  final List<Impeller> items;
  @override
  final int page;

  @override
  String toString() {
    return 'ImpellerEvent.fetchListByPage(items: $items, page: $page)';
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
    required TResult Function(List<Impeller> items, int page) fetchListByPage,
  }) {
    return fetchListByPage(items, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<Impeller> items, int page)? fetchListByPage,
  }) {
    return fetchListByPage?.call(items, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Impeller> items, int page)? fetchListByPage,
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
  }) {
    return fetchListByPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
  }) {
    return fetchListByPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchListByPage value)? fetchListByPage,
    required TResult orElse(),
  }) {
    if (fetchListByPage != null) {
      return fetchListByPage(this);
    }
    return orElse();
  }
}

abstract class _FetchListByPage extends ImpellerEvent {
  const factory _FetchListByPage(List<Impeller> items, int page) =
      _$_FetchListByPage;
  const _FetchListByPage._() : super._();

  @override
  List<Impeller> get items;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$FetchListByPageCopyWith<_FetchListByPage> get copyWith =>
      throw _privateConstructorUsedError;
}
