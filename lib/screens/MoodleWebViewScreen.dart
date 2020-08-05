import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:exam_safe/models/app_state.dart';
import 'package:exam_safe/models/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:loading/indicator/ball_beat_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import 'package:wakelock/wakelock.dart';

// 9d8869f88e624acb92aa179cb4cd8965

class MoodleWebViewScreen extends StatefulWidget {
  const MoodleWebViewScreen({Key key}) : super(key: key);

  @override
  _MoodleWebViewScreenState createState() => _MoodleWebViewScreenState();
}

class _MoodleWebViewScreenState extends State<MoodleWebViewScreen>
    with WidgetsBindingObserver {
  final _flutterWebviewPlugin = FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged> _onStateChanged;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Wakelock.enable();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        this._flutterWebviewPlugin.dispose();
        Navigator.pop(context);
        AgoraRtcEngine.leaveChannel();
        Wakelock.disable();
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> _initAgoraRtcEngine(
      String agoraAppID, String videoCallChannelName) async {
    AgoraRtcEngine.create(agoraAppID);

    AgoraRtcEngine.enableVideo();
    AgoraRtcEngine.enableAudio();
    // AgoraRtcEngine.setParameters(
    //     '{\"che.video.lowBitRateStreamParameter\":{\"width\":120,\"height\":120,\"frameRate\":15,\"bitRate\":50}}');
    AgoraRtcEngine.setChannelProfile(ChannelProfile.Communication);
    AgoraRtcEngine.setEncryptionMode('aes-128-xts');
    VideoEncoderConfiguration config = VideoEncoderConfiguration();
    config.orientationMode = VideoOutputOrientationMode.FixedPortrait;
    config.dimensions = Size(100, 100);
    config.frameRate = 10;
    config.bitrate = 20;
    AgoraRtcEngine.setVideoEncoderConfiguration(config);
    AgoraRtcEngine.joinChannel(null, videoCallChannelName, 'student', 0);
    AgoraRtcEngine.muteAllRemoteVideoStreams(true);
    AgoraRtcEngine.muteAllRemoteAudioStreams(true);
  }

  @override
  Widget build(BuildContext context) {
    final _loginState = Provider.of<LoginState>(context, listen: false);
    final _appState = Provider.of<AppState>(context, listen: false);
    _initAgoraRtcEngine(_appState.agoraAppID, _appState.videoCallChannelName);
    String _jsCode = """
      document.querySelector('#username').value = '${_loginState.email}';
      document.querySelector('#password').value = '${_loginState.password}';
      document.querySelector('#loginbtn').click();
    """;
    print('webview');

    this._onStateChanged = this
        ._flutterWebviewPlugin
        .onStateChanged
        .listen((WebViewStateChanged state) {
      if (mounted) {
        if (state.type == WebViewState.finishLoad) {
          // print(_jsCode);
          this._flutterWebviewPlugin.evalJavascript(_jsCode);
        } else if (state.type == WebViewState.abortLoad) {
          // if there is a problem with loading the url
          print("there is a problem...");
        } else if (state.type == WebViewState.startLoad) {
          // if the url started loading
          print("start loading...");
        }
      }
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          child: Container(
            color: Colors.black87,
          ),
          preferredSize: Size(0.0, 0.0),
        ),
        body: WebviewScaffold(
          url: '${_appState.moodleLink}',
          withJavascript: true,
          hidden: true,
          initialChild: Container(
            child: Center(
              child: Loading(
                  indicator: BallBeatIndicator(),
                  size: 100.0,
                  color: Colors.pink),
            ),
          ),
          clearCache: true,
          clearCookies: true,
        ),
      ),
    );
  }
}
