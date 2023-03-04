import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}

class Keys {
  final String goalReminderTime = 'goal_reminder_time';
  final String cookie = 'cookies';
  final String email = 'email';
  final String password = 'password';
  final String userName = 'user_name';
  final String userImage = 'user_Image';
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
  final String requestSent = 'request_sent';
  final String DocSignUpEmail = 'doc_sign_up_email';
}
