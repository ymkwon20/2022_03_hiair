import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_event.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_state.dart';
import 'package:frontend/src/impeller/domain/entities/barcode.dart';
import 'package:frontend/src/impeller/domain/usecases/get_qr_barcode.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BarcodeStateNotifier extends StateNotifier<BarcodeState> {
  BarcodeStateNotifier({
    required WorkBaseChangeNotifier workbase,
    required GetQRBarcode qrBarcode,
  })  : _workbase = workbase,
        _getQRBarcode = qrBarcode,
        super(const BarcodeState.initial(Barcode(qrBarcodeString: '')));

  final WorkBaseChangeNotifier _workbase;
  final GetQRBarcode _getQRBarcode;

  Future<void> mapEventToState(BarcodeEvent event) async {
    event.when(
      getQRBarcode: (barcode, impeller) async {
        final params = {
          "planSeq": impeller.planSeq,
          "wb-nm": impeller.code,
          "wc-cd": impeller.wcCd,
          "wb-cd": impeller.wbCd,
        };

        final resultsOrFailure = await _getQRBarcode(params);
        state = resultsOrFailure.fold(
          (l) => BarcodeState.failure(barcode, mapFailureToString(l)),
          (r) =>
              BarcodeState.loaded(Barcode(qrBarcodeString: r.qrBarcodeString)),
        );
      },
    );
  }
}
