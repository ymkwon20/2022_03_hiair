import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BadControlWidget extends ConsumerStatefulWidget {
  const BadControlWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BadControlWidgetState();
}

class _BadControlWidgetState extends ConsumerState<BadControlWidget> {
  late ScrollController _scrollController;
  TextEditingController yardController = TextEditingController();
  TextEditingController hullNoController = TextEditingController();
  TextEditingController sysNoController = TextEditingController();
  TextEditingController itemNoController = TextEditingController();
  TextEditingController rmkController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "업체별 불량 관리",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Yard : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: yardController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Yard',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Hull No : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: hullNoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hull No',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: <Widget>[
                  const Text(
                    'Sys No : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: sysNoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Sys No',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: <Widget>[
                  const Text(
                    '품번 : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: itemNoController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Item No',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: LayoutConstant.spaceXS,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Text(
                          '업체명',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: LayoutConstant.spaceXS,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Text(
                          '불량 코드',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: <Widget>[
                  const Text(
                    '비고 : ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Flexible(
                    child: TextField(
                      controller: rmkController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'rmk',
                      ),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: LayoutConstant.paddingL,
              vertical: LayoutConstant.paddingM,
            ),
            padding: const EdgeInsets.all(LayoutConstant.paddingM),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
              color: Theme.of(context).cardColor,
              border: Border.all(
                color: Theme.of(context).dividerColor,
                width: LayoutConstant.spaceXS,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: LayoutConstant.paddingM),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        const Text(
                          '사진',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
