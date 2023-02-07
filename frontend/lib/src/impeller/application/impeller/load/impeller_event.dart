import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/src/impeller/domain/entities/impeller.dart';

part 'impeller_event.freezed.dart';

@freezed
class ImpellerEvent with _$ImpellerEvent {
  const ImpellerEvent._();
  const factory ImpellerEvent.fetchListByPage(List<Impeller> items, int page) =
      _FetchListByPage;
  const factory ImpellerEvent.searchByYardHullNo(
          List<Impeller> items, int page, String yard, String hullNo) =
      _SearchByYardHullNo;
}
