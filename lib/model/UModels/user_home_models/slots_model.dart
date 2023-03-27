class AvailableSlotsModel {
  List<String>? slots;
  List<Issue>? issue;
  List<String>? bookedSlots;

  AvailableSlotsModel({this.slots, this.issue, this.bookedSlots});

  AvailableSlotsModel.fromJson(Map<String, dynamic> json) {
    slots = json['slots'].cast<String>();
    if (json['issue'] != null) {
      issue = <Issue>[];
      json['issue'].forEach((v) {
        issue!.add(new Issue.fromJson(v));
      });
    }
    bookedSlots = json['booked_slots'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slots'] = this.slots;
    if (this.issue != null) {
      data['issue'] = this.issue!.map((v) => v.toJson()).toList();
    }
    data['booked_slots'] = this.bookedSlots;
    return data;
  }
}

class Issue {
  String? specialitiesId;
  String? name;

  Issue({this.specialitiesId, this.name});

  Issue.fromJson(Map<String, dynamic> json) {
    specialitiesId = json['specialities_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialities_id'] = this.specialitiesId;
    data['name'] = this.name;
    return data;
  }
}
