import 'package:flutter/material.dart';
import 'package:frontend/src/auth/application/auth_event.dart';
import 'package:frontend/src/auth/application/auth_state.dart';
import 'package:frontend/src/auth/dependency_injection.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 로그인 Form 위젯
///
/// 로그인 state 에 따라 build가 계속 되므로 큰 Widget에서는
/// performance에 영향을 줄 수 있어서 따로 만들어줌
class SignInFormWidget extends ConsumerStatefulWidget {
  const SignInFormWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends ConsumerState<SignInFormWidget> {
  final formKey = GlobalKey<FormState>();

  late TextEditingController _idController;
  late FocusNode _idFocus;
  late FocusScopeNode _scopeNode;

  @override
  void initState() {
    super.initState();

    _idController = TextEditingController();
    _idFocus = FocusNode();
    _scopeNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _idController.dispose();
    _idFocus.dispose();
    _scopeNode.dispose();
    super.dispose();
  }

  String? formValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "값을 입력하지 않았습니다";
    } else {
      return null;
    }
  }

  void _onPressed() {
    _scopeNode.unfocus();
    if (formKey.currentState!.validate() == true) {
      final params = {
        "id": _idController.text,
      };

      ref.read(authStateNotifierProvider.notifier).mapEventToState(
            AuthEvent.signIn(params),
          );
    }
  }

  void _onFieldSubmit(String _) {
    if (_idController.text.isEmpty) {
      _idFocus.requestFocus();
    } else {
      _onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authStateNotifierProvider);

    final size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FocusScope(
              node: _scopeNode,
              child: Form(
                key: formKey,
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: size.width / 3,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: LayoutConstant.spaceL),
                      _buildTextFormField(context),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            ScaleButton(
              onTap: _onPressed,
              child: Container(
                padding: const EdgeInsets.all(LayoutConstant.paddingL),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildWidgetByState(authState),
                ),
              ),
            ),
            const SizedBox(height: LayoutConstant.spaceM),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: authState.maybeWhen(
                failure: (String message) {
                  return Text(
                    message,
                    key: const ValueKey("error-message"),
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                    ),
                  );
                },
                orElse: () {
                  return const SizedBox(
                    key: ValueKey("empty"),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildWidgetByState(AuthState state) {
    return state.maybeWhen(
      loading: () {
        return const CircularProgressIndicator(
          strokeWidth: LayoutConstant.spaceS,
          color: Colors.white,
        );
      },
      authenticated: (_) {
        return const SizedBox();
      },
      failure: (_) {
        return const Icon(
          Icons.close,
          color: Colors.white,
        );
      },
      orElse: () {
        return const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white,
        );
      },
    );
  }

  Widget _buildTextFormField(
    BuildContext context,
  ) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        focusNode: _idFocus,
        controller: _idController,
        autocorrect: false,
        obscureText: false,
        style: const TextStyle(
          fontSize: 24,
        ),
        validator: formValidator,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: LayoutConstant.paddingL,
            vertical: LayoutConstant.paddingS,
          ),
          errorStyle: const TextStyle(height: .8),
          hintText: "ID",
          // Enabled Border
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: LayoutConstant.spaceXS,
            ),
          ),
          // Focused Border
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: LayoutConstant.spaceS,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          // Error Border
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: LayoutConstant.spaceXS,
              color: Theme.of(context).errorColor,
            ),
          ),
          // Focused Error Border
          focusedErrorBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              width: LayoutConstant.spaceXS,
            ),
          ),
        ),
        onFieldSubmitted: _onFieldSubmit,
      ),
    );
  }
}
