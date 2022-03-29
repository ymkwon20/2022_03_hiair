// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/core/constants/index.dart';
import 'package:frontend/src/inspection/presentation/fakes/inspect_item.dart';
import 'package:frontend/src/inspection/presentation/prototypes/image_pile.dart';
import 'package:frontend/src/inspection/presentation/prototypes/qm_product_details_screen2.dart';

/// Fan Performance, Paint 작업 검사 항목 리스트
class InspectList extends ConsumerWidget {
  const InspectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _inspectItems = ref.watch(inspectSpec).items;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return InspectItemWidget(inspectItem: _inspectItems[index]);
        },
        childCount: _inspectItems.length,
      ),
    );
  }
}

class InspectItemWidget extends StatefulWidget {
  const InspectItemWidget({
    Key? key,
    required this.inspectItem,
  }) : super(key: key);

  final InspectItem inspectItem;

  @override
  State<InspectItemWidget> createState() => _InspectItemWidgetState();
}

class _InspectItemWidgetState extends State<InspectItemWidget> {
  late FocusNode _valueFocusNode;
  late TextEditingController _textEditingController;

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _valueFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _valueFocusNode.dispose();
    super.dispose();
  }

  bool get _isUnitSelected =>
      widget.inspectItem.unit == "" && widget.inspectItem.unitList != null;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      child: Focus(
        onFocusChange: (isFocused) {
          if (!isFocused) {
            setState(() {
              hasFocus = false;
              // TODO: change values edited
            });
          } else {
            _textEditingController
              ..text = widget.inspectItem.inspectValue ?? ''
              ..selection = TextSelection.fromPosition(
                TextPosition(offset: _textEditingController.text.length),
              );
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(LayoutConstant.paddingL),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    widget.inspectItem.name,
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: ImagePile(
                          images: widget.inspectItem.imgPaths,
                          imagePercentOverlap: 0.1,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Unit',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (widget.inspectItem.unitList != null) {
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  // scroll 굴릴 때 잘못해서 꺼질 경우를 고려하여 설정함
                                  enableDrag: false,
                                  builder: (context) {
                                    return _BottomModal(
                                      item: widget.inspectItem,
                                    );
                                  },
                                ).then(
                                  (value) {
                                    final returnValue = value as String?;
                                    if (returnValue != null) {
                                      print(value);
                                    }
                                  },
                                  onError: (err, st) => print('error'),
                                );
                              }
                            },
                            child: Container(
                              width: 120,
                              padding: const EdgeInsets.symmetric(
                                horizontal: LayoutConstant.paddingS,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    LayoutConstant.radiusS),
                                border: Border.all(
                                  width: 2,
                                  color: widget.inspectItem.unitList != null
                                      ? Theme.of(context).primaryColor
                                      : Theme.of(context).dividerColor,
                                ),
                              ),
                              alignment: Alignment.centerRight,
                              child: Text(
                                _isUnitSelected
                                    ? 'Not Selected'
                                    : widget.inspectItem.unit,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  color: _isUnitSelected
                                      ? Theme.of(context).primaryColor
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: LayoutConstant.spaceM),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            'Actual.',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                hasFocus = true;
                              });
                              _valueFocusNode.requestFocus();
                            },
                            child: Container(
                              width: 120,
                              padding: const EdgeInsets.symmetric(
                                horizontal: LayoutConstant.paddingS,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    LayoutConstant.radiusS),
                                border: Border.all(
                                  width: 2,
                                  color: Theme.of(context).dividerColor,
                                ),
                              ),
                              alignment: Alignment.centerRight,
                              child: hasFocus
                                  ? TextField(
                                      focusNode: _valueFocusNode,
                                      controller: _textEditingController,
                                    )
                                  : Text(
                                      widget.inspectItem.inspectValue ?? '',
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomModal extends StatefulWidget {
  const _BottomModal({
    Key? key,
    required this.item,
  }) : super(key: key);

  final InspectItem item;

  @override
  State<_BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<_BottomModal> {
  int _currentIndex = 0;

  bool hasSameIndex(int index) => _currentIndex == index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(
            LayoutConstant.radiusL,
          ),
          topRight: Radius.circular(
            LayoutConstant.radiusL,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.paddingM),
            child: Text(
              widget.item.name,
              style: Theme.of(context).textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 2,
            color: Theme.of(context).dividerColor,
          ),
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Center(
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).selectedRowColor,
                    ),
                  ),
                ),
                SizedBox.expand(
                  child: ListWheelScrollView.useDelegate(
                    onSelectedItemChanged: (int index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    itemExtent: 50,
                    perspective: 0.005,
                    diameterRatio: 1.2,
                    physics: const FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: widget.item.unitList!.items.length,
                      builder: (context, index) {
                        return Center(
                          child: Text(
                            widget.item.unitList!.items[index],
                            style: TextStyle(
                                fontWeight: hasSameIndex(index)
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: hasSameIndex(index) ? 25 : 20),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(
              LayoutConstant.paddingL,
            ),
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    /// Caution: GoRoute의 pop을 이용하면
                    ///           페이지까지 같이 이동 되버리기
                    ///           때문에 주의
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(LayoutConstant.paddingS),
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Theme.of(context).unselectedWidgetColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: LayoutConstant.spaceM),
                TextButton(
                  onPressed: () {
                    /// Caution: GoRoute의 pop을 이용하면
                    ///           페이지까지 같이 이동 되버리기
                    ///           때문에 주의
                    Navigator.of(context)
                        .pop(widget.item.unitList!.items[_currentIndex]);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(LayoutConstant.paddingS),
                    child: Text(
                      'Select',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
