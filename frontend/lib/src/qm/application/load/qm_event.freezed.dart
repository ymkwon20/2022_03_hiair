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

  _FetchQmItems fetchQmItemsByPage(int page, List<QmItem> previousItems) {
    return _FetchQmItems(
      page,
      previousItems,
    );
  }
}

/// @nodoc
const $QmEvent = _$QmEventTearOff();

/// @nodoc
mixin _$QmEvent {
  int get page => throw _privateConstructorUsedError;
  List<QmItem> get previousItems => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, List<QmItem> previousItems)
        fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, List<QmItem> previousItems)? fetchQmItemsByPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, List<QmItem> previousItems)? fetchQmItemsByPage,
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
  $Res call({int page, List<QmItem> previousItems});
}

/// @nodoc
class _$QmEventCopyWithImpl<$Res> implements $QmEventCopyWith<$Res> {
  _$QmEventCopyWithImpl(this._value, this._then);

  final QmEvent _value;
  // ignore: unused_field
  final $Res Function(QmEvent) _then;

  @override
  $Res call({
    Object? page = freezed,
    Object? previousItems = freezed,
  }) {
    return _then(_value.copyWith(
      page: page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      previousItems: previousItems == freezed
          ? _value.previousItems
          : previousItems // ignore: cast_nullable_to_non_nullable
              as List<QmItem>,
    ));
  }
}

/// @nodoc
abstract class _$FetchQmItemsCopyWith<$Res> implements $QmEventCopyWith<$Res> {
  factory _$FetchQmItemsCopyWith(
          _FetchQmItems value, $Res Function(_FetchQmItems) then) =
      __$FetchQmItemsCopyWithImpl<$Res>;
  @override
  $Res call({int page, List<QmItem> previousItems});
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
    Object? page = freezed,
    Object? previousItems = freezed,
  }) {
    return _then(_FetchQmItems(
      page == freezed
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      previousItems == freezed
          ? _value.previousItems
          : previousItems // ignore: cast_nullable_to_non_nullable
              as List<QmItem>,
    ));
  }
}

/// @nodoc

class _$_FetchQmItems extends _FetchQmItems {
  const _$_FetchQmItems(this.page, this.previousItems) : super._();

  @override
  final int page;
  @override
  final List<QmItem> previousItems;

  @override
  String toString() {
    return 'QmEvent.fetchQmItemsByPage(page: $page, previousItems: $previousItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchQmItems &&
            const DeepCollectionEquality().equals(other.page, page) &&
            const DeepCollectionEquality()
                .equals(other.previousItems, previousItems));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(page),
      const DeepCollectionEquality().hash(previousItems));

  @JsonKey(ignore: true)
  @override
  _$FetchQmItemsCopyWith<_FetchQmItems> get copyWith =>
      __$FetchQmItemsCopyWithImpl<_FetchQmItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int page, List<QmItem> previousItems)
        fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage(page, previousItems);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int page, List<QmItem> previousItems)? fetchQmItemsByPage,
  }) {
    return fetchQmItemsByPage?.call(page, previousItems);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int page, List<QmItem> previousItems)? fetchQmItemsByPage,
    required TResult orElse(),
  }) {
    if (fetchQmItemsByPage != null) {
      return fetchQmItemsByPage(page, previousItems);
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
  const factory _FetchQmItems(int page, List<QmItem> previousItems) =
      _$_FetchQmItems;
  const _FetchQmItems._() : super._();

  @override
  int get page;
  @override
  List<QmItem> get previousItems;
  @override
  @JsonKey(ignore: true)
  _$FetchQmItemsCopyWith<_FetchQmItems> get copyWith =>
      throw _privateConstructorUsedError;
}
