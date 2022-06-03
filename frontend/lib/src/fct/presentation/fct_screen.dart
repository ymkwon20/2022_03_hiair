import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/fct/presentation/view_models/fct_change_notifier.dart';
import 'package:frontend/src/workorder/presentation/screens/custom_table.dart';
import 'package:frontend/src/workorder/presentation/screens/tablerows/work_order_failure_row.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/fct/application/fct/fct_state.dart';
import 'package:frontend/src/fct/application/save/fct_save_event.dart';
import 'package:frontend/src/fct/application/save/fct_save_state.dart';
import 'package:frontend/src/fct/dependency_injection.dart';
import 'package:frontend/src/fct/domain/entities/fct.dart';
import 'package:frontend/src/fct/presentation/tablerows/fct/fct_loaded_row.dart';
import 'package:frontend/src/fct/presentation/tablerows/fct/fct_loading_row.dart';

class FctScreen extends ConsumerStatefulWidget {
  const FctScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FctScreen> createState() => _FctScreenState();
}

class _FctScreenState extends ConsumerState<FctScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextEditingController _textEditingController;
  static final _slideTween = CurveTween(curve: Curves.ease);

  int? _selectedIndex;
  Fct? _selectedItem;

  double normalWidth = 100;
  double qtyWidth = 100;
  double remarkWidth = 400;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  void _showFlashBar({
    required String title,
    required String content,
    Color? backgroundColor,
    Color? textColor,
  }) {
    showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      builder: (context, controller) {
        return Padding(
          padding: const EdgeInsets.all(LayoutConstant.paddingM),
          child: Flash.bar(
            position: FlashPosition.top,
            enableVerticalDrag: true,
            horizontalDismissDirection: HorizontalDismissDirection.horizontal,
            borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
            backgroundColor: backgroundColor,
            controller: controller,
            child: FlashBar(
              content: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: textColor),
                  ),
                  const SizedBox(width: LayoutConstant.spaceM),
                  Text(
                    content,
                    style: TextStyle(color: textColor),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _editRemark() {
    setState(() {
      ref.read(fctChangeNotifierProvider).setValue(
            _selectedIndex!,
            _selectedItem!.copyWith(
              remark: _textEditingController.text,
            ),
          );
      _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<FctState>(
      fctStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          loaded: (fcts) {
            ref.read(fctChangeNotifierProvider).setItems(fcts);
          },
          orElse: () {},
        );
      },
    );

    ref.listen<FctSaveState>(
      fctSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            context.pop();
            _showFlashBar(
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          failure: (message) {
            _showFlashBar(
              title: "저장 오류",
              content: message,
              backgroundColor: ThemeConstant.errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    final state = ref.watch(fctStateNotifierProvider);

    final fctItemsNotifier = ref.watch(fctChangeNotifierProvider);

    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 2 * LayoutConstant.spaceXL),
                const Text(
                  "철판 수량",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: LayoutConstant.spaceL),
                Expanded(
                  child: CustomTable(
                    onRowPressed: (index) {
                      _selectedItem = fctItemsNotifier.items[index];
                      _selectedIndex = index;
                      _controller.forward();
                      _textEditingController.text =
                          fctItemsNotifier.items[index].remark;
                    },
                    headers: [
                      CustomTableHeader(title: "두께", width: normalWidth),
                      CustomTableHeader(title: "가로", width: normalWidth),
                      CustomTableHeader(title: "세로", width: normalWidth),
                      CustomTableHeader(title: "절단수량", width: qtyWidth),
                      CustomTableHeader(title: "원판수량", width: qtyWidth),
                      CustomTableHeader(title: "특이사항", width: remarkWidth),
                    ],
                    rowBuilder: (context, index) {
                      return state.when(
                        init: () {
                          return FctLoadingRow();
                        },
                        loading: () {
                          return FctLoadingRow();
                        },
                        loaded: (fcts) {
                          return FctLoadedRow(
                            fct: fctItemsNotifier.items[index],
                          );
                        },
                        failure: (message) {
                          return WorkOrderFailureRow(message: message);
                        },
                      );
                    },
                    rowCount: state.when(
                        init: () => 0,
                        loading: () => 30,
                        loaded: (_) => fctItemsNotifier.items.length.toInt(),
                        failure: (message) => 1),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: normalWidth * 3,
                      alignment: Alignment.center,
                      child: const Text(
                        "합계",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    _SumTextBox(isCut: true, width: qtyWidth),
                    _SumTextBox(isCut: false, width: qtyWidth),
                    SizedBox(width: remarkWidth),
                  ],
                ),
                const SizedBox(height: LayoutConstant.spaceXL),
              ],
            ),
          ),
          _buildAbsorber(),
          Positioned(
            right: LayoutConstant.spaceXL,
            bottom: LayoutConstant.spaceXL,
            child: GestureDetector(
              onTap: () {
                ref.read(fctSaveStateNotifierProvider.notifier).mapEventToState(
                      FctSaveEvent.saveFctItem(
                        ref.watch(fctChangeNotifierProvider).items,
                      ),
                    );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingL,
                  vertical: LayoutConstant.paddingM,
                ),
                child: const Text(
                  "저장",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          _buildDrawer(),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final width = MediaQuery.of(context).size.width / 3;
        return Positioned(
          top: LayoutConstant.spaceXL,
          bottom: LayoutConstant.spaceL,
          right: (_slideTween.animate(_controller).value - 1) * width,
          child: Container(
            width: width,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(LayoutConstant.radiusL),
              ),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(2, -1),
                  blurRadius: LayoutConstant.radiusXS,
                  color: Theme.of(context).shadowColor.withOpacity(.7),
                ),
              ],
            ),
            child: _controller.value > 0
                ? SingleChildScrollView(
                    child: Padding(
                        padding: const EdgeInsets.all(LayoutConstant.paddingL),
                        child: Column(
                          children: [
                            const SizedBox(height: LayoutConstant.spaceM),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "특이사항",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: GestureDetector(
                                onTap: _editRemark,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: LayoutConstant.paddingM,
                                    vertical: LayoutConstant.paddingS,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColorDark,
                                    borderRadius: BorderRadius.circular(
                                      LayoutConstant.radiusS,
                                    ),
                                  ),
                                  child: const Text(
                                    "수정",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: LayoutConstant.spaceM),
                            TextField(
                              controller: _textEditingController,
                              autofocus: true,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              maxLines: 15,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: LayoutConstant.paddingL,
                                  horizontal: LayoutConstant.paddingM,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: LayoutConstant.spaceXS,
                                  color: Theme.of(context).dividerColor,
                                )),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: LayoutConstant.spaceM,
                                  color: Theme.of(context).dividerColor,
                                )),
                              ),
                              onSubmitted: (_) => _editRemark(),
                            ),
                          ],
                        )),
                  )
                : const SizedBox(),
          ),
        );
      },
    );
  }

  Widget _buildAbsorber() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return _controller.value > 0
            ? GestureDetector(
                onTap: () {
                  _controller.reverse();
                },
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                ),
              )
            : const SizedBox();
      },
    );
  }
}

class _SumTextBox extends ConsumerWidget {
  const _SumTextBox({
    Key? key,
    required this.width,
    required this.isCut,
  }) : super(key: key);

  final double width;
  // UnFoundProviderError를 해결하기 위한 임시 방편
  final bool isCut;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fctStateNotifierProvider);

    return Container(
      width: width,
      alignment: Alignment.center,
      child: state.when(
        init: () {
          return _buildLoadingBar(context);
        },
        loading: () {
          return _buildLoadingBar(context);
        },
        loaded: (_) {
          return Text(
            isCut
                ? "${ref.watch(fctChangeNotifierProvider).items.map((fct) => fct.cutQty).reduce((value, element) => value + element)}"
                : "${ref.watch(fctChangeNotifierProvider).items.map((fct) => fct.panQty).reduce((value, element) => value + element)}",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          );
        },
        failure: (message) {
          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildLoadingBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: LayoutConstant.paddingM,
        vertical: LayoutConstant.paddingS,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
        color: Theme.of(context).dividerColor,
      ),
    );
  }
}
