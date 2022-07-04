import 'package:intl/intl.dart';

class RepairInfo {
  final String date;
  final String equipCd;
  final String location;
  final String record; // not null & not empty
  final String repairedBy;
  final double cost;
  final String remark;

  const RepairInfo({
    required this.date,
    required this.equipCd,
    required this.location,
    required this.record,
    required this.repairedBy,
    required this.cost,
    required this.remark,
  });

  factory RepairInfo.initial(String equipCd) {
    return RepairInfo(
      equipCd: equipCd,
      date: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      location: "",
      record: "",
      repairedBy: "",
      cost: 0,
      remark: "",
    );
  }

  RepairInfo copyWith({
    String? date,
    String? equipCd,
    String? location,
    String? record,
    String? repairedBy,
    double? cost,
    String? remark,
  }) {
    return RepairInfo(
      date: date ?? this.date,
      equipCd: equipCd ?? this.equipCd,
      location: location ?? this.location,
      record: record ?? this.record,
      repairedBy: repairedBy ?? this.repairedBy,
      cost: cost ?? this.cost,
      remark: remark ?? this.remark,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RepairInfo &&
        other.date == date &&
        other.equipCd == equipCd &&
        other.location == location &&
        other.record == record &&
        other.repairedBy == repairedBy &&
        other.cost == cost &&
        other.remark == remark;
  }

  @override
  int get hashCode {
    return date.hashCode ^
        equipCd.hashCode ^
        location.hashCode ^
        record.hashCode ^
        repairedBy.hashCode ^
        cost.hashCode ^
        remark.hashCode;
  }

  Map<String, dynamic> toMap() {
    return {
      "date": date,
      "code": equipCd,
      "location": location,
      "record": record,
      "repaired_by": repairedBy,
      "cost": cost.toString(),
      "remark": remark,
    };
  }
}
