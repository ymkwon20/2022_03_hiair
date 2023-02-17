import 'package:frontend/src/core/domain/entities/table_cell.dart';
import 'package:frontend/src/workorder/domain/entities/i_work_order.dart';
import 'package:frontend/src/workorder/domain/entities/work_order_status.dart';

class WorkOrder extends IWorkOrder implements TableCellEntity {
  /// CLOSE_ST: 작업시작일
  final String dateStart;

  /// CLOSE_DT: 작업완료일
  final String dateEnd;

  /// BEF_CLOSE_DT: 이전 작업 완료일
  final String dateEndBefore;

  /// 공정 진행 상태
  final WorkOrderStatus status;

  const WorkOrder({
    required String code,
    required String itemNo,
    required String date,
    required String ship,
    required int planSeq,
    required String hullNo,
    required int qty,
    required String sysNo,
    required String yard,
    required String wbCd,
    required String wbNm,
    required String wcCd,
    required String chkDiv,
    required String wonb,
    required String spec,
    required String size,
    required String pndDate,
    required String ironPlateThickness,
    required String ironPlateWidth,
    required String ironPlateHeight,
    required String doorLength,
    required String hollUpDown,
    required String rmkDC,
    required String reqDT,
    required String cfmDate,
    required int swingType,
    required String frame,
    required String material,
    required String motorColor,
    required String itemSpec,
    required String inside,
    required String inDomar,
    required String outside,
    required String outDomar,
    required String befCloseDT,
    required String chkSchDT,
    required String shotDT,
    required String weight,
    required String mtrOutDT,
    required String custltemName,
    required String bladeAngle,
    required String chkTblDT,
    required String fanType,
    required String rmk,
    required String tagNo,
    required String workwcnm,
    required this.dateStart,
    required this.dateEnd,
    required this.dateEndBefore,
    required this.status,
  }) : super(
          code: code,
          itemNo: itemNo,
          date: date,
          ship: ship,
          planSeq: planSeq,
          hullNo: hullNo,
          qty: qty,
          sysNo: sysNo,
          yard: yard,
          wbCd: wbCd,
          wcCd: wcCd,
          wbNm: wbNm,
          chkDiv: chkDiv,
          wonb: wonb,
          spec: spec,
          size: size,
          pndDate: pndDate,
          ironPlateThickness: ironPlateThickness,
          ironPlateWidth: ironPlateWidth,
          ironPlateHeight: ironPlateHeight,
          doorLength: doorLength,
          hollUpDown: hollUpDown,
          rmkDC: rmkDC,
          reqDT: reqDT,
          cfmDate: cfmDate,
          swingType: swingType,
          frame: frame,
          material: material,
          motorColor: motorColor,
          itemSpec: itemSpec,
          inside: inside,
          inDomar: inDomar,
          outside: outside,
          outDomar: outDomar,
          befCloseDT: befCloseDT,
          chkSchDT: chkSchDT,
          shotDT: shotDT,
          weight: weight,
          mtrOutDT: mtrOutDT,
          custltemName: custltemName,
          bladeAngle: bladeAngle,
          chkTblDT: chkTblDT,
          fanType: fanType,
          rmk: rmk,
          tagNo: tagNo,
          workwcnm: workwcnm,
        );

  String get statusKr {
    switch (status) {
      case WorkOrderStatus.waiting:
        return "대기";
      case WorkOrderStatus.resuming:
        return "진행중";
    }
  }

