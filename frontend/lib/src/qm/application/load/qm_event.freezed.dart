// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qm_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QmEventTearOff {
  const _$QmEventTearOff();

  _FetchQmItems fetchQmItemsByPage(List<QmItem> items, int page) {
    return _FetchQmItems(
      items,
      page,
    );
  }
}

/// @nodoc
const $QmEvent = _$QmEventTearOff();

/// @nodoc
mixin _$QmEvent {
  List<QmItem> get items => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QmItem> items, int page) fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<QmItem> items, int page)? fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QmItem> items, int page)? fetchQmItemsByPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchQmItems value) fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchQmItems value)? fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchQmItems value)? fetchQmItemsByPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QmEventCopyWith<QmEvent> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QmEventCopyWith<$Res> {
  factory $QmEventCopyWith(QmEvent value, $Res Function(QmEvent) then) =
      _$QmEventCopyWithImpl<$Res>;
  $Res call({List<QmItem> items, int page});
}

/// @nodoc
class _$QmEventCopyWithImpl<$Res> implements $QmEventCopyWith<$Res> {
  _$QmEventCopyWithImpl(this._value, this._then);

  final QmEvent _value;
  // ignore: unused_field
  final $Res Function(QmEvent) _then;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QmItem>,
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$FetchQmItemsCopyWith<$Res> implements $QmEventCopyWith<$Res> {
  factory _$FetchQmItemsCopyWith(
          _FetchQmItems value, $Res Function(_FetchQmItems) then) =
      __$FetchQmItemsCopyWithImpl<$Res>;
  @override
  $Res call({List<QmItem> items, int page});
}

/// @nodoc
class __$FetchQmItemsCopyWithImpl<$Res> extends _$QmEventCopyWithImpl<$Res>
    implements _$FetchQmItemsCopyWith<$Res> {
  __$FetchQmItemsCopyWithImpl(
      _FetchQmItems _value, $Res Function(_FetchQmItems) _then)
      : super(_value, (v) => _then(v as _FetchQmItems));

  @override
  _FetchQmItems get _value => super._value as _FetchQmItems;

  @override
  $Res call({
    Object? items = freezed,
    Object? page = freezed,
  }) {
    return _then(_FetchQmItems(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<QmItem>,
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FetchQmItems extends _FetchQmItems {
  const _$_FetchQmItems(this.items, this.page) : super._();

  @override
  final List<QmItem> items;
  @override
  final int page;

  @override
  String toString() {
    return 'QmEvent.fetchQmItemsByPage(items: $items, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchQmItems &&
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
  _$FetchQmItemsCopyWith<_FetchQmItems> get copyWith =>
      __$FetchQmItemsCopyWithImpl<_FetchQmItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<QmItem> items, int page) fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage(items, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<QmItem> items, int page)? fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage?.call(items, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<QmItem> items, int page)? fetchQmItemsByPage,
    required TResult orElse(),
  }) {
    if (fetchQmItemsByPage != null) {
      return fetchQmItemsByPage(items, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchQmItems value) fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_FetchQmItems value)? fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchQmItems value)? fetchQmItemsByPage,
    required TResult orElse(),
  }) {
    if (fetchQmItemsByPage != null) {
      return fetchQmItemsByPage(this);
    }
    return orElse();
  }
}

abstract class _FetchQmItems extends QmEvent {
  const factory _FetchQmItems(List<QmItem> items, int page) = _$_FetchQmItems;
  const _FetchQmItems._() : super._();

  @override
  List<QmItem> get items;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$FetchQmItemsCopyWith<_FetchQmItems> get copyWith =>
      throw _privateConstructorUsedError;
}
