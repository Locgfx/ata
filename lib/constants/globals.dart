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

class Keys {
  final String isUser = 'is_user';
  final String firstRun = 'first_run';
  final String questionsDone = 'questions_done';
  final String loginDone = 'login_done';
  final String identity = 'identity';
  final String physicalHealth = 'physical_health';
  final String mentalHealth = 'mental_health';
  final String mentalHealthPeace = 'mental_health_peace';
  final String lowTime = 'low_time';
  final String emotionDay = 'emotion_day';
  final String isHappy = 'is_happy';
  final String mentalDiagnosis = 'mental_diagnosis';
  final String lineageProblem = 'lineage_problem';
}
