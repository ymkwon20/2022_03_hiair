// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'impeller_save_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ImpellerSaveEventTearOff {
  const _$ImpellerSaveEventTearOff();

  _SaveImpeller saveImpeller(
      Impeller item, ImpellerSaveStatus status, int index) {
    return _SaveImpeller(
      item,
      status,
      index,
    );
  }

  _SaveImpellerList saveImpellerList(
      List<Impeller> list, ImpellerSaveStatus status, List<int> indice) {
    return _SaveImpellerList(
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
const $ImpellerSaveEvent = _$ImpellerSaveEventTearOff();

/// @nodoc
mixin _$ImpellerSaveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Impeller item, ImpellerSaveStatus status, int index)
        saveImpeller,
    required TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)
        saveImpellerList,
    required TResult Function() resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveImpeller value) saveImpeller,
    required TResult Function(_SaveImpellerList value) saveImpellerList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImpellerSaveEventCopyWith<$Res> {
  factory $ImpellerSaveEventCopyWith(
          ImpellerSaveEvent value, $Res Function(ImpellerSaveEvent) then) =
      _$ImpellerSaveEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ImpellerSaveEventCopyWithImpl<$Res>
    implements $ImpellerSaveEventCopyWith<$Res> {
  _$ImpellerSaveEventCopyWithImpl(this._value, this._then);

  final ImpellerSaveEvent _value;
  // ignore: unused_field
  final $Res Function(ImpellerSaveEvent) _then;
}

/// @nodoc
abstract class _$SaveImpellerCopyWith<$Res> {
  factory _$SaveImpellerCopyWith(
          _SaveImpeller value, $Res Function(_SaveImpeller) then) =
      __$SaveImpellerCopyWithImpl<$Res>;
  $Res call({Impeller item, ImpellerSaveStatus status, int index});
}

/// @nodoc
class __$SaveImpellerCopyWithImpl<$Res>
    extends _$ImpellerSaveEventCopyWithImpl<$Res>
    implements _$SaveImpellerCopyWith<$Res> {
  __$SaveImpellerCopyWithImpl(
      _SaveImpeller _value, $Res Function(_SaveImpeller) _then)
      : super(_value, (v) => _then(v as _SaveImpeller));

  @override
  _SaveImpeller get _value => super._value as _SaveImpeller;

  @override
  $Res call({
    Object? item = freezed,
    Object? status = freezed,
    Object? index = freezed,
  }) {
    return _then(_SaveImpeller(
      item == freezed
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as Impeller,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ImpellerSaveStatus,
      index == freezed
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_SaveImpeller extends _SaveImpeller {
  const _$_SaveImpeller(this.item, this.status, this.index) : super._();

  @override
  final Impeller item;
  @override
  final ImpellerSaveStatus status;
  @override
  final int index;

  @override
  String toString() {
    return 'ImpellerSaveEvent.saveImpeller(item: $item, status: $status, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveImpeller &&
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
  _$SaveImpellerCopyWith<_SaveImpeller> get copyWith =>
      __$SaveImpellerCopyWithImpl<_SaveImpeller>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Impeller item, ImpellerSaveStatus status, int index)
        saveImpeller,
    required TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)
        saveImpellerList,
    required TResult Function() resetToNone,
  }) {
    return saveImpeller(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
  }) {
    return saveImpeller?.call(item, status, index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveImpeller != null) {
      return saveImpeller(item, status, index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveImpeller value) saveImpeller,
    required TResult Function(_SaveImpellerList value) saveImpellerList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveImpeller(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveImpeller?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveImpeller != null) {
      return saveImpeller(this);
    }
    return orElse();
  }
}

abstract class _SaveImpeller extends ImpellerSaveEvent {
  const factory _SaveImpeller(
      Impeller item, ImpellerSaveStatus status, int index) = _$_SaveImpeller;
  const _SaveImpeller._() : super._();

  Impeller get item;
  ImpellerSaveStatus get status;
  int get index;
  @JsonKey(ignore: true)
  _$SaveImpellerCopyWith<_SaveImpeller> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SaveImpellerListCopyWith<$Res> {
  factory _$SaveImpellerListCopyWith(
          _SaveImpellerList value, $Res Function(_SaveImpellerList) then) =
      __$SaveImpellerListCopyWithImpl<$Res>;
  $Res call({List<Impeller> list, ImpellerSaveStatus status, List<int> indice});
}

/// @nodoc
class __$SaveImpellerListCopyWithImpl<$Res>
    extends _$ImpellerSaveEventCopyWithImpl<$Res>
    implements _$SaveImpellerListCopyWith<$Res> {
  __$SaveImpellerListCopyWithImpl(
      _SaveImpellerList _value, $Res Function(_SaveImpellerList) _then)
      : super(_value, (v) => _then(v as _SaveImpellerList));

  @override
  _SaveImpellerList get _value => super._value as _SaveImpellerList;

  @override
  $Res call({
    Object? list = freezed,
    Object? status = freezed,
    Object? indice = freezed,
  }) {
    return _then(_SaveImpellerList(
      list == freezed
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Impeller>,
      status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ImpellerSaveStatus,
      indice == freezed
          ? _value.indice
          : indice // ignore: cast_nullable_to_non_nullable
              as List<int>,
    ));
  }
}

/// @nodoc

class _$_SaveImpellerList extends _SaveImpellerList {
  const _$_SaveImpellerList(this.list, this.status, this.indice) : super._();

  @override
  final List<Impeller> list;
  @override
  final ImpellerSaveStatus status;
  @override
  final List<int> indice;

  @override
  String toString() {
    return 'ImpellerSaveEvent.saveImpellerList(list: $list, status: $status, indice: $indice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SaveImpellerList &&
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
  _$SaveImpellerListCopyWith<_SaveImpellerList> get copyWith =>
      __$SaveImpellerListCopyWithImpl<_SaveImpellerList>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Impeller item, ImpellerSaveStatus status, int index)
        saveImpeller,
    required TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)
        saveImpellerList,
    required TResult Function() resetToNone,
  }) {
    return saveImpellerList(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
  }) {
    return saveImpellerList?.call(list, status, indice);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
    required TResult orElse(),
  }) {
    if (saveImpellerList != null) {
      return saveImpellerList(list, status, indice);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SaveImpeller value) saveImpeller,
    required TResult Function(_SaveImpellerList value) saveImpellerList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return saveImpellerList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return saveImpellerList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (saveImpellerList != null) {
      return saveImpellerList(this);
    }
    return orElse();
  }
}

