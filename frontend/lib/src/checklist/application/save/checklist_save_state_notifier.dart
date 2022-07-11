import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/checklist/domain/entities/check_image.dart';
import 'package:frontend/src/checklist/domain/entities/check_item.dart';
import 'package:frontend/src/checklist/domain/usecases/save_imagelist.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/check_image_dto.dart';
import 'package:frontend/src/checklist/infrastructure/dtos/check_item_dto.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/image/domain/usecases/save_images.dart';
import 'package:frontend/src/workorder/application/work_order/save/work_order_save_event.dart';
import 'package:frontend/src/workorder/domain/entities/qm_work_order.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/checklist/application/save/checklist_save_event.dart';
import 'package:frontend/src/checklist/application/save/checklist_save_state.dart';
import 'package:frontend/src/checklist/domain/usecases/save_checklist.dart';

class ChecklistSaveStateNotifier extends StateNotifier<ChecklistSaveState> {
  ChecklistSaveStateNotifier({
    required SaveChecklist saveChecklist,
    required SaveImagelist saveImagelist,
    required SaveImages saveImages,
    required AuthChangeNotifier authNotifier,
    required QmWorkOrder qmWorkOrder,
  })  : _saveChecklist = saveChecklist,
        _saveImagelist = saveImagelist,
        _saveImages = saveImages,
        _authNotifier = authNotifier,
        _qmWorkOrder = qmWorkOrder,
        super(const ChecklistSaveState.init());

  final SaveImages _saveImages;
  final SaveChecklist _saveChecklist;
  final SaveImagelist _saveImagelist;
  final AuthChangeNotifier _authNotifier;
  final QmWorkOrder _qmWorkOrder;

  Future<void> mapEventToState(ChecklistSaveEvent event) async {
    event.when(
      saveChecklist: _processSave,
      saveChecklistAndMore: _processSave,
      saveImagelist: _saveImageInfos,
    );
  }

  Future<void> _processSave(List<CheckItem> items,
      [WorkOrderSaveStatus? status]) async {
    state = const ChecklistSaveState.saving();

    // 저장 정보를 담기 위한 파라미터 리스트
    final parameterList = <Map<String, dynamic>>[];
    // 저장 이미지 path 리스트
    final imagePathList = <String>[];
    for (final item in items) {
      /// 1. 저장 정보 파라미터 만들기
      final params = CheckItemDto.fromDomain(item).toMap();
      params["user-id"] = _authNotifier.user!.id;
      parameterList.add(params);

      /// 2. 저장 이미지 path 따로 저장
      if (item.imageFileName != "") {
        imagePathList.add(item.imageFileName);
      }
    }

    // 체크리스트 정보 저장
    final resultsOrFailure = await _saveChecklist(parameterList);
    resultsOrFailure.fold(
      (l) {
        state = ChecklistSaveState.failure(mapFailureToString(l));
      },
      (r) async {
        // 이미지를 추가했을 때는 이미지에 대한 정보 저장
        if (imagePathList.isNotEmpty) {
          final failureOrSuccess = await _saveImages(imagePathList);
          failureOrSuccess.fold(
            (l) => state = const ChecklistSaveState.failure("이미지 저장 실패"),
            (r) {
              if (status == null) {
                state = const ChecklistSaveState.saved();
              } else {
                state = ChecklistSaveState.savedAndNext(status);
              }
            },
          );
        } else {
          if (status == null) {
            state = const ChecklistSaveState.saved();
          } else {
            state = ChecklistSaveState.savedAndNext(status);
          }
        }
      },
    );
  }

  Future<void> _saveImageInfos(List<CheckImage> items) async {
    state = const ChecklistSaveState.saving();
    final parameterList = <Map<String, dynamic>>[];

    final imagePathList = <String>[];
    for (final item in items.where((item) => item.shouldSave).toList()) {
      /// 1. 저장 정보 파라미터 만들기
      //! 관리자 요청으로 hard-coded parameter(wb-cd, wc-cd) 넘김
      final params = CheckImageDto.fromDomain(item).toMap();
      params["user-id"] = _authNotifier.user!.id;
      params["wo-nb"] = _qmWorkOrder.code;
      params["wc-cd"] = "999";
      params["wb-cd"] = "QML";
      // params["wc-cd"] = _qmWorkOrder.wcCd;
      // params["wb-cd"] = _qmWorkOrder.wbCd;
      params["plan-seq"] = _qmWorkOrder.planSeq.toString();
      parameterList.add(params);

      /// 2. 저장 이미지 path 따로 저장
      if (item.path != "" && item.isLocal) {
        imagePathList.add(item.path);
      }
    }

    final resultsOrFailure = await _saveImagelist(parameterList);
    resultsOrFailure.fold(
      (l) => state = ChecklistSaveState.failure(mapFailureToString(l)),
      (r) async {
        // 이미지를 추가했을 때는 이미지에 대한 정보 저장
        if (imagePathList.isNotEmpty) {
          final failureOrSuccess = await _saveImages(imagePathList);
          state = failureOrSuccess.fold(
            (l) => const ChecklistSaveState.failure("이미지 저장 실패"),
            (r) => const ChecklistSaveState.saved(),
          );
        } else {
          state = const ChecklistSaveState.saved();
        }
      },
    );
  }
}
