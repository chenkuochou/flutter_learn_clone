import 'package:flutter/material.dart';
import 'package:flutter_learn_clone/widget/lesson.dart';
import 'package:flutter_learn_clone/widget/segment.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      children: [
        //* Title
        //* Tab
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
          child: Segment(),
        ),
        //* Lessons
        Lesson(),
        //* Footer
      ],
    );
  }
}
