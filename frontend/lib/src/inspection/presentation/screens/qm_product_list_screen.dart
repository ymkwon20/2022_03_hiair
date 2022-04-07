import 'package:flutter/material.dart';
import 'package:frontend/src/core/widgets/responsive_widget.dart';
import 'package:frontend/src/inspection/presentation/fakes/fake_data.dart';
import 'package:go_router/go_router.dart';

/// 검사 1화면: QM 검사 항목 리스트 제시
class QmProductListScreen extends StatelessWidget {
  const QmProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const ResponsiveWidget(
        mobile: QmProductList(),
        tablet: QmProductList(),
        desktop: QmProductList(),
      ),
    );
  }
}

class QmProductList extends StatelessWidget {
  const QmProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('프로젝트\n번호')),
        DataColumn(label: Text('작업 지시\n번호')),
        DataColumn(label: Text('Hull No')),
        DataColumn(label: Text('품번')),
        DataColumn(label: Text('품명')),
        DataColumn(label: Text('Sys\nNo')),
        DataColumn(label: Text('규격')),
        DataColumn(label: Text('수량')),
        DataColumn(label: Text('사이즈')),
        DataColumn(label: Text('방폭여부')),
      ],
      rows: List.generate(
        fakeQmProducts.length,
        (index) => DataRow(
          onSelectChanged: (bool? selected) {
            //// 원본
            // context.pushNamed('qm2', params: {
            //   'id': fakeQmProducts[index].projectNo,
            // });
            context.pushNamed('qm2-2', params: {
              'id': fakeQmProducts[index].projectNo,
            });
          },
          onLongPress: () {
            //// 원본
            // context.pushNamed('qm2', params: {
            //   'id': fakeQmProducts[index].projectNo,
            // });
            context.pushNamed('qm2-2', params: {
              'id': fakeQmProducts[index].projectNo,
            });
          },
          cells: [
            DataCell(Text(fakeQmProducts[index].projectNo)),
            DataCell(Text(fakeQmProducts[index].orderNo)),
            DataCell(Text(fakeQmProducts[index].hullNo)),
            DataCell(Text(fakeQmProducts[index].productNo)),
            DataCell(Text(fakeQmProducts[index].productName)),
            DataCell(Text(fakeQmProducts[index].sysNo)),
            DataCell(Text(fakeQmProducts[index].standard)),
            DataCell(Text("${fakeQmProducts[index].qty}")),
            DataCell(Text(fakeQmProducts[index].size)),
            DataCell(Text(fakeQmProducts[index].explosionProof)),
          ],
        ),
      ),
    );
  }
}
