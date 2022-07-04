import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/core/presentation/widgets/linked_scroll_controller.dart';

/// reference: https://github.com/crizant/flutter_multiplication_table/tree/master/lib

class CustomTable extends StatefulWidget {
  const CustomTable({
    Key? key,
    required this.headers,
    this.columnSpace = 40,
    required this.rowBuilder,
    required this.rowCount,
    this.rowHeight = 70,
    this.onRowPressed,
    this.onRowLongPressed,
    this.onRefresh,
  }) : super(key: key);

  final List<CustomTableHeader> headers;
  final double columnSpace;
  final CustomTableRow Function(BuildContext, int) rowBuilder;
  final int rowCount;
  final double rowHeight;
  final void Function(int)? onRowPressed;
  final void Function(int)? onRowLongPressed;
  final Future<void> Function()? onRefresh;

  @override
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {
  late LinkedScrollControllerGroup _controllers;
  late ScrollController _headController;
  late ScrollController _bodyController;

  late ValueNotifier<bool> refreshNotifier;

  final widthList = <double>[];

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
    // long click 때 check box 보여줄 때 사용하기 위해서 삽입
    widthList.addAll(
      widget.headers
          .map(
            (header) =>
                header.width ?? header.title.length * widget.columnSpace,
          )
          .toList(),
    );
    refreshNotifier = ValueNotifier<bool>(false);
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    refreshNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomTableHead(
          scrollController: _headController,
          widthList: widthList,
          headers: widget.headers,
          height: widget.rowHeight,
        ),
        Expanded(
          child: CustomTableBody(
            scrollController: _bodyController,
            rowHeight: widget.rowHeight,
            widthList: widthList,
            rowBuilder: widget.rowBuilder,
            rowCount: widget.rowCount,
            onRowPressed: widget.onRowPressed,
            onRowLongPressed: widget.onRowLongPressed,
            onRefresh: widget.onRefresh,
            refreshNotifier: refreshNotifier,
          ),
        ),
      ],
    );
  }
}

class CustomTableHead extends StatelessWidget {
  final ScrollController scrollController;

  final double height;

  final List<double> widthList;
  final List<CustomTableHeader> headers;

  const CustomTableHead({
    Key? key,
    required this.scrollController,
    required this.height,
    required this.widthList,
    required this.headers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * height / 3,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: headers.mapIndexed(
            (index, header) {
              return SizedBox(
                width: widthList[index],
                child: CustomHeaderCell(
                  index: index,
                  header: header,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}

class CustomHeaderCell extends StatefulWidget {
  const CustomHeaderCell({
    Key? key,
    required this.index,
    required this.header,
    this.color,
  }) : super(key: key);

  final CustomTableHeader header;
  final int index;
  final Color? color;

  @override
  State<CustomHeaderCell> createState() => _CustomHeaderCellState();
}

class _CustomHeaderCellState extends State<CustomHeaderCell> {
  Color? internalColor;

  @override
  void didUpdateWidget(covariant CustomHeaderCell oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.header.children != widget.header.children) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.header.onTap?.call(widget.header.name);
      },
      onTapDown: (_) {
        setState(() {
          internalColor = Theme.of(context).primaryColorLight;
        });
      },
      onTapUp: (_) {
        setState(() {
          internalColor = null;
        });
      },
      onTapCancel: () {
        setState(() {
          internalColor = null;
        });
      },
      onLongPress: widget.header.onLongTap?.call,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: internalColor ?? widget.color,
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.header.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            if (widget.header.children.isNotEmpty) ...[
              // const SizedBox(width: LayoutConstant.spaceS),
              // widget.header.additionalChild!,

              for (var child in widget.header.children) ...[
                const SizedBox(),
                child
              ],
            ]
          ],
        ),
      ),
    );
  }
}

class CustomTableHeader {
  /// name: onTap 같은 이벤트 발생시 key값으로 사용하기 위한 field
  final String name;
  final String title;
  final double? width;
  final bool isNumeric;
  final bool canOrder;
  final AlignmentGeometry alignment;
  final void Function(String)? onTap;
  final void Function()? onLongTap;
  final List<Widget> children;
  final Color? color;

  const CustomTableHeader({
    required this.name,
    required this.title,
    this.width,
    this.isNumeric = false,
    this.canOrder = false,
    this.alignment = Alignment.center,
    this.onTap,
    this.onLongTap,
    this.children = const [],
    this.color,
  });
}

class CustomTableRow {
  /// list 형태로 늘어놓을 수 없는 아이템에 사용
  final Widget? child;
  final List<Widget> contents;
  final Color color;
  final ValueChanged<int>? onCellTap;

  const CustomTableRow({
    this.child,
    this.contents = const [],
    this.color = Colors.transparent,
    this.onCellTap,
  }) : assert(child == null && contents.length > 0 ||
            child != null && contents.length == 0);
}

class CustomTableBody extends StatelessWidget {
  final ScrollController scrollController;
  final List<double> widthList;
  final CustomTableRow Function(BuildContext context, int index) rowBuilder;
  final int rowCount;
  final double rowHeight;
  final void Function(int)? onRowPressed;
  final void Function(int)? onRowLongPressed;
  final Future<void> Function()? onRefresh;

  final ValueNotifier<bool> refreshNotifier;

  const CustomTableBody({
    Key? key,
    required this.scrollController,
    required this.widthList,
    required this.rowBuilder,
    required this.rowCount,
    required this.rowHeight,
    required this.refreshNotifier,
    this.onRowPressed,
    this.onRowLongPressed,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: NoGlowBehavior(),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: SizedBox(
              width: widthList.reduce((value, element) => value + element),
              child: RefreshIndicator(
                onRefresh: () async {
                  if (onRefresh != null) {
                    refreshNotifier.value = !refreshNotifier.value;

                    await onRefresh!.call();
                  }
                },
                child: ListView.builder(
                  itemCount: rowCount,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        onRowPressed?.call(index);
                      },
                      onLongPress: () {
                        onRowLongPressed?.call(index);
                      },
                      child: Container(
                        height: rowHeight,
                        decoration: BoxDecoration(
                          color: rowBuilder.call(context, index).color,
                          border: Border(
                            bottom: BorderSide(
                              color: Theme.of(context).dividerColor,
                            ),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: rowBuilder
                                .call(context, index)
                                .contents
                                .isNotEmpty
                            ? Row(
                                children:
                                    widthList.mapIndexed((widthIndex, width) {
                                  return GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: rowBuilder
                                                .call(context, index)
                                                .onCellTap ==
                                            null
                                        ? null
                                        : () => rowBuilder
                                            .call(context, index)
                                            .onCellTap
                                            ?.call(widthIndex),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: LayoutConstant.paddingM,
                                        vertical: LayoutConstant.paddingM,
                                      ),
                                      width: width,
                                      child: rowBuilder
                                          .call(context, index)
                                          .contents[widthIndex],
                                    ),
                                  );
                                }).toList(),
                              )
                            : rowBuilder.call(context, index).child,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
