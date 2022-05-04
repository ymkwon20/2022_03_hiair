import 'package:flutter/material.dart';
import 'package:frontend/src/core/presentation/widgets/index.dart';
import 'package:frontend/src/cutting/application/serial/cutting_serial_event.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:frontend/src/core/presentation/index.dart';

import 'package:frontend/src/cutting/dependency_injection.dart';
import 'package:frontend/src/cutting/domain/entities/cutting_serial.dart';

class AlterCuttingSerialsPage extends ConsumerStatefulWidget {
  const AlterCuttingSerialsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AlterCuttingSerialsPageState();
}

class _AlterCuttingSerialsPageState
    extends ConsumerState<AlterCuttingSerialsPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () {
        ref
            .read(cuttingSerialsStateNotifierProvider.notifier)
            .mapEventToState(const CuttingSerialEvent.getSerials());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(cuttingSerialsStateNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: state.when(
        initial: () => const InitialStateWidget(),
        loading: () => const LoadingStateWidget(),
        loaded: (List<CuttingSerial> serials) =>
            AlterSerialsCardView(items: serials),
        failure: (String message) => FailureStateWidget(message: message),
      ),
    );
  }
}

class AlterSerialsCardView extends StatefulWidget {
  const AlterSerialsCardView({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<CuttingSerial> items;

  @override
  State<AlterSerialsCardView> createState() => _AlterSerialsCardViewState();
}

class _AlterSerialsCardViewState extends State<AlterSerialsCardView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SerialCardWidget(
        serial: widget.items[0],
      ),
    );
  }
}

class SerialCardWidget extends StatefulWidget {
  const SerialCardWidget({
    Key? key,
    required this.serial,
  }) : super(key: key);

  final CuttingSerial serial;

  @override
  State<SerialCardWidget> createState() => _SerialCardWidgetState();
}

class _SerialCardWidgetState extends State<SerialCardWidget> {
  double width = 200;
  double height = 250;

  bool isDown = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor,
            blurRadius: 0,
            offset: const Offset(6, 6),
          ),
          BoxShadow(
            color: Theme.of(context).shadowColor.withOpacity(.8),
            spreadRadius: 1,
          ),
        ],
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(LayoutConstant.paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.serial.dateRequested,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: LayoutConstant.spaceM),
            child: UnderlineWidget(
              thickness: LayoutConstant.spaceS,
              color: widget.serial.urgencyStatus == "긴급"
                  ? ThemeConstant.dominantColor
                  : Theme.of(context).shadowColor,
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceM),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              widget.serial.urgencyStatus,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: widget.serial.urgencyStatus == "긴급"
                    ? ThemeConstant.dominantColor
                    : Theme.of(context).shadowColor,
              ),
            ),
          ),
          const SizedBox(height: LayoutConstant.spaceS),
        ],
      ),
    );
  }
}
