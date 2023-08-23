// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class Notifications {
  final String senderId;
  final String receiverId;
  final Timestamp timeStamp;
  final String message;

  Notifications({
    required this.senderId,
    required this.receiverId,
    required this.timeStamp,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'senderId': senderId,
      'receiverId': receiverId,
      'timeStamp': timeStamp,
      'message': message,
    };
  }

  factory Notifications.fromMap(Map<String, dynamic> map) {
    return Notifications(
      senderId: map['senderId'] as String,
      receiverId: map['receiverId'] as String,
      timeStamp: map['timeStamp'] as Timestamp,
      message: map['message'] as String,
    );
  }
}
