import 'dart:convert';
import 'dart:developer';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:greymatter/Apis/meeting_api/change_booking_status_api.dart';
import 'package:greymatter/Apis/meeting_api/get_token_api.dart';
import 'package:greymatter/constants/globals.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../AllScreens/PsychologistPanel/Screens/Home/PSuccessfulSessionScreen.dart';
import '../AllScreens/UserPanel/UScreens/UBookingScreens/USessionSucessfulScreen.dart';
import '../Apis/DoctorApis/availability_api.dart';
import '../widgets/app_bar/app_bar.dart';
import 'chat_config.dart';

/*const appId = "<-- Insert App Id -->";
const token = "<-- Insert Token -->";
const channel = "<-- Insert Channel Name -->";*/

class MeetingScreen extends StatefulWidget {
  final String bookingId;
  final UPsychologistModel? model;
  final String date;
  final String issue;
  const MeetingScreen(
      {Key? key,
      required this.bookingId,
      required this.model,
      required this.date,
      required this.issue})
      : super(key: key);

  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  String channelName = "";
  String rtcToken = "";

  int uid = 0; // uid of the local user

  int? _remoteUid; // uid of the remote user
  bool _isJoined = false; // Indicates if the local user has joined the channel
  late RtcEngine agoraEngine; // Agora engine instance

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>(); // Global key to access the scaffold

