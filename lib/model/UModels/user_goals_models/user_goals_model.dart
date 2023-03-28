class UserGoalsModel {
  String? name;
  String? icon;
  String? goalType;
  String? goal;
  String? goalId;
  String? days;
  String? reminder;
  String? activityId;
  String? activityName;
  String? reminderTime;
  int? completedGoal;

  UserGoalsModel(
      {this.name,
      this.icon,
      this.goalType,
      this.goal,
      this.goalId,
      this.activityId,
      this.days,
      this.reminder,
      this.activityName,
      this.completedGoal,
      this.reminderTime});

  UserGoalsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    activityId = json['activity_id'];
    goalType = json['goal_type'];
    goal = json['goal'];
    goalId = json['goal_id'];
    completedGoal = json['completed_goal'];
    days = json['days'];
    activityName = json['activity_name'];
    reminder = json['reminder'];
    reminderTime = json['reminder_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['activity_id'] = this.activityId;
    data['completed_goal'] = this.completedGoal;
    data['goal_type'] = this.goalType;
    data['goal_id'] = this.goalId;
    data['activity_name'] = this.activityName;
    data['goal'] = this.goal;
    data['days'] = this.days;
    data['reminder'] = this.reminder;
    data['reminder_time'] = this.reminderTime;
    return data;
  }
}
