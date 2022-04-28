import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();
  const factory AuthEvent.loadStoredUser() = _LoadStoredUser;
  const factory AuthEvent.signIn(Map<String, dynamic> params) = _SignIn;
  const factory AuthEvent.signOut() = _SignOut;
}
