import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/src/core/presentation/index.dart';
import 'package:frontend/src/core/presentation/widgets/flash_bar.dart';
import 'package:frontend/src/core/presentation/widgets/image_dialog.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/cutting/application/check/save/cutting_check_save_state.dart';
import 'package:frontend/src/cutting/presentation/request/cutting_check_list_widget.dart';
import 'package:frontend/src/cutting/presentation/serial/cutting_serials_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:frontend/src/cutting/dependency_injection.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_check_detail.dart';

class CuttingRequestPage extends ConsumerWidget {
  const CuttingRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cuttingRequestsStateNotifierProvider);

    ref.listen<CuttingCheckSaveState>(
      cuttingCheckSaveStateNotifierProvider,
      (previous, current) {
        current.maybeWhen(
          saved: () {
            showFlashBar(
              context,
              title: "저장 완료",
              content: "",
              backgroundColor: Theme.of(context).primaryColorLight,
            );
          },
          failure: (message) {
            showFlashBar(
              context,
              title: "저장 실패",
              content: message,
              backgroundColor: ThemeConstant.errorColor,
            );
          },
          orElse: () {},
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: state.when(
        initial: () => const InitialStateWidget(),
        loading: () => const LoadingStateWidget(),
        loaded: (checks) => CuttingRequestListView(items: checks),
        failure: (String message) => FailureStateWidget(message: message),
      ),
    );
  }
}

class CuttingRequestListView extends ConsumerStatefulWidget {
  const CuttingRequestListView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CuttingCheckDetail> items;

  @override
  ConsumerState<CuttingRequestListView> createState() =>
      _CuttingRequestListViewState();
}

class _CuttingRequestListViewState
    extends ConsumerState<CuttingRequestListView> {
  Uint8List? _cachedBytes;
  late NetworkAssetBundle _assetBundle;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      _assetBundle = NetworkAssetBundle(Uri.parse(
          "${LogicConstant.baseImageServerUrl}/${ref.watch(cuttingSerialProvider).imageFileName}"));
      final imageData = await _assetBundle.load("");
      setState(() {
        _cachedBytes = imageData.buffer.asUint8List();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: LayoutConstant.spaceL),
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                showCheckboxColumn: false,
                columns: const [
                  DataColumn(label: Text('원재료 품명')),
                  DataColumn(label: Text('원재료 규격')),
                  DataColumn(label: Text('수량')),
                  DataColumn(label: Text('CAM No.')),
                  DataColumn(label: Text('Comment')),
                  DataColumn(label: Text('Remark')),
                ],
                rows: List.generate(
                  widget.items.length,
                  (index) => DataRow(
                    onSelectChanged: (bool? _) {},
                    onLongPress: () {},
                    cells: [
                      DataCell(Text(widget.items[index].metalCd)),
                      DataCell(Text(
                          "${widget.items[index].thickness}*${widget.items[index].width}*${widget.items[index].length}")),
                      DataCell(Text("${widget.items[index].qty}")),
                      DataCell(Text(widget.items[index].camNo)),
                      const DataCell(
                        TextField(
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                      const DataCell(
                        TextField(
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceL),
          _cachedBytes == null
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return ImageDialog(
                        bytes: _cachedBytes!,
                      );
                    }));
                  },
                  child: Image.memory(
                    _cachedBytes!,
                    fit: BoxFit.contain,
                  ),
                ),
          const CuttingCheckListWidget(),
        ],
      ),
    );
  }
}
