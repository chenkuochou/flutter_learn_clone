import 'package:flutter_riverpod/flutter_riverpod.dart';

final segmentNotifierProvider =
    NotifierProvider<SegmentNotifier, int>(SegmentNotifier.new);

class SegmentNotifier extends Notifier<int> {
  @override
  build() => 0;

  void updateSegment(int index) => state = index;
}
