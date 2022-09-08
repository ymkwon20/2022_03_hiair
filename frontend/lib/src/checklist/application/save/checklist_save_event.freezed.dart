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

  _SaveCheckList saveChecklist(List<CheckItem> items) {
    return _SaveCheckList(
      items,
    );
  }

  _SaveImageList saveImagelist(
      List<CheckImage> items, String workCode, String workSeq) {
    return _SaveImageList(
      items,
      workCode,
      workSeq,
    );
  }

  _SaveCheckItemAndMore saveChecklistAndMore(List<CheckItem> items,
      WorkOrderSaveStatus status, String workCode, String workSeq) {
    return _SaveCheckItemAndMore(
      items,
      status,
      workCode,
      workSeq,
    );
  }
}

/// @nodoc
const $ChecklistSaveEvent = _$ChecklistSaveEventTearOff();

/// @nodoc
mixin _$ChecklistSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
    required TResult Function(
            List<CheckImage> items, String workCode, String workSeq)
        saveImagelist,
    required TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)
        saveChecklistAndMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveCheckList value) saveChecklist,
    required TResult Function(_SaveImageList value) saveImagelist,
    required TResult Function(_SaveCheckItemAndMore value) saveChecklistAndMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChecklistSaveEventCopyWith<$Res> {
  factory $ChecklistSaveEventCopyWith(
          ChecklistSaveEvent value, $Res Function(ChecklistSaveEvent) then) =
      _$ChecklistSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChecklistSaveEventCopyWithImpl<$Res>
    implements $ChecklistSaveEventCopyWith<$Res> {
  _$ChecklistSaveEventCopyWithImpl(this._value, this._then);

  final ChecklistSaveEvent _value;
  // ignore: unused_field
  final $Res Function(ChecklistSaveEvent) _then;
}

/// @nodoc
abstract class _$SaveCheckListCopyWith<$Res> {
  factory _$SaveCheckListCopyWith(
          _SaveCheckList value, $Res Function(_SaveCheckList) then) =
      __$SaveCheckListCopyWithImpl<$Res>;
  $Res call({List<CheckItem> items});
}

/// @nodoc
class __$SaveCheckListCopyWithImpl<$Res>
    extends _$ChecklistSaveEventCopyWithImpl<$Res>
    implements _$SaveCheckListCopyWith<$Res> {
  __$SaveCheckListCopyWithImpl(
      _SaveCheckList _value, $Res Function(_SaveCheckList) _then)
      : super(_value, (v) => _then(v as _SaveCheckList));

  @override
  _SaveCheckList get _value => super._value as _SaveCheckList;

  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_SaveCheckList(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckItem>,
    ));
  }
}

/// @nodoc

class _$_SaveCheckList extends _SaveCheckList {
  const _$_SaveCheckList(this.items) : super._();

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
            other is _SaveCheckList &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(items));

  @JsonKey(ignore: true)
  @override
  _$SaveCheckListCopyWith<_SaveCheckList> get copyWith =>
      __$SaveCheckListCopyWithImpl<_SaveCheckList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
    required TResult Function(
            List<CheckImage> items, String workCode, String workSeq)
        saveImagelist,
    required TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)
        saveChecklistAndMore,
  }) {
    return saveChecklist(items);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
  }) {
    return saveChecklist?.call(items);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
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
    required TResult Function(_SaveCheckList value) saveChecklist,
    required TResult Function(_SaveImageList value) saveImagelist,
    required TResult Function(_SaveCheckItemAndMore value) saveChecklistAndMore,
  }) {
    return saveChecklist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
  }) {
    return saveChecklist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
    required TResult orElse(),
  }) {
    if (saveChecklist != null) {
      return saveChecklist(this);
    }
    return orElse();
  }
}

abstract class _SaveCheckList extends ChecklistSaveEvent {
  const factory _SaveCheckList(List<CheckItem> items) = _$_SaveCheckList;
  const _SaveCheckList._() : super._();

