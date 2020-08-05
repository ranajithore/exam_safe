import 'dart:collection';

import 'package:exam_safe/models/database.dart';
import 'package:flutter/foundation.dart';

class AppState extends ChangeNotifier {
  Database _database = Database();
  String _moodleLink;
  String _agoraAppID;
  String _videoCallChannelName;
  LinkedHashMap<dynamic, dynamic> _userDetails;

  String get moodleLink => this._moodleLink;
  String get agoraAppID => this._agoraAppID;
  String get videoCallChannelName => this._videoCallChannelName;
  LinkedHashMap<dynamic, dynamic> get userDetails => this._userDetails;


  Future fetchAllData(String email) async {
    this._moodleLink = await  this._database.fetchMoodleLink();
    this._agoraAppID = await this._database.fetchAgoraAppID();
    this._userDetails = await this._database.fetchUserDetails(email);
    this._videoCallChannelName = '${this._userDetails['degree']}_${this._userDetails['department']}_sem_${this._userDetails['semester']}';
  }
}