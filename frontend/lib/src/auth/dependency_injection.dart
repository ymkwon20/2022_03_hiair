import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/application/auth_state_notifier.dart';
import 'package:frontend/src/auth/domain/repositories/i_auth_repository.dart';
import 'package:frontend/src/auth/domain/usecases/load_stored_user.dart';
import 'package:frontend/src/auth/domain/usecases/sign_in.dart';
import 'package:frontend/src/auth/domain/usecases/sign_out.dart';
import 'package:frontend/src/auth/infrastructure/datasources/local/auth_local_secure_service.dart';
import 'package:frontend/src/auth/infrastructure/datasources/local/auth_local_service.dart';
import 'package:frontend/src/auth/infrastructure/datasources/remote/auth_remote_dio_service.dart';
import 'package:frontend/src/auth/infrastructure/datasources/remote/auth_remote_service.dart';
import 'package:frontend/src/auth/infrastructure/repositories/auth_repository.dart';
import 'package:frontend/src/auth/presentation/viewmodels/auth_chage_notifier.dart';
import 'package:frontend/src/core/dependency_injection.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//! Application
final authStateNotifierProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(
    authNotifier: ref.watch(authChangeNotifierProvider),
    loadStoredUser: ref.watch(loadStoredUserUsecaseProvider),
    signIn: ref.watch(signInUsecaseProvider),
    signOut: ref.watch(signOutUsecaseProvider),
  ),
);

//! Usecase
final loadStoredUserUsecaseProvider = Provider<LoadStoredUser>(
  (ref) => LoadStoredUser(repository: ref.watch(authRepositoryProvider)),
);

final signInUsecaseProvider = Provider<SignIn>(
  (ref) => SignIn(repository: ref.watch(authRepositoryProvider)),
);

final signOutUsecaseProvider = Provider<SignOut>(
  (ref) => SignOut(repository: ref.watch(authRepositoryProvider)),
);

//! Repository
final authRepositoryProvider = Provider<IAuthRepository>(
  (ref) => AuthRepository(
    localService: ref.watch(authLocalServiceProvider),
    remoteService: ref.watch(authRemoteServiceProvider),
  ),
);

//! Datasource
final authLocalServiceProvider = Provider<AuthLocalService>(
  (ref) =>
      AuthLocalSecureService(storage: ref.watch(flutterSecureStorageProvider)),
);

final authRemoteServiceProvider = Provider<AuthRemoteService>(
  (ref) => AuthRemoteDioService(httpClient: ref.watch(dioProvider)),
);

//! External
final flutterSecureStorageProvider = Provider(
  (ref) => const FlutterSecureStorage(),
);
