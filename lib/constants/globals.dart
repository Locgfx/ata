import 'package:flutter/material.dart';

import '../widgets/popupdialogs.dart';

class Globals {
  showTimepicker(BuildContext context) {
    showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
      builder: (BuildContext context, child) {
        return TimeWidget(child: child);
      },
    );
  }
}
