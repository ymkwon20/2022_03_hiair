import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/dependency_injection.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_state.dart';
import 'package:frontend/src/impeller/application/impeller/load/barcode_state_notifier.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_state.dart';
import 'package:frontend/src/impeller/application/impeller/load/impeller_state_notifier.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state.dart';
import 'package:frontend/src/impeller/application/impeller/save/impeller_save_state_notifier.dart';
import 'package:frontend/src/impeller/domain/repositories/i_barcode_repository.dart';
import 'package:frontend/src/impeller/domain/repositories/i_impeller_repository.dart';
import 'package:frontend/src/impeller/domain/usecases/fetch_impeller_list.dart';
import 'package:frontend/src/impeller/domain/usecases/fetch_impeller_single_list.dart';
import 'package:frontend/src/impeller/domain/usecases/get_qr_barcode.dart';
import 'package:frontend/src/impeller/domain/usecases/save_impeller.dart';
import 'package:frontend/src/impeller/domain/usecases/save_impeller_list.dart';
import 'package:frontend/src/impeller/domain/usecases/search_impeller_list.dart';
import 'package:frontend/src/impeller/domain/usecases/start_cancel_impeller.dart';
import 'package:frontend/src/impeller/domain/usecases/start_cancel_impeller_list.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/barcode_service.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/impeller_service.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/remote/barcode_remote_service.dart';
import 'package:frontend/src/impeller/infrastructure/datasources/remote/impeller_remote_service.dart';
import 'package:frontend/src/impeller/infrastructure/repositories/barcode_repository.dart';
import 'package:frontend/src/impeller/infrastructure/repositories/impeller_repository.dart';
import 'package:frontend/src/work_base/presentation/work_base_change_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final impellerStateNotifierProvider =
    StateNotifierProvider<ImpellerStateNotifier, ImpellerState>(
  (ref) => ImpellerStateNotifier(
    workbase: ref.watch(workBaseChangeNotifierProvider),
    fetchItems: ref.watch(fetchImpellerListProvider),
    fetchImpellerSingleList: ref.watch(fetchImpellerSingleListProvider),
    searchItems: ref.watch(searchImpellerListProvider),
  ),
);

final impellerSaveStateNotifierProvider =
    StateNotifierProvider<ImpellerSaveStateNotifier, ImpellerSaveState>(
  (ref) => ImpellerSaveStateNotifier(
    saveImpeller: ref.watch(saveImpellerProvider),
    saveImpellerList: ref.watch(saveImpellerListProvider),
    authNotifier: ref.watch(authChangeNotifierProvider),
    fetchAndSaveChecklist: ref.watch(fetchAndSaveChecklistProvider),
    startCancelImpeller: ref.watch(startCancelImpellerProvider),
    startCancelImpellerList: ref.watch(startCancelImpellerListProvider),
  ),
);

final fetchImpellerListProvider = Provider(
  (ref) => FetchImpellerList(repository: ref.watch(impellerRepositoryProvider)),
);
final fetchImpellerSingleListProvider = Provider(
  (ref) => FetchImpellerSingleList(
      repository: ref.watch(impellerRepositoryProvider)),
);

final saveImpellerProvider = Provider(
  (ref) => SaveImpeller(repository: ref.watch(impellerRepositoryProvider)),
);

final saveImpellerListProvider = Provider(
  (ref) => SaveImpellerList(repository: ref.watch(impellerRepositoryProvider)),
);

final startCancelImpellerProvider = Provider(
  (ref) =>
      StartCancelImpeller(repository: ref.watch(impellerRepositoryProvider)),
);

final startCancelImpellerListProvider = Provider(
  (ref) => StartCancelImpellerList(
      repository: ref.watch(impellerRepositoryProvider)),
);
//! repository
final impellerRepositoryProvider = Provider<IImpellerRepository>(
  (ref) => ImpellerRepository(remote: ref.watch(impellerRemoteServiceProvider)),
);

//! datasource
final impellerRemoteServiceProvider = Provider<ImpellerService>(
  (ref) => ImpellerRemoteService(httpClient: ref.watch(dioProvider)),
);

final searchImpellerListProvider = Provider(
  (ref) =>
      SearchImpellerList(repository: ref.watch(impellerRepositoryProvider)),
);

final barcodeRemoteServiceProvider = Provider<BarcodeService>(
  (ref) => BarcodeRemoteService(httpClient: ref.watch(dioProvider)),
);

final barcodeRepositoryProvider = Provider<IBarcodeRepository>(
  (ref) => BarcodeRepository(remote: ref.watch(barcodeRemoteServiceProvider)),
);

final getQRBarcodeProvider = Provider(
  (ref) => GetQRBarcode(repository: ref.watch(barcodeRepositoryProvider)),
);

final barcodeStateNotifierProvider =
    StateNotifierProvider<BarcodeStateNotifier, BarcodeState>(
  (ref) => BarcodeStateNotifier(
    workbase: ref.watch(workBaseChangeNotifierProvider),
    qrBarcode: ref.watch(getQRBarcodeProvider),
  ),
);
