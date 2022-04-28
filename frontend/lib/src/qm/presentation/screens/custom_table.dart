import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/core/widgets/index.dart';
import 'package:frontend/src/core/widgets/linked_scroll_controller.dart';

/// reference: https://github.com/crizant/flutter_multiplication_table/tree/master/lib

class CustomTable extends StatefulWidget {
  const CustomTable({
    Key? key,
    required this.headers,
    this.columnSpace = 40,
    required this.rowBuilder,
    required this.rowCount,
    this.rowHeight = 50,
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

  final widthList = <double>[];

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _headController = _controllers.addAndGet();
    _bodyController = _controllers.addAndGet();
    // long click 때 check box 보여줄 때 사용하기 위해서 삽입
    widthList.addAll(widget.headers
        .map((header) =>
            header.width ?? header.title.length * widget.columnSpace)
        .toList());
  }

  @override
  void dispose() {
    _headController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
      height: height,
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: headers.mapIndexed((index, header) {
            return Container(
              width: widthList[index],
              alignment:
                  header.isNumeric ? Alignment.centerRight : header.alignment,
              child: Text(
                header.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomTableHeader {
  final String title;
  final double? width;
  final bool isNumeric;
  final AlignmentGeometry alignment;

  const CustomTableHeader({
    required this.title,
    this.width,
    this.isNumeric = false,
    this.alignment = Alignment.center,
  });
}

class CustomTableRow {
  /// list 형태로 늘어놓을 수 없는 아이템에 사용
  final Widget? child;
  final List<Widget> contents;
  final Color color;

  const CustomTableRow({
    this.child,
    this.contents = const [],
    this.color = Colors.transparent,
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

  const CustomTableBody({
    Key? key,
    required this.scrollController,
    required this.widthList,
    required this.rowBuilder,
    required this.rowCount,
    required this.rowHeight,
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
                onRefresh: onRefresh ?? () async {},
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
                                  return Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: LayoutConstant.paddingM,
                                      vertical: LayoutConstant.paddingM,
                                    ),
                                    width: width,
                                    child: rowBuilder
                                        .call(context, index)
                                        .contents[widthIndex],
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
