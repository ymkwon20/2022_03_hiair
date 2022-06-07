import 'package:frontend/src/cutting/domain/entities/cutting_check.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

late StateNotifierProvider<CuttingChecks, List<CuttingCheck>>
    cuttingChecksProvider;

class CuttingChecks extends StateNotifier<List<CuttingCheck>> {
  CuttingChecks(List<CuttingCheck> checks) : super(checks);
}