abstract class _SaveImpellerList extends ImpellerSaveEvent {
  const factory _SaveImpellerList(
          List<Impeller> list, ImpellerSaveStatus status, List<int> indice) =
      _$_SaveImpellerList;
  const _SaveImpellerList._() : super._();

  List<Impeller> get list;
  ImpellerSaveStatus get status;
  List<int> get indice;
  @JsonKey(ignore: true)
  _$SaveImpellerListCopyWith<_SaveImpellerList> get copyWith =>
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
    extends _$ImpellerSaveEventCopyWithImpl<$Res>
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
    return 'ImpellerSaveEvent.resetToNone()';
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
    required TResult Function(
            Impeller item, ImpellerSaveStatus status, int index)
        saveImpeller,
    required TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)
        saveImpellerList,
    required TResult Function() resetToNone,
  }) {
    return resetToNone();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
    TResult Function()? resetToNone,
  }) {
    return resetToNone?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Impeller item, ImpellerSaveStatus status, int index)?
        saveImpeller,
    TResult Function(
            List<Impeller> list, ImpellerSaveStatus status, List<int> indice)?
        saveImpellerList,
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
    required TResult Function(_SaveImpeller value) saveImpeller,
    required TResult Function(_SaveImpellerList value) saveImpellerList,
    required TResult Function(_ResetToNone value) resetToNone,
  }) {
    return resetToNone(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
  }) {
    return resetToNone?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SaveImpeller value)? saveImpeller,
    TResult Function(_SaveImpellerList value)? saveImpellerList,
    TResult Function(_ResetToNone value)? resetToNone,
    required TResult orElse(),
  }) {
    if (resetToNone != null) {
      return resetToNone(this);
    }
    return orElse();
  }
}

abstract class _ResetToNone extends ImpellerSaveEvent {
  const factory _ResetToNone() = _$_ResetToNone;
  const _ResetToNone._() : super._();
}
