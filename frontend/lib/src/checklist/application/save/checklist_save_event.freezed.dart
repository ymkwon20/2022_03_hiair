// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'checklist_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ChecklistSaveEventTearOff {
  const _$ChecklistSaveEventTearOff();

  _SaveCheckItem saveChecklist(List<CheckItem> items) {
    return _SaveCheckItem(
      items,
    );
  }
}

/// @nodoc
const $ChecklistSaveEvent = _$ChecklistSaveEventTearOff();

/// @nodoc
mixin _$ChecklistSaveEvent {
  List<CheckItem> get items => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveCheckItem value) saveChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckItem value)? saveChecklist,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckItem value)? saveChecklist,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChecklistSaveEventCopyWith<ChecklistSaveEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistSaveEventCopyWith<$Res> {
  factory $ChecklistSaveEventCopyWith(
          ChecklistSaveEvent value, $Res Function(ChecklistSaveEvent) then) =
      _$ChecklistSaveEventCopyWithImpl<$Res>;
  $Res call({List<CheckItem> items});
}

/// @nodoc
class _$ChecklistSaveEventCopyWithImpl<$Res>
    implements $ChecklistSaveEventCopyWith<$Res> {
  _$ChecklistSaveEventCopyWithImpl(this._value, this._then);

  final ChecklistSaveEvent _value;
  // ignore: unused_field
  final $Res Function(ChecklistSaveEvent) _then;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckItem>,
    ));
  }
}

/// @nodoc
abstract class _$SaveCheckItemCopyWith<$Res>
    implements $ChecklistSaveEventCopyWith<$Res> {
  factory _$SaveCheckItemCopyWith(
          _SaveCheckItem value, $Res Function(_SaveCheckItem) then) =
      __$SaveCheckItemCopyWithImpl<$Res>;
  @override
  $Res call({List<CheckItem> items});
}

/// @nodoc
class __$SaveCheckItemCopyWithImpl<$Res>
    extends _$ChecklistSaveEventCopyWithImpl<$Res>
    implements _$SaveCheckItemCopyWith<$Res> {
  __$SaveCheckItemCopyWithImpl(
      _SaveCheckItem _value, $Res Function(_SaveCheckItem) _then)
      : super(_value, (v) => _then(v as _SaveCheckItem));

  @override
  _SaveCheckItem get _value => super._value as _SaveCheckItem;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_SaveCheckItem(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckItem>,
    ));
  }
}

/// @nodoc

class _$_SaveCheckItem extends _SaveCheckItem {
  const _$_SaveCheckItem(this.items) : super._();

  @override
  final List<CheckItem> items;

  @override
  String toString() {
    return 'ChecklistSaveEvent.saveChecklist(items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveCheckItem &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$SaveCheckItemCopyWith<_SaveCheckItem> get copyWith =>
      __$SaveCheckItemCopyWithImpl<_SaveCheckItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
  }) {
    return saveChecklist(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
  }) {
    return saveChecklist?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    required TResult orElse(),
  }) {
    if (saveChecklist != null) {
      return saveChecklist(items);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveCheckItem value) saveChecklist,
  }) {
    return saveChecklist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckItem value)? saveChecklist,
  }) {
    return saveChecklist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckItem value)? saveChecklist,
    required TResult orElse(),
  }) {
    if (saveChecklist != null) {
      return saveChecklist(this);
    }
    return orElse();
  }
}

abstract class _SaveCheckItem extends ChecklistSaveEvent {
  const factory _SaveCheckItem(List<CheckItem> items) = _$_SaveCheckItem;
  const _SaveCheckItem._() : super._();

  @override
  List<CheckItem> get items;
  @override
  @JsonKey(ignore: true)
  _$SaveCheckItemCopyWith<_SaveCheckItem> get copyWith =>
      throw _privateConstructorUsedError;
}
