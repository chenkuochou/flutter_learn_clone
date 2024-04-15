import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learn_clone/data/segment.dart';
import 'package:flutter_learn_clone/provider/segment_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget myButton({
      required VoidCallback onPressed,
      required String text,
      required int flag,
      required isSelected,
    }) =>
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: switch (flag) {
                0 => const BorderRadius.horizontal(left: Radius.circular(30)),
                2 => const BorderRadius.horizontal(right: Radius.circular(30)),
                _ => null,
              }),
          child: FilledButton(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return isSelected
                      ? const Color(0xff0468d7)
                      : Colors.grey.shade300;
                }
                return isSelected
                    ? const Color(0xff0468d7)
                    : Colors.grey.shade100;
              }),
              foregroundColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return isSelected ? Colors.white : Colors.black;
                }
                return isSelected ? Colors.white : const Color(0xff0468d7);
              }),
            ),
            child: Text(text),
          ),
        );

    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        //* Title
        //* Tab
        SegmentedButton(
          style: SegmentedButton.styleFrom(
            shape: const StadiumBorder(),
            side: const BorderSide(width: 0, color: Colors.transparent),
            selectedForegroundColor: Colors.white,
            selectedBackgroundColor: const Color(0xff0468d7),
          ),
          segments: const [
            ButtonSegment(value: Segment.beginner, label: Text('Beginner')),
            ButtonSegment(
                value: Segment.intermediate, label: Text('Intermediate')),
            ButtonSegment(value: Segment.advanced, label: Text('Advanced')),
          ],
          selected: {ref.watch(segmentNotifierProvider)},
          onSelectionChanged: (Set<Segment> newSelection) {
            ref
                .read(segmentNotifierProvider.notifier)
                .updateSegment(newSelection.first);
          },
          showSelectedIcon: false,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myButton(
                onPressed: () {}, text: 'Beginner', flag: 0, isSelected: true),
            myButton(
                onPressed: () {},
                text: 'Intermediate',
                flag: 1,
                isSelected: false),
            myButton(
                onPressed: () {}, text: 'Advanced', flag: 2, isSelected: false),
          ],
        )
        //* Footer
      ],
    );
  }
}
