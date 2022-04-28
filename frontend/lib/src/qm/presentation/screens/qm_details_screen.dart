import 'package:flutter/material.dart';
import 'package:frontend/src/core/constants/layout_constant.dart';
import 'package:frontend/src/qm/presentation/fakes/fake_data.dart';
import 'package:frontend/src/qm/presentation/fakes/qm_product.dart';

class QmProductDetailsScreen extends StatefulWidget {
  const QmProductDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<QmProductDetailsScreen> createState() => _QmProductDetailsScreenState();
}

class _QmProductDetailsScreenState extends State<QmProductDetailsScreen> {
  late QmProduct product;

  @override
  void initState() {
    super.initState();
    product = fakeQmProducts.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.productName),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(LayoutConstant.paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Table(
                          border: TableBorder.all(),
                          children: [
                            TableRow(
                              children: [
                                const Text("현공정"),
                                Text(product.currentProcess),
                              ],
                            ),
                            TableRow(
                              children: [
                                const Text("진행상태"),
                                Text(product.progress),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: LayoutConstant.spaceL),
                      Expanded(
                        child: Table(
                          border: TableBorder.all(),
                          children: [
                            const TableRow(children: [Text("PND")]),
                            TableRow(children: [Text("${DateTime.now()}")]),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: LayoutConstant.spaceL),
                  Table(
                    border: TableBorder.all(),
                    children: [
                      TableRow(
                        children: [
                          const Text("Yard"),
                          Text(product.yard),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text("Hull No."),
                          Text(product.hullNo),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text("Sys No."),
                          Text(product.sysNo),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text("WorkOrder"),
                          Text(product.orderNo),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text("규격"),
                          Text(product.standard),
                        ],
                      ),
                      TableRow(
                        children: [
                          const Text("Type"),
                          Text(product.type),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(LayoutConstant.paddingL),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: QmButton(
                      onTap: () {},
                      text: 'Fan Performance',
                    ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceL),
                  Expanded(
                    child: QmButton(
                      onTap: () {},
                      text: 'Paint Spec.\nD.F.T',
                    ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceL),
                  Expanded(
                    child: QmButton(
                      onTap: () {},
                      text: 'Motor Info.(Check)',
                    ),
                  ),
                  const SizedBox(height: LayoutConstant.spaceL),
                  Expanded(
                    child: QmButton(
                      onTap: () {},
                      text: 'Etc. Photo',
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

class QmButton extends StatelessWidget {
  const QmButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(LayoutConstant.radiusM),
          color: Colors.indigo,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
