import 'package:ecuaventure/src/theme/main_theme.dart';
import 'package:flutter/material.dart';

class BuggyPriorityWidget extends StatelessWidget {
  const BuggyPriorityWidget({Key? key, required this.priority})
      : super(key: key);
  final int? priority;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 20.0,
        backgroundColor: priority == 1
            ? AppTheme.colorHighPriority
            : priority == 2
                ? AppTheme.colorMediumPriority
                : AppTheme.colorLowPriority,
        child: Icon(Icons.event_available_outlined,
            color: priority == 2 ? Colors.black : Colors.white));
  }
}
