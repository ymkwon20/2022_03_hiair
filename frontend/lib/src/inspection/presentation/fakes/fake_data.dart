import 'package:frontend/src/inspection/presentation/fakes/inspect_item.dart';
import 'package:frontend/src/inspection/presentation/fakes/inspect_spec.dart';
import 'package:frontend/src/inspection/presentation/fakes/qm_product.dart';
import 'package:frontend/src/inspection/presentation/fakes/unit_list.dart';

const fakeQmProducts = <QmProduct>[
  QmProduct(
    projectNo: 'HAKASP21101106FE00',
    orderNo: 'P22-069868',
    hullNo: 'ASP21101106',
    productNo: 'AWA-0400',
    productName: 'AXIAL FAN (RIGID TYPE)',
    yard: 'SCF MANAGEMENT',
    sysNo: 'E-64',
    standard: 'AWA-400',
    qty: 1,
    size: '0400',
    explosionProof: 'NORMAL/TEFC',
    currentProcess: 'Final Paint',
    progress: '완료',
    type: '350/150',
  ),
  QmProduct(
    projectNo: 'HAKASP21121391FE00',
    orderNo: 'P22-080649',
    hullNo: 'ASP21101107',
    productNo: 'CDRM-1120',
    productName: 'MANUAL CLOSING DAMPER',
    yard: 'WILHELMSEN',
    sysNo: '-',
    standard: 'CRDM-1120',
    qty: 1,
    size: '1120',
    explosionProof: '',
    currentProcess: 'Welding',
    progress: '진행중',
    type: '350/150',
  ),
  QmProduct(
    projectNo: 'HAKASP21101207FE00',
    orderNo: 'P22-778198',
    hullNo: 'ASP21101108',
    productNo: 'AWA-0900',
    productName: 'AXIAL FAN (RIGID TYPE)',
    yard: 'DistributionNOW',
    sysNo: 'SF03',
    standard: 'AWA-900',
    qty: 2,
    size: '0900',
    explosionProof: 'Ex-PROOF/TEFC',
    currentProcess: 'Final Paint',
    progress: '대기',
    type: '800/600',
  ),
];

const fakePerformance = InspectSpec(
  name: 'Fan Performance',
  items: fakeInspectPerformanceItems,
);

const fakePaint = InspectSpec(
  name: 'Paint Spec.',
  items: fakeInpectPaintItems,
);

const fakeInspectPerformanceItems = <InspectItem>[
  InspectItem(
    name: 'Air Volume',
    unit: '',
    spec: '',
    isUnitSelectable: true,
    unitList: UnitAirVolume(),
    valueType: 'num',
  ),
  InspectItem(
    name: 'Ps',
    unit: '',
    spec: '500',
    isUnitSelectable: true,
    unitList: UnitPressure(),
    valueType: 'num',
  ),
  InspectItem(
    name: 'Velocity',
    unit: '',
    spec: '-',
    isUnitSelectable: true,
    unitList: UnitVelocity(),
    valueType: 'num',
  ),
  InspectItem(
    name: 'Current',
    unit: 'A',
    spec: '3500',
    valueType: 'num',
  ),
  InspectItem(
    name: 'RPM',
    unit: '',
    spec: '3500',
    valueType: 'num',
  ),
  InspectItem(
    name: 'Noise',
    unit: 'dB(A)',
    spec: '',
    valueType: 'num',
  ),
  InspectItem(
    name: 'Vibration',
    unit: 'mm/s',
    spec: '',
    valueType: 'num',
  ),
];

const fakeInpectPaintItems = <InspectItem>[
  InspectItem(
    name: 'ln\n도막',
    unit: 'mm',
    spec: '120',
    valueType: 'num',
  ),
  InspectItem(
    name: 'Inside\n(paint)',
    unit: '1-용융도금\n2-EP UNI PRIMER G/YELLOW(70)\n3-EPOXY 7.5 BG 7/2(50)',
    spec: '',
    valueType: 'bool',
  ),
  InspectItem(
    name: 'OUT\n도막',
    unit: '',
    spec: '120',
    valueType: 'num',
  ),
  InspectItem(
    name: 'Outside\n(paint)',
    unit: '',
    spec: 'IN/OUT 동일',
    valueType: 'bool',
  ),
];
