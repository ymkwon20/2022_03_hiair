import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/qm/presentation/fakes/inspect_item.dart';
import 'package:frontend/src/qm/presentation/prototypes/image_pile.dart';
import 'package:frontend/src/qm/presentation/prototypes/qm_product_details_screen.dart';

/// Fan Performance, Paint 작업 검사 항목 리스트
class InspectListWidget extends ConsumerStatefulWidget {
  const InspectListWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<InspectListWidget> createState() => _InspectListState();
}

class _InspectListState extends ConsumerState<InspectListWidget> {
  late ScrollController _scrollController;
  late TextEditingController _textController;
  late FocusScopeNode _node;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _textController = TextEditingController();
    _node = FocusScopeNode();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _textController.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _inspectSpec = ref.watch(inspectSpec);

    return Scaffold(
      body: FocusScope(
        key: ValueKey(_inspectSpec.name),
        node: _node,
        child: Stack(
          children: [
            Positioned(
              top: 40,
              bottom: 0,
              left: 0,
              right: 0,
              child: ScrollConfiguration(
                behavior: NoGlowBehavior(),
                child: ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return InspectItemWidget(
                      items: _inspectSpec.items,
                      index: index,
                      node: _node,
                      scrollController: _scrollController,
                    );
                  },
                  itemCount: _inspectSpec.items.length,
                ),
              ),
            ),
            Positioned(
              top: LayoutConstant.spaceM,
              left: LayoutConstant.spaceM,
              right: LayoutConstant.spaceM,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    _inspectSpec.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "검사항목: ${_inspectSpec.items.length} 개",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
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

/// Fan Performance, Paint 작업 검사 항목 아이템
class InspectItemWidget extends ConsumerStatefulWidget {
  const InspectItemWidget({
    Key? key,
    required this.items,
    required this.index,
    required this.node,
    required this.scrollController,
  }) : super(key: key);

  final List<InspectItem> items;
  final int index;
  final FocusScopeNode node;
  final ScrollController scrollController;

  @override
  ConsumerState<InspectItemWidget> createState() => _InspectItemWidgetState();
}

class _InspectItemWidgetState extends ConsumerState<InspectItemWidget> {
  late TextEditingController _textEditingController;

  late InspectItem _item;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    _item = widget.items[widget.index];
    _textEditingController.text = _item.inspectValue;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  bool get _isUnitSelected =>
      // todo: change this after getting valid data
      _item.unit == "" && _item.unitList != null;
  // widget.inspectItem.unit == "" && widget.inspectItem.unitList != null;

  /// 키보드 값을 입력한 이후 다음 input 값이 있는지 확인하기 위한 값
  /// 마지막 input 값을 입력한 후 발생하는 오류를 막기 위한 조치
  bool get hasMoreInputNext {
    if (widget.index == widget.items.length - 1) {
      return false;
    }

    for (int index = widget.index + 1;
        index < widget.items.length - 1;
        index++) {
      if (widget.items[index].valueType == "num") {
        return true;
      }
    }
    return false;
  }

  /// 키보드 입력값 처리
  void _onEditingComplete() {
    // TODO: edit stateprovider logic
    ref.read(inspectSpec).items =
        ref.watch(inspectSpec).items.mapIndexed((index, item) {
      if (index == widget.index) {
        return item.copyWith(
          inspectValue: _textEditingController.text,
        );
      } else {
        return item;
      }
    }).toList();

    /// 다음 커서로 이동 혹은 키보드 내리기
    if (hasMoreInputNext) {
      widget.node.nextFocus();
    } else {
      widget.node.unfocus();
    }
  }

  /// 단위 값 처리
  void _onUnitSelect(String? value) {
    if (value != null) {
      // TODO: edit stateprovider logic
      ref.read(inspectSpec).items =
          ref.watch(inspectSpec).items.mapIndexed((index, item) {
        if (index == widget.index) {
          return item.copyWith(
            unit: value,
          );
        } else {
          return item;
        }
      }).toList();

      setState(
        () {
          _item = _item.copyWith(
            unit: value,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.node.unfocus,
      behavior: HitTestBehavior.translucent,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: LayoutConstant.paddingL,
          vertical: LayoutConstant.paddingM,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
          color: Theme.of(context).cardColor,
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: LayoutConstant.spaceXS,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(LayoutConstant.paddingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${widget.index + 1}. ${_item.name}",
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceS),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const SizedBox(width: LayoutConstant.spaceS),
                      SizedBox(
                        width: 200,
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 200),
                          child: ImagePile(
                            // todo: change this after getting valid data
                            // images: widget.inspectItem.imgPaths,
                            images: _item.imgPaths,
                            imagePercentOverlap: 0.1,
                            onTap: () {
                              // TODO: add image attach logic
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Not yet implemented'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Spec',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(height: LayoutConstant.spaceS),
                                _Popupable(
                                  spec: _item.spec,
                                ),
                              ],
                            ),
                            const SizedBox(height: LayoutConstant.spaceS),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Actual.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: _item.valueType == "num"
                                          ? TextFormField(
                                              controller:
                                                  _textEditingController,
                                              // TODO: edit value on inputType value
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                fontSize: 22,
                                              ),
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  vertical:
                                                      LayoutConstant.paddingXS,
                                                  horizontal:
                                                      LayoutConstant.paddingM,
                                                ),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          LayoutConstant
                                                              .radiusS),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                    width:
                                                        LayoutConstant.spaceXS,
                                                  ),
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    LayoutConstant.radiusS,
                                                  ),
                                                  borderSide: BorderSide(
                                                    color: Theme.of(context)
                                                        .dividerColor,
                                                    width:
                                                        LayoutConstant.spaceXS,
                                                  ),
                                                ),
                                              ),
                                              onEditingComplete:
                                                  _onEditingComplete,
                                            )
                                          : Align(
                                              alignment: Alignment.centerRight,
                                              child: Checkbox(
                                                value: false,
                                                onChanged: (value) {},
                                              ),
                                            ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: GestureDetector(
                                        onTap: () {
                                          widget.node.unfocus();
                                          if (_item.unitList != null) {
                                            showModalBottomSheet<String>(
                                              context: context,
                                              backgroundColor:
                                                  Colors.transparent,
                                              // scroll 굴릴 때 잘못해서 꺼질 경우를 고려하여 설정함
                                              enableDrag: false,

                                              builder: (context) {
                                                return _BottomModal(
                                                  // todo: change this after getting valid data
                                                  // item: widget.inspectItem,
                                                  item: _item,
                                                );
                                              },
                                            ).then(_onUnitSelect);
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: LayoutConstant.paddingS,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                LayoutConstant.radiusS),
                                            border: Border.all(
                                              width: LayoutConstant.spaceXS,
                                              // todo: change this after getting valid data
                                              // color: widget.inspectItem.unitList != null
                                              color: _item.unitList != null
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Theme.of(context)
                                                      .dividerColor,
                                            ),
                                          ),
                                          child: Text(
                                            _isUnitSelected
                                                ? 'Select'
                                                // todo: change this after getting valid data
                                                // : widget.inspectItem.unit,
                                                : _item.unit,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 22,
                                              color: _isUnitSelected
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : null,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
            height: LayoutConstant.spaceXS,
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
                              fontSize: hasSameIndex(index) ? 25 : 20,
                              color: hasSameIndex(index)
                                  ? Theme.of(context).colorScheme.secondary
                                  : null,
                            ),
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

class _Popupable extends StatefulWidget {
  const _Popupable({
    Key? key,
    required this.spec,
  }) : super(key: key);

  final String spec;

  @override
  State<_Popupable> createState() => __PopupableState();
}

class __PopupableState extends State<_Popupable> {
  double _dx = 0, _dy = 0;

  Color? borderColor;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      borderColor = Theme.of(context).dividerColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        if (widget.spec != "") {
          _dx = details.globalPosition.dx;
          _dy = details.globalPosition.dy;
          setState(() {
            borderColor = Theme.of(context).colorScheme.secondary;
          });
        }
      },
      onLongPressCancel: () {
        setState(() {
          borderColor = Theme.of(context).dividerColor;
        });
      },
      onTapUp: (details) {
        setState(() {
          borderColor = Theme.of(context).dividerColor;
        });
      },
      onLongPress: () {
        if (widget.spec != "") {
          showDialog(
            context: context,
            barrierColor: Colors.black12,
            builder: (context) {
              return RectDialog(
                dx: _dx,
                dy: _dy,
                child: Text(
                  widget.spec,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              );
            },
          );
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: LayoutConstant.paddingS,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusS),
          border: Border.all(
            width: LayoutConstant.spaceXS,
            color: borderColor ?? Theme.of(context).dividerColor,
          ),
        ),
        child: Text(
          widget.spec,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}
