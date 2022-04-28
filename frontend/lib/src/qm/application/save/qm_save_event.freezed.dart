// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'qm_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QmSaveEventTearOff {
  const _$QmSaveEventTearOff();

  _SaveQmItem saveQmItem(QmItem item, QmStatus status, int index) {
    return _SaveQmItem(
      item,
      status,
      index,
    );
  }

  _SaveQmList saveQmList(List<QmItem> list, QmStatus status, List<int> indice) {
    return _SaveQmList(
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
const $QmSaveEvent = _$QmSaveEventTearOff();

/// @nodoc
mixin _$QmSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmItem item, QmStatus status, int index)
        saveQmItem,
    required TResult Function(
            List<QmItem> list, QmStatus status, List<int> indice)
        saveQmList,
    required TResult Function() resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmItem value) saveQmItem,
    required TResult Function(_SaveQmList value) saveQmList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QmSaveEventCopyWith<$Res> {
  factory $QmSaveEventCopyWith(
          QmSaveEvent value, $Res Function(QmSaveEvent) then) =
      _$QmSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$QmSaveEventCopyWithImpl<$Res> implements $QmSaveEventCopyWith<$Res> {
  _$QmSaveEventCopyWithImpl(this._value, this._then);

  final QmSaveEvent _value;
  // ignore: unused_field
  final $Res Function(QmSaveEvent) _then;
}

/// @nodoc
abstract class _$SaveQmItemCopyWith<$Res> {
  factory _$SaveQmItemCopyWith(
          _SaveQmItem value, $Res Function(_SaveQmItem) then) =
      __$SaveQmItemCopyWithImpl<$Res>;
  $Res call({QmItem item, QmStatus status, int index});
}

/// @nodoc
class __$SaveQmItemCopyWithImpl<$Res> extends _$QmSaveEventCopyWithImpl<$Res>
    implements _$SaveQmItemCopyWith<$Res> {
  __$SaveQmItemCopyWithImpl(
      _SaveQmItem _value, $Res Function(_SaveQmItem) _then)
      : super(_value, (v) => _then(v as _SaveQmItem));

  @override
  _SaveQmItem get _value => super._value as _SaveQmItem;

  @override
  $Res call({
    Object? item = freezed,
    Object? status = freezed,
    Object? index = freezed,
  }) {
    return _then(_SaveQmItem(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as QmItem,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QmStatus,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SaveQmItem extends _SaveQmItem {
  const _$_SaveQmItem(this.item, this.status, this.index) : super._();

  @override
  final QmItem item;
  @override
  final QmStatus status;
  @override
  final int index;

  @override
  String toString() {
    return 'QmSaveEvent.saveQmItem(item: $item, status: $status, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveQmItem &&
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
  _$SaveQmItemCopyWith<_SaveQmItem> get copyWith =>
      __$SaveQmItemCopyWithImpl<_SaveQmItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmItem item, QmStatus status, int index)
        saveQmItem,
    required TResult Function(
            List<QmItem> list, QmStatus status, List<int> indice)
        saveQmList,
    required TResult Function() resetToNone,
  }) {
    return saveQmItem(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
  }) {
    return saveQmItem?.call(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmItem != null) {
      return saveQmItem(item, status, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmItem value) saveQmItem,
    required TResult Function(_SaveQmList value) saveQmList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveQmItem(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveQmItem?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmItem != null) {
      return saveQmItem(this);
    }
    return orElse();
  }
}

abstract class _SaveQmItem extends QmSaveEvent {
  const factory _SaveQmItem(QmItem item, QmStatus status, int index) =
      _$_SaveQmItem;
  const _SaveQmItem._() : super._();

  QmItem get item;
  QmStatus get status;
  int get index;
  @JsonKey(ignore: true)
  _$SaveQmItemCopyWith<_SaveQmItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveQmListCopyWith<$Res> {
  factory _$SaveQmListCopyWith(
          _SaveQmList value, $Res Function(_SaveQmList) then) =
      __$SaveQmListCopyWithImpl<$Res>;
  $Res call({List<QmItem> list, QmStatus status, List<int> indice});
}

/// @nodoc
class __$SaveQmListCopyWithImpl<$Res> extends _$QmSaveEventCopyWithImpl<$Res>
    implements _$SaveQmListCopyWith<$Res> {
  __$SaveQmListCopyWithImpl(
      _SaveQmList _value, $Res Function(_SaveQmList) _then)
      : super(_value, (v) => _then(v as _SaveQmList));

  @override
  _SaveQmList get _value => super._value as _SaveQmList;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? indice = freezed,
  }) {
    return _then(_SaveQmList(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<QmItem>,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as QmStatus,
      indice == freezed
          ? _value.indice
          : indice // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_SaveQmList extends _SaveQmList {
  const _$_SaveQmList(this.list, this.status, this.indice) : super._();

  @override
  final List<QmItem> list;
  @override
  final QmStatus status;
  @override
  final List<int> indice;

  @override
  String toString() {
    return 'QmSaveEvent.saveQmList(list: $list, status: $status, indice: $indice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveQmList &&
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
  _$SaveQmListCopyWith<_SaveQmList> get copyWith =>
      __$SaveQmListCopyWithImpl<_SaveQmList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QmItem item, QmStatus status, int index)
        saveQmItem,
    required TResult Function(
            List<QmItem> list, QmStatus status, List<int> indice)
        saveQmList,
    required TResult Function() resetToNone,
  }) {
    return saveQmList(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
  }) {
    return saveQmList?.call(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmList != null) {
      return saveQmList(list, status, indice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveQmItem value) saveQmItem,
    required TResult Function(_SaveQmList value) saveQmList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveQmList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveQmList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveQmList != null) {
      return saveQmList(this);
    }
    return orElse();
  }
}

abstract class _SaveQmList extends QmSaveEvent {
  const factory _SaveQmList(
      List<QmItem> list, QmStatus status, List<int> indice) = _$_SaveQmList;
  const _SaveQmList._() : super._();

  List<QmItem> get list;
  QmStatus get status;
  List<int> get indice;
  @JsonKey(ignore: true)
  _$SaveQmListCopyWith<_SaveQmList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$ResetToNoneCopyWith<$Res> {
  factory _$ResetToNoneCopyWith(
          _ResetToNone value, $Res Function(_ResetToNone) then) =
      __$ResetToNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$ResetToNoneCopyWithImpl<$Res> extends _$QmSaveEventCopyWithImpl<$Res>
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
    return 'QmSaveEvent.resetToNone()';
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
    required TResult Function(QmItem item, QmStatus status, int index)
        saveQmItem,
    required TResult Function(
            List<QmItem> list, QmStatus status, List<int> indice)
        saveQmList,
    required TResult Function() resetToNone,
  }) {
    return resetToNone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
    TResult Function()? resetToNone,
  }) {
    return resetToNone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QmItem item, QmStatus status, int index)? saveQmItem,
    TResult Function(List<QmItem> list, QmStatus status, List<int> indice)?
        saveQmList,
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
    required TResult Function(_SaveQmItem value) saveQmItem,
    required TResult Function(_SaveQmList value) saveQmList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return resetToNone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return resetToNone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveQmItem value)? saveQmItem,
    TResult Function(_SaveQmList value)? saveQmList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (resetToNone != null) {
      return resetToNone(this);
    }
    return orElse();
  }
}

abstract class _ResetToNone extends QmSaveEvent {
  const factory _ResetToNone() = _$_ResetToNone;
  const _ResetToNone._() : super._();
}
