
import 'dart:collection';

import 'package:firebase_database/firebase_database.dart';

class Database {
  final DatabaseReference dbRef = FirebaseDatabase.instance.reference();

  Future<String> fetchAgoraAppID() async {
    String agoraAppID;
     await dbRef.child('/agoraAppID/').once().then((DataSnapshot dataSnapshot) {
      agoraAppID = dataSnapshot.value;
    });
    return agoraAppID;
  }

  Future<String> fetchMoodleLink() async {
    String moodleLink;
     await dbRef.child('/moodleLink/').once().then((DataSnapshot dataSnapshot) {
      moodleLink = dataSnapshot.value;
    });
    return moodleLink;
  }

  Future<LinkedHashMap<dynamic, dynamic>> fetchUserDetails(String email) async {
    LinkedHashMap<dynamic, dynamic> userDetails;
     await dbRef.child('/users/${email.replaceAll(RegExp(r'\.') ,'__dot__')}/').once().
     then((DataSnapshot dataSnapshot) {
      userDetails = LinkedHashMap<dynamic, dynamic>.from(dataSnapshot.value);
    });
    return userDetails;
  }

}