  List<CheckItem> get items;
  @JsonKey(ignore: true)
  _$SaveCheckListCopyWith<_SaveCheckList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveImageListCopyWith<$Res> {
  factory _$SaveImageListCopyWith(
          _SaveImageList value, $Res Function(_SaveImageList) then) =
      __$SaveImageListCopyWithImpl<$Res>;
  $Res call({List<CheckImage> items, String workCode, String workSeq});
}

/// @nodoc
class __$SaveImageListCopyWithImpl<$Res>
    extends _$ChecklistSaveEventCopyWithImpl<$Res>
    implements _$SaveImageListCopyWith<$Res> {
  __$SaveImageListCopyWithImpl(
      _SaveImageList _value, $Res Function(_SaveImageList) _then)
      : super(_value, (v) => _then(v as _SaveImageList));

  @override
  _SaveImageList get _value => super._value as _SaveImageList;

  @override
  $Res call({
    Object? items = freezed,
    Object? workCode = freezed,
    Object? workSeq = freezed,
  }) {
    return _then(_SaveImageList(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckImage>,
      workCode == freezed
          ? _value.workCode
          : workCode // ignore: cast_nullable_to_non_nullable
              as String,
      workSeq == freezed
          ? _value.workSeq
          : workSeq // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveImageList extends _SaveImageList {
  const _$_SaveImageList(this.items, this.workCode, this.workSeq) : super._();

  @override
  final List<CheckImage> items;
  @override
  final String workCode;
  @override
  final String workSeq;

  @override
  String toString() {
    return 'ChecklistSaveEvent.saveImagelist(items: $items, workCode: $workCode, workSeq: $workSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveImageList &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.workCode, workCode) &&
            const DeepCollectionEquality().equals(other.workSeq, workSeq));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(workCode),
      const DeepCollectionEquality().hash(workSeq));

  @JsonKey(ignore: true)
  @override
  _$SaveImageListCopyWith<_SaveImageList> get copyWith =>
      __$SaveImageListCopyWithImpl<_SaveImageList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
    required TResult Function(
            List<CheckImage> items, String workCode, String workSeq)
        saveImagelist,
    required TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)
        saveChecklistAndMore,
  }) {
    return saveImagelist(items, workCode, workSeq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
  }) {
    return saveImagelist?.call(items, workCode, workSeq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
    required TResult orElse(),
  }) {
    if (saveImagelist != null) {
      return saveImagelist(items, workCode, workSeq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveCheckList value) saveChecklist,
    required TResult Function(_SaveImageList value) saveImagelist,
    required TResult Function(_SaveCheckItemAndMore value) saveChecklistAndMore,
  }) {
    return saveImagelist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
  }) {
    return saveImagelist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
    required TResult orElse(),
  }) {
    if (saveImagelist != null) {
      return saveImagelist(this);
    }
    return orElse();
  }
}

abstract class _SaveImageList extends ChecklistSaveEvent {
  const factory _SaveImageList(
          List<CheckImage> items, String workCode, String workSeq) =
      _$_SaveImageList;
  const _SaveImageList._() : super._();

