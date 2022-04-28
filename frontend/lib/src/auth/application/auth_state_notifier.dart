import 'package:frontend/src/auth/domain/entities/auth_failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/domain/usecases/load_stored_user.dart';
import 'package:frontend/src/auth/domain/usecases/sign_in.dart';
import 'package:frontend/src/auth/domain/usecases/sign_out.dart';

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier({
    required LoadStoredUser loadStoredUser,
    required SignIn signIn,
    required SignOut signOut,
  })  : _loadStoredUser = loadStoredUser,
        _signIn = signIn,
        _signOut = signOut,
        super(const AuthState.initial());

  final LoadStoredUser _loadStoredUser;
  final SignIn _signIn;
  final SignOut _signOut;

  Future<void> mapEventToState(AuthEvent event) async {
    event.when(
      loadStoredUser: () async {
        state = const AuthState.loading();
        final storedUser = await _loadStoredUser();
        if (storedUser == null) {
          state = const AuthState.unauthenticated();
        } else {
          state = AuthState.authenticated(storedUser);
        }
      },
      signIn: (Map<String, dynamic> params) async {
        state = const AuthState.loading();
        final failureOrResults = await _signIn(params);
        state = failureOrResults.fold(
          (l) => AuthState.failure(_mapFailureToEvent(l)),
          (r) => AuthState.authenticated(r),
        );
      },
      signOut: () async {
        final failureOrResults = await _signOut();
        state = failureOrResults.fold(
          (l) => AuthState.failure(_mapFailureToEvent(l)),
          (r) => const AuthState.unauthenticated(),
        );
      },
    );
  }

  String _mapFailureToEvent(AuthFailure failure) {
    return failure.when(
      storage: (message) {
        return message ?? "로그인 저장정보를 불러오는 중 에러가 발생하였습니다.";
      },
      server: (message) {
        return message ?? "서버로 부터 에러가 발생했습니다.";
      },
    );
  }
}
