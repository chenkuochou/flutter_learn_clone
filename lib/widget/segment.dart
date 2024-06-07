import 'package:flutter/material.dart';
import 'package:flutter_learn_clone/provider/segment_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Segment extends ConsumerWidget {
  const Segment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
     int currentSegment = ref.watch(segmentNotifierProvider);

    Widget myButton(
      int index,
    ) {
      List<String> segments = ['Beginner', 'Intermediate', 'Advanced'];
      String text = segments[index];
      bool isSelected = index == currentSegment;

      return Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: switch (text) {
              'Beginner' =>
                const BorderRadius.horizontal(left: Radius.circular(30)),
              'Advanced' =>
                const BorderRadius.horizontal(right: Radius.circular(30)),
              _ => null,
            }),
        child: FilledButton(
          onPressed: () =>
              ref.read(segmentNotifierProvider.notifier).updateSegment(index),
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
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        myButton(0),
        myButton(1),
        myButton(2),
      ],
    );
  }

}