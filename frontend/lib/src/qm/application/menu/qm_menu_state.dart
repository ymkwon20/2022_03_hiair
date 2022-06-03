import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/qm/domain/entities/qm_menu.dart';

part 'qm_menu_state.freezed.dart';

@freezed
class QmMenuState with _$QmMenuState {
  const QmMenuState._();
  const factory QmMenuState.init() = _Init;
  const factory QmMenuState.loading() = _Loading;
  const factory QmMenuState.loaded(List<QmMenu> menus) = _Loaded;
  const factory QmMenuState.failure(String message) = _Failure;
}
