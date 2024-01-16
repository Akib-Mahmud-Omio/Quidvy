import 'package:cloud_firestore/cloud_firestore.dart';

class AddData {
  String name;
  String explain;
  String amount;
  String IN;
  DateTime datetime;
  String userEmail;
  String type;

  AddData(this.IN, this.amount, this.datetime, this.explain, this.name, this.userEmail, this.type);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'explain': explain,
      'amount': amount,
      'IN': IN,
      'datetime': Timestamp.fromDate(datetime),
      'userEmail': userEmail,
      'type': type,
    };
  }

  factory AddData.fromJson(Map<String, dynamic> json) {
    return AddData(
      json['IN'] as String,
      json['amount'] as String,
      (json['datetime'] as Timestamp).toDate(),
      json['explain'] as String,
      json['name'] as String,
      json['userEmail'] as String,
      json['type'] as String,
    );
  }
}
