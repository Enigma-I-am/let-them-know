import 'package:cloud_firestore/cloud_firestore.dart';

class NegativeBills {
  String title;
  String desc;
  String changeUrl;
  String category;
  String details;
  bool isPassed;
  final DocumentReference reference;

  NegativeBills({
    this.title,
    this.desc,
    this.changeUrl,
    this.category,
    this.details,
    this.isPassed,
    this.reference,
  });

  NegativeBills.fromJson(
    Map<String, dynamic> json, {
    this.reference,
  }) {
    title = json['title'];
    desc = json['desc'];
    title = json['title'];
    changeUrl = json['changeUrl'];
    category = json['category'];
    details = json['details'];
    isPassed = json['isPassed'];
  }

  NegativeBills.fromMap(
    Map<dynamic, dynamic> map, {
    this.reference,
  }) {
    title = map['title'];
    desc = map['desc'];
    changeUrl = map['changeUrl'];
    category = map['category'];
    details = map['details'];
    isPassed = map['isPassed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> senatorData = new Map<String, dynamic>();
    senatorData['title'] = this.title;
    senatorData['desc'] = this.desc;
    senatorData['changeUrl'] = this.changeUrl;
    senatorData['category'] = this.category;
    senatorData['details'] = this.details;
    senatorData['isPassed'] = this.isPassed;
    return senatorData;
  }

  NegativeBills.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);
}
