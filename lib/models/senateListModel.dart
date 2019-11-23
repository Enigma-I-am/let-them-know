class SenateListModel {
  List<SenatorData> senatorData;

  SenateListModel({this.senatorData});

  SenateListModel.fromJson(Map<String, dynamic> json) {
    if (json['senatorData'] != null) {
      senatorData = new List<SenatorData>();
      json['senatorData'].forEach((v) {
        senatorData.add(new SenatorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> senatorData = new Map<String, dynamic>();
    if (this.senatorData != null) {
      senatorData['senatorData'] = this.senatorData.map((v) => v.toJson()).toList();
    }
    return senatorData;
  }
}

class SenatorData {
  String state;
  String name;
  String phoneNo;
  String email;

  SenatorData({this.state, this.name, this.phoneNo, this.email});

  SenatorData.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    name = json['name'];
    phoneNo = json['phoneNo'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> senatorData = new Map<String, dynamic>();
    senatorData['state'] = this.state;
    senatorData['name'] = this.name;
    senatorData['phoneNo'] = this.phoneNo;
    senatorData['email'] = this.email;
    return senatorData;
  }
}