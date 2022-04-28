import 'package:freezed_annotation/freezed_annotation.dart';

part 'insepct_mode.freezed.dart';

@freezed
class InspectMode with _$InspectMode {
  const InspectMode._();
  const factory InspectMode.none() = _None;
  const factory InspectMode.performance() = _Performance;
  const factory InspectMode.paint() = _Paint;
  const factory InspectMode.motor() = _Motor;
  const factory InspectMode.photo() = _Photo;
}
