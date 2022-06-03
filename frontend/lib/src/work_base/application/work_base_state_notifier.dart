import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/domain/entities/failure.dart';
import 'package:frontend/src/work_base/application/work_base_event.dart';
import 'package:frontend/src/work_base/application/work_base_state.dart';
import 'package:frontend/src/work_base/domain/usecase/fetch_work_bases.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WorkBaseStateNotifier extends StateNotifier<WorkBaseState> {
  WorkBaseStateNotifier({
    required FetchWorkBases fetchWorkBases,
    required AuthChangeNotifier auth,
  })  : _fetchWorkBases = fetchWorkBases,
        _authNotifier = auth,
        super(const WorkBaseState.init());

  final FetchWorkBases _fetchWorkBases;
  final AuthChangeNotifier _authNotifier;

  Future<void> mapEventToState(WorkBaseEvent event) async {
    event.when(
      fetchWorkBases: () async {
        state = const WorkBaseState.loading();

        final params = {
          "code": _authNotifier.user!.wcCd,
        };

        final failureOrResults = await _fetchWorkBases(params);

        state = failureOrResults.fold(
          (l) => WorkBaseState.failure(mapFailureToString(l)),
          (r) => WorkBaseState.loaded(r),
        );
      },
    );
  }
}
