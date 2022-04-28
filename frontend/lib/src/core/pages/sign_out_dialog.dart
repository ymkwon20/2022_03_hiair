import 'package:flutter/material.dart';
import 'package:frontend/src/auth/presentation/view_model/auth_chage_notifier.dart';
import 'package:frontend/src/core/constants/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignOutDialog extends ConsumerStatefulWidget {
  const SignOutDialog({
    Key? key,
    required this.visible,
    required this.onCancel,
    required this.onYes,
  }) : super(key: key);

  final bool visible;
  final VoidCallback onCancel;
  final VoidCallback onYes;

  @override
  ConsumerState<SignOutDialog> createState() => __SignOutDialogState();
}

class __SignOutDialogState extends ConsumerState<SignOutDialog> {
  @override
  void didUpdateWidget(covariant SignOutDialog oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.visible != oldWidget.visible) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authChangeNotifierProvider).user;
    return widget.visible
        ? GestureDetector(
            onTap: widget.onCancel,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor.withOpacity(.2),
              ),
              alignment: Alignment.center,
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).shadowColor.withOpacity(.5),
                      blurRadius: LayoutConstant.radiusXS,
                      offset: const Offset(
                          LayoutConstant.spaceXS, LayoutConstant.spaceXS),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: LayoutConstant.paddingM),
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(LayoutConstant.radiusM),
                          )),
                      alignment: Alignment.center,
                      child: const Text(
                        "로그 아웃",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: LayoutConstant.spaceM),
                    Text.rich(
                      TextSpan(
                        text: "${user!.name} 님\n",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        children: const [
                          TextSpan(
                            text: "로그아웃 하시겠습니까?",
                            style: TextStyle(fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: LayoutConstant.spaceM),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: _Button(
                            name: "No",
                            onTap: widget.onCancel,
                          ),
                        ),
                        Expanded(
                          child: _Button(
                            name: "Yes",
                            onTap: widget.onYes,
                            isPrimary: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key? key,
    required this.name,
    this.isPrimary = false,
    this.onTap,
  }) : super(key: key);

  final String name;
  final bool isPrimary;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: LayoutConstant.paddingM,
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: isPrimary
              ? TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                )
              : null,
        ),
      ),
    );
  }
}
