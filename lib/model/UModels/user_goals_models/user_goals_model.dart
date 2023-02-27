class UserGoalsModel {
  String? name;
  String? icon;
  String? goalType;
  String? goal;
  String? days;
  String? reminder;
  String? activityId;
  String? reminderTime;

  UserGoalsModel(
      {this.name,
      this.icon,
      this.goalType,
      this.goal,
      this.activityId,
      this.days,
      this.reminder,
      this.reminderTime});

  UserGoalsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    activityId = json['activity_id'];
    goalType = json['goal_type'];
    goal = json['goal'];
    days = json['days'];
    reminder = json['reminder'];
    reminderTime = json['reminder_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['icon'] = this.icon;
    data['activity_id'] = this.activityId;
    data['goal_type'] = this.goalType;
    data['goal'] = this.goal;
    data['days'] = this.days;
    data['reminder'] = this.reminder;
    data['reminder_time'] = this.reminderTime;
    return data;
  }
}