  List<CheckImage> get items;
  String get workCode;
  String get workSeq;
  @JsonKey(ignore: true)
  _$SaveImageListCopyWith<_SaveImageList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveCheckItemAndMoreCopyWith<$Res> {
  factory _$SaveCheckItemAndMoreCopyWith(_SaveCheckItemAndMore value,
          $Res Function(_SaveCheckItemAndMore) then) =
      __$SaveCheckItemAndMoreCopyWithImpl<$Res>;
  $Res call(
      {List<CheckItem> items,
      WorkOrderSaveStatus status,
      String workCode,
      String workSeq});
}

/// @nodoc
class __$SaveCheckItemAndMoreCopyWithImpl<$Res>
    extends _$ChecklistSaveEventCopyWithImpl<$Res>
    implements _$SaveCheckItemAndMoreCopyWith<$Res> {
  __$SaveCheckItemAndMoreCopyWithImpl(
      _SaveCheckItemAndMore _value, $Res Function(_SaveCheckItemAndMore) _then)
      : super(_value, (v) => _then(v as _SaveCheckItemAndMore));

  @override
  _SaveCheckItemAndMore get _value => super._value as _SaveCheckItemAndMore;

  @override
  $Res call({
    Object? items = freezed,
    Object? status = freezed,
    Object? workCode = freezed,
    Object? workSeq = freezed,
  }) {
    return _then(_SaveCheckItemAndMore(
      items == freezed
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<CheckItem>,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkOrderSaveStatus,
      workCode == freezed
          ? _value.workCode
          : workCode // ignore: cast_nullable_to_non_nullable
              as String,
      workSeq == freezed
          ? _value.workSeq
          : workSeq // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SaveCheckItemAndMore extends _SaveCheckItemAndMore {
  const _$_SaveCheckItemAndMore(
      this.items, this.status, this.workCode, this.workSeq)
      : super._();

  @override
  final List<CheckItem> items;
  @override
  final WorkOrderSaveStatus status;
  @override
  final String workCode;
  @override
  final String workSeq;

  @override
  String toString() {
    return 'ChecklistSaveEvent.saveChecklistAndMore(items: $items, status: $status, workCode: $workCode, workSeq: $workSeq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveCheckItemAndMore &&
            const DeepCollectionEquality().equals(other.items, items) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality().equals(other.workCode, workCode) &&
            const DeepCollectionEquality().equals(other.workSeq, workSeq));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(items),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(workCode),
      const DeepCollectionEquality().hash(workSeq));

  @JsonKey(ignore: true)
  @override
  _$SaveCheckItemAndMoreCopyWith<_SaveCheckItemAndMore> get copyWith =>
      __$SaveCheckItemAndMoreCopyWithImpl<_SaveCheckItemAndMore>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CheckItem> items) saveChecklist,
    required TResult Function(
            List<CheckImage> items, String workCode, String workSeq)
        saveImagelist,
    required TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)
        saveChecklistAndMore,
  }) {
    return saveChecklistAndMore(items, status, workCode, workSeq);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
  }) {
    return saveChecklistAndMore?.call(items, status, workCode, workSeq);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CheckItem> items)? saveChecklist,
    TResult Function(List<CheckImage> items, String workCode, String workSeq)?
        saveImagelist,
    TResult Function(List<CheckItem> items, WorkOrderSaveStatus status,
            String workCode, String workSeq)?
        saveChecklistAndMore,
    required TResult orElse(),
  }) {
    if (saveChecklistAndMore != null) {
      return saveChecklistAndMore(items, status, workCode, workSeq);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveCheckList value) saveChecklist,
    required TResult Function(_SaveImageList value) saveImagelist,
    required TResult Function(_SaveCheckItemAndMore value) saveChecklistAndMore,
  }) {
    return saveChecklistAndMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
  }) {
    return saveChecklistAndMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveCheckList value)? saveChecklist,
    TResult Function(_SaveImageList value)? saveImagelist,
    TResult Function(_SaveCheckItemAndMore value)? saveChecklistAndMore,
    required TResult orElse(),
  }) {
    if (saveChecklistAndMore != null) {
      return saveChecklistAndMore(this);
    }
    return orElse();
  }
}

abstract class _SaveCheckItemAndMore extends ChecklistSaveEvent {
  const factory _SaveCheckItemAndMore(
      List<CheckItem> items,
      WorkOrderSaveStatus status,
      String workCode,
      String workSeq) = _$_SaveCheckItemAndMore;
  const _SaveCheckItemAndMore._() : super._();

  List<CheckItem> get items;
  WorkOrderSaveStatus get status;
  String get workCode;
  String get workSeq;
  @JsonKey(ignore: true)
  _$SaveCheckItemAndMoreCopyWith<_SaveCheckItemAndMore> get copyWith =>
      throw _privateConstructorUsedError;
}
