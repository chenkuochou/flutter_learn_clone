import 'package:flutter_learn_clone/data/segment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final segmentNotifierProvider =
    NotifierProvider<SegmentNotifier, Segment>(SegmentNotifier.new);

class SegmentNotifier extends Notifier<Segment> {
  @override
  build() => Segment.beginner;

  void updateSegment(Segment segment) => state = segment;
}