  @override
  String? getProp(String key) => <String, String>{
        "wbNm": wbNm,
        "yard": yard,
        "hullNo": hullNo,
        "ship": ship,
        "sysNo": sysNo,
        "itemNo": itemNo,
        "status": statusKr,
        "qty": qty.toString(),
        "chkDiv": chkDiv,
        'wonb': wonb,
        'spec': spec,
        'size': size,
        'pndDate': pndDate,
        'ironPlateThickness': ironPlateThickness,
        'ironPlateWidth': ironPlateWidth,
        'ironPlateHeight': ironPlateHeight,
        'doorLength': doorLength,
        'hollUpDown': hollUpDown,
        'rmkDC': rmkDC,
        'reqDT': reqDT,
        'cfmDate': cfmDate,
        'swingType': swingType.toString(),
        'frame': frame,
        'material': material,
        'motorColor': motorColor,
        'itemSpec': itemSpec,
        'inside': inside,
        'inDomar': inDomar,
        'outside': outside,
        'outDomar': outDomar,
        'befCloseDT': befCloseDT,
        'chkSchDT': chkSchDT,
        'shotDT': shotDT,
        'weight': weight,
        'mtrOutDT': mtrOutDT,
        'custltemName': custltemName,
        'bladeAngle': bladeAngle,
        'chkTblDT': chkTblDT,
        'fanType': fanType,
        'rmk': rmk,
        'tagNo': tagNo,
        'workwcnm': workwcnm,
      }[key];

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is WorkOrder &&
        other.code == code &&
        other.itemNo == itemNo &&
        other.dateStart == dateStart &&
        other.dateEnd == dateEnd &&
        other.dateEndBefore == dateEndBefore &&
        other.ship == ship &&
        other.planSeq == planSeq &&
        other.hullNo == hullNo &&
        other.qty == qty &&
        other.sysNo == sysNo &&
        other.yard == yard &&
        other.wbCd == wbCd &&
        other.wbNm == wbNm &&
        other.wcCd == wcCd &&
        other.status == status &&
        other.chkDiv == chkDiv &&
        other.wonb == wonb &&
        other.spec == spec &&
        other.size == size &&
        other.pndDate == pndDate &&
        other.ironPlateThickness == ironPlateThickness &&
        other.ironPlateWidth == ironPlateWidth &&
        other.ironPlateHeight == ironPlateHeight &&
        other.doorLength == doorLength &&
        other.hollUpDown == hollUpDown &&
        other.rmkDC == rmkDC &&
        other.reqDT == reqDT &&
        other.cfmDate == cfmDate &&
        other.swingType == swingType &&
        other.frame == frame &&
        other.material == material &&
        other.motorColor == motorColor &&
        other.itemSpec == itemSpec &&
        other.inside == inside &&
        other.inDomar == inDomar &&
        other.outside == outside &&
        other.outDomar == outDomar &&
        other.befCloseDT == befCloseDT &&
        other.chkSchDT == chkSchDT &&
        other.shotDT == shotDT &&
        other.weight == weight &&
        other.mtrOutDT == mtrOutDT &&
        other.custltemName == custltemName &&
        other.bladeAngle == bladeAngle &&
        other.chkTblDT == chkTblDT &&
        other.fanType == fanType &&
        other.rmk == rmk &&
        other.tagNo == tagNo &&
        other.workwcnm == workwcnm;
  }

  @override
  int get hashCode {
    return code.hashCode ^
        itemNo.hashCode ^
        dateStart.hashCode ^
        dateEnd.hashCode ^
        dateEndBefore.hashCode ^
        ship.hashCode ^
        planSeq.hashCode ^
        hullNo.hashCode ^
        qty.hashCode ^
        sysNo.hashCode ^
        yard.hashCode ^
        wbCd.hashCode ^
        wbNm.hashCode ^
        wcCd.hashCode ^
        status.hashCode ^
        chkDiv.hashCode ^
        wonb.hashCode ^
        spec.hashCode ^
        size.hashCode ^
        pndDate.hashCode ^
        ironPlateThickness.hashCode ^
        ironPlateWidth.hashCode ^
        ironPlateHeight.hashCode ^
        doorLength.hashCode ^
        hollUpDown.hashCode ^
        rmkDC.hashCode ^
        reqDT.hashCode ^
        cfmDate.hashCode ^
        swingType.hashCode ^
        frame.hashCode ^
        material.hashCode ^
        motorColor.hashCode ^
        itemSpec.hashCode ^
        inside.hashCode ^
        inDomar.hashCode ^
        outside.hashCode ^
        outDomar.hashCode ^
        befCloseDT.hashCode ^
        chkSchDT.hashCode ^
        shotDT.hashCode ^
        weight.hashCode ^
        mtrOutDT.hashCode ^
        custltemName.hashCode ^
        bladeAngle.hashCode ^
        chkTblDT.hashCode ^
        fanType.hashCode ^
        rmk.hashCode ^
        tagNo.hashCode ^
        workwcnm.hashCode;
  }

  WorkOrder copyWith({
    String? code,
    String? itemNo,
    String? date,
    String? dateStart,
    String? dateEnd,
    String? dateEndBefore,
    String? ship,
    int? planSeq,
    String? hullNo,
    int? qty,
    String? sysNo,
    String? yard,
    String? wbCd,
    String? wbNm,
    String? wcCd,
    String? chkDiv,
    WorkOrderStatus? status,
    String? wonb,
    String? spec,
    String? size,
    String? pndDate,
    String? ironPlateThickness,
    String? ironPlateWidth,
    String? ironPlateHeight,
    String? doorLength,
    String? hollUpDown,
    String? rmkDC,
    String? reqDT,
    String? cfmDate,
    int? swingType,
    String? frame,
    String? material,
    String? motorColor,
    String? itemSpec,
    String? inside,
    String? inDomar,
    String? outside,
    String? outDomar,
    String? befCloseDT,
    String? chkSchDT,
    String? shotDT,
    String? weight,
    String? mtrOutDT,
    String? custltemName,
    String? bladeAngle,
    String? chkTblDT,
    String? fanType,
    String? rmk,
    String? tagNo,
    String? workwcnm,
  }) {
    return WorkOrder(
      code: code ?? this.code,
      itemNo: itemNo ?? this.itemNo,
      date: date ?? this.date,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      dateEndBefore: dateEndBefore ?? this.dateEndBefore,
      ship: ship ?? this.ship,
      planSeq: planSeq ?? this.planSeq,
      hullNo: hullNo ?? this.hullNo,
      qty: qty ?? this.qty,
      sysNo: sysNo ?? this.sysNo,
      yard: yard ?? this.yard,
      wbCd: wbCd ?? this.wbCd,
      wbNm: wbNm ?? this.wbNm,
      wcCd: wcCd ?? this.wcCd,
      status: status ?? this.status,
      chkDiv: chkDiv ?? this.chkDiv,
      wonb: wonb ?? this.wonb,
      spec: spec ?? this.spec,
      size: size ?? this.size,
      pndDate: pndDate ?? this.pndDate,
      ironPlateThickness: ironPlateThickness ?? this.ironPlateThickness,
      ironPlateWidth: ironPlateWidth ?? this.ironPlateWidth,
      ironPlateHeight: ironPlateHeight ?? this.ironPlateHeight,
      doorLength: doorLength ?? this.doorLength,
      hollUpDown: hollUpDown ?? this.hollUpDown,
      rmkDC: rmkDC ?? this.rmkDC,
      reqDT: reqDT ?? this.reqDT,
      cfmDate: cfmDate ?? this.cfmDate,
      swingType: swingType ?? this.swingType,
      frame: frame ?? this.frame,
      material: material ?? this.material,
      motorColor: motorColor ?? this.motorColor,
      itemSpec: itemSpec ?? this.itemSpec,
      inside: inside ?? this.inside,
      inDomar: inDomar ?? this.inDomar,
      outside: outside ?? this.outside,
      outDomar: outDomar ?? this.outDomar,
      befCloseDT: befCloseDT ?? this.befCloseDT,
      chkSchDT: chkSchDT ?? this.chkSchDT,
      shotDT: shotDT ?? this.shotDT,
      weight: weight ?? this.weight,
      mtrOutDT: mtrOutDT ?? this.mtrOutDT,
      custltemName: custltemName ?? this.custltemName,
      bladeAngle: bladeAngle ?? this.bladeAngle,
      chkTblDT: chkTblDT ?? this.chkTblDT,
      fanType: fanType ?? this.fanType,
      rmk: rmk ?? this.rmk,
      tagNo: tagNo ?? this.tagNo,
      workwcnm: workwcnm ?? this.workwcnm,
    );
  }
}