  showMessage(String message) {
    scaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  bool _isUser = false;
  int role = 1;
  _getPrefs() async {
    var prefs = await SharedPreferences.getInstance();
    _isUser = prefs.getBool(Keys().isUser) ?? false;
    if (_isUser) {
      role = 1;
    } else {
      role = 2;
    }
    // log("is user $_isUser");
  }

  bool _isLoading = false;
  _getMeetingToken() {
    //log(widget.bookingId.toString());
    _isLoading = true;
    final resp = GetMeetingTokenApi()
        .get(bookingId: widget.bookingId, role: role.toString());
    resp.then((value) {
      // log(value.toString());
      if (value['status'] == true) {
        rtcToken = value['agora_token'];
        channelName = value['channel_name'];
        uid = int.parse(value['uid']);
        //uid = 0;
        log(rtcToken);
        log(channelName);
        log(uid.toString());
        //fetchToken(uid, channelName, role);
        setupVideoSDKEngine();
        // setUpAgora();
      } else {
        Fluttertoast.showToast(msg: value['error']);
        setState(() {
          //_isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    // Set up an instance of Agora engine

    _getPrefs();
    _getMeetingToken();
  }

  Future<void> setupVideoSDKEngine() async {
    // retrieve or request camera and microphone permissions
    await [Permission.microphone, Permission.camera].request();

    //create an instance of the Agora engine
    agoraEngine = createAgoraRtcEngine();
    await agoraEngine
        .initialize(const RtcEngineContext(appId: AgoraChatConfig.appKey));

    await agoraEngine.enableVideo();

    join();
    // Register the event handler
    agoraEngine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          showMessage(
              "Local user uid:${connection.localUid} joined the channel");
          setState(() {
            _isJoined = true;
          });
        },
        onUserJoined:
            (RtcConnection connection, int remoteUid, int elapsed) async {
          showMessage("Remote user uid:$remoteUid joined the channel");
          setState(() {
            _remoteUid = remoteUid;
          });
          await ChangeBookingStatus().get(bookingId: widget.bookingId);
        },
        onError: (code, str) {
          showMessage("Error occurred ${code.name}");
        },
        onTokenPrivilegeWillExpire: (conn, str) async {
          await fetchToken(uid, channelName, role);
          await agoraEngine.renewToken(rtcToken);
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          showMessage("Remote user uid:$remoteUid left the channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );
  }

  void join() async {
    await agoraEngine.startPreview();

    // Set channel options including the client role and channel profile
    ChannelMediaOptions options = ChannelMediaOptions(
      clientRoleType: ClientRoleType.clientRoleBroadcaster,
      channelProfile: ChannelProfileType.channelProfileCommunication,
    );

    await agoraEngine.joinChannel(
      token: rtcToken,
      channelId: channelName,
      options: options,
      uid: uid,
    );
    setState(() {
      _isLoading = false;
    });
  }

  void leave() async {
    setState(() {
      _isJoined = false;
      _remoteUid = null;
    });
    log("message");
    //await _client.release();
    if (_isUser) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => USessionSuccessfulScreen(
                    model: widget.model,
                    bookingId: widget.bookingId,
                    date: widget.date,
                    issue: widget.issue,
                  )));
    } else {
      final resp = await AvailabilityApi().get(status: 1);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => PSuccessfulSessionScreen()));
    }
    await agoraEngine.leaveChannel();
    await agoraEngine.release();
  }

  // Release the resources when you leave
  @override
  void dispose() async {
    await agoraEngine.leaveChannel();
    await agoraEngine.release();
    super.dispose();
  }

  bool muted = false;
  void _onToggleMute() {
    setState(() {
      muted = !muted;
    });
    agoraEngine.muteLocalAudioStream(muted);
  }

  void _onCallEnd(BuildContext context) {
    leave();
  }

  void _onSwitchCamera() {
    agoraEngine.switchCamera();
  }

  Widget _toolbar() {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: _onToggleMute,
            child: Icon(
              muted ? Icons.mic_off : Icons.mic,
              color: muted ? Colors.white : Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: muted ? Colors.blueAccent : Colors.white,
            padding: const EdgeInsets.all(12.0),
          ),
          RawMaterialButton(
            onPressed: () => _onCallEnd(context),
            child: Icon(
              Icons.call_end,
              color: Colors.white,
              size: 35.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.redAccent,
            padding: const EdgeInsets.all(15.0),
          ),
          RawMaterialButton(
            onPressed: _onSwitchCamera,
            child: Icon(
              Icons.switch_camera,
              color: Colors.blueAccent,
              size: 20.0,
            ),
            shape: CircleBorder(),
            elevation: 2.0,
            fillColor: Colors.white,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }

  Future<void> fetchToken(int uid, String channelName, int tokenRole) async {
    var prefs = await SharedPreferences.getInstance();
    var v = prefs.getString(Keys().cookie);
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=$v'
    };
    //log(channelName.toString());
    String url =
        //'$tokenUrl/rtc/$channelName/${tokenRole.toString()}/uid/${uid.toString()}';
        // '$tokenUrl?channelName=$channelName&uid=$uid&role=$tokenRole&tokenExpire=3600';
        '$tokenUrl?channelName=$channelName&uid=${uid.toString()}&role=${tokenRole.toString()}&tokenExpire=3600';
    var request = http.Request('PUT', Uri.parse(url));
    request.body = json.encode({"booking_id": widget.bookingId});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    var resp = jsonDecode(await response.stream.bytesToString());
    log("resp :- $resp");
    if (response.statusCode == 200) {
      // If the server returns an OK response, then parse the JSON.
      Map<String, dynamic> json = resp;
      log("message $json");
      String newToken = json['token'];
      //log('Token Received: $newToken');
      // Use the token to join a channel or renew an expiring token
      setState(() {
        rtcToken = newToken;
      });
      //setUpAgora();
    } else {
      // If the server did not return an OK response,
      // then throw an exception.

      throw Exception(
          'Failed to fetch a token. Make sure that your server URL is valid');
    }
  }

  String tokenUrl =
      "https://theataraxis.com/ataraxis/api-user/generate-agora-token.php";

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: scaffoldMessengerKey,
          home: Scaffold(
              appBar: CustomWhiteAppBar(
                hasThreeDots: false,
                onThreeDotTap: () {},
                appBarText: 'Session',
                imgPath: "assets/images/iconbackappbarlarge.png",
              ),
              body: _isLoading
                  ? LoadingWidget()
                  : SafeArea(
                      child: Stack(
                        //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                        children: [
                          // Container for the remote video
                          Center(
                            //height: 240,
                            //decoration: BoxDecoration(border: Border.all()),
                            child: Center(child: _remoteVideo()),
                          ),
                          //Container for the local video
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                                height: 150,
                                width: 150,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(16)),
                                child: _localPreview()),
                          ),
                          // Button Row
                          Positioned(
                              bottom: 30,
                              left: 20,
                              right: 20,
                              child: _toolbar()),
                        ],
                      ),
                    )),
        ));
  }

  // Display local video preview
  Widget _localPreview() {
    if (_isJoined) {
      return AgoraVideoView(
        controller: VideoViewController(
          rtcEngine: agoraEngine,
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
          rtcEngine: agoraEngine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: RtcConnection(channelId: channelName),
        ),
      );
    } else {
      String msg = '';
      if (_isJoined) msg = 'Waiting for a remote user to join';
      return Center(
        child: Text(
          msg,
          textAlign: TextAlign.center,
        ),
      );
    }
  }
}
