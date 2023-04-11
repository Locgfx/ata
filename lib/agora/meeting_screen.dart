import 'dart:async';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:greymatter/agora/chat_config.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:permission_handler/permission_handler.dart';

import '../widgets/app_bar/app_bar.dart';

/*const appId = "<-- Insert App Id -->";
const token = "<-- Insert Token -->";
const channel = "<-- Insert Channel Name -->";*/

class MeetingScreen extends StatefulWidget {
  const MeetingScreen({Key? key}) : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  int? _remoteUid = 0;
  bool _localUserJoined = false;
  late RtcEngine _engine;
  int uid = 0;

  bool _isJoined = false;
  @override
  void initState() {
    //initAgora();
    initAgr();
    super.initState();
  }

  bool _isLoading = false;
 /* Future<void> initAgora() async {
    _isLoading = true;
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: AgoraChatConfig.appKey,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    _engine.registerEventHandler(
      RtcEngineEventHandler(
          onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
            debugPrint("local user ${connection.localUid} joined");
            setState(() {
              _localUserJoined = true;
            });
          },
          onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
            debugPrint("remote user $remoteUid joined");
            setState(() {
              _remoteUid = remoteUid;
            });
          },
          onUserOffline: (RtcConnection connection, int remoteUid,
              UserOfflineReasonType reason) {
            debugPrint("remote user $remoteUid left channel");
            setState(() {
              _remoteUid = null;
            });
          },
          onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
            debugPrint(
                '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
          },
          onLeaveChannel: (RtcConnection connection, RtcStats stats) {}),
    );

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await _engine.joinChannel(
      token: AgoraChatConfig.agoraToken,
      channelId: AgoraChatConfig.userId,
      uid: uid,
      options: options,
    );
    setState(() {
      _isLoading = false;
    });
  }*/

  @override
  void dispose() {
    _engine.leaveChannel();
    _engine.release();
    super.dispose();
  }

  static int _uId = 0;
  void initAgr() async {
    _isLoading = true;

       await _client.initialize().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }


  final AgoraClient _client = AgoraClient(
      enabledPermission: [
        Permission.camera,
        Permission.microphone,
      ],
      agoraConnectionData: AgoraConnectionData(
          appId: AgoraChatConfig.appKey,
          channelName: AgoraChatConfig.userId,
          tempToken: AgoraChatConfig.agoraToken,
      ),
  );

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        onThreeDotTap: () {},
        appBarText: 'Session',
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : Stack(
              children: [
                AgoraVideoViewer(client: _client!, showAVState: true),
                AgoraVideoButtons(client: _client!, autoHideButtons: true,),
              ]
              /*[
          _isLoading
              ? Center(
                  child: LoadingWidget(),
                )
              : Center(
                  child: _remoteVideo(),
                ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: VideoCanvas(uid: uid),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ]*/
              ,
            ),
    );
    /*MaterialApp(
      //scaffoldMessengerKey: scaffoldMessengerKey,
      home:

      Scaffold(
          appBar: AppBar(
            title: const Text('Get started with Video Calling'),
          ),
          body: _isLoading
              ? Center(
                  child: LoadingWidget(),
                )
              : ListView(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  children: [
                    // Container for the local video
                    Container(
                      height: 240,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(child: _localPreview()),
                    ),
                    const SizedBox(height: 10),
                    //Container for the Remote video
                    Container(
                      height: 240,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Center(child: _remoteVideo()),
                    ),
                    // Button Row
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isJoined ? null : () => {join()},
                            child: const Text("Join"),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: _isJoined ? () => {leave()} : null,
                            child: const Text("Leave"),
                          ),
                        ),
                      ],
                    ),
                    // Button Row ends
                  ],
                )),
    );*/

    /*Scaffold(
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        onThreeDotTap: () {},
        appBarText: 'Connecting',
        imgPath: "assets/images/iconbackappbarlarge.png",
      ),
      body: Stack(
        children: [
          _isLoading
              ? Center(
                  child: LoadingWidget(),
                )
              : Center(
                  child: _remoteVideo(),
                ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 100,
              height: 150,
              child: Center(
                child: _localUserJoined
                    ? AgoraVideoView(
                        controller: VideoViewController(
                          rtcEngine: _engine,
                          canvas: VideoCanvas(uid: uid),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
    );*/
  }

  Widget _localPreview() {
    if (_isJoined) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: 0),
        ),
      );
    } else {
      return const Text(
        'Join a channel',
        textAlign: TextAlign.center,
      );
    }
  }

// Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: AgoraChatConfig.userId),
        ),
      );
    } else {
      String msg = '';
      if (_isJoined) msg = 'Waiting for a remote user to join';
      return Text(
        msg,
        textAlign: TextAlign.center,
      );
    }
  }

  void join() async {
    await _engine.startPreview();
    // Set channel options including the client role and channel profile

    ChannelMediaOptions options = const ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await _engine
        .joinChannel(
      token: AgoraChatConfig.agoraToken,
      channelId: AgoraChatConfig.userId,
      options: options,
      uid: uid,
    )
        .then((value) {
      log("message");
    });
  }

  void leave() {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    _engine.leaveChannel();
  }
  // Display remote user's video
  /* Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: AgoraChatConfig.userId),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }*/
}
