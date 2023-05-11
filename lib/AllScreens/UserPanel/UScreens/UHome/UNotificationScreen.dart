import 'dart:developer';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/Apis/Notifications_apis/get_notifications.dart';
import 'package:greymatter/model/notification_model/notification_model.dart';
import 'package:greymatter/widgets/app_bar/app_bar.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/fonts.dart';

class UNotificationsScreen extends StatefulWidget {
  const UNotificationsScreen({Key? key}) : super(key: key);

  @override
  State<UNotificationsScreen> createState() => _UNotificationsScreenState();
}

class _UNotificationsScreenState extends State<UNotificationsScreen> {
  bool hasNotifications = false;

  @override
  void initState() {
    _getData();
    super.initState();
  }

  List<NotificationModel> modelList = [];
  bool _isLoading = false;
  int val = 0;

  int _scroll = 0;
  _getReloadedData() {
    _scroll++;
    //_isLoading = true;
    final resp = GetNotification().get();
    resp.then((value) {
      log(value.toString());
      if (value == false) {
        setState(() {
          hasNotifications = false;
          _isLoading = false;
        });
      } else {
        setState(() {
          val = value.length;
          for (var v in value) {
            modelList.add(NotificationModel.fromJson(v));
          }
          _isLoading = false;
        });
      }
    });
  }

  Future<String> _getData() async {
    _isLoading = true;
    final resp = GetNotification().get();
    resp.then((value) {
      log(value.toString());
      if (value == false) {
        setState(() {
          hasNotifications = false;
          _isLoading = false;
        });
      } else {
        modelList.clear();
        setState(() {
          val = value.length;
          for (var v in value) {
            modelList.add(NotificationModel.fromJson(v));
          }
          _isLoading = false;
        });
      }
    });
    return "Success";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: CustomWhiteAppBar(
        hasThreeDots: false,
        appBarText: 'Notificaton',
        imgPath: 'assets/images/iconbackappbar2.png',
      ),
      body: _isLoading
          ? Center(
              child: LoadingWidget(),
            )
          : modelList.isEmpty
              ? Center(
                  child: Text(
                    'No New Notifications.',
                    style: kManRope_500_16_001314,
                  ),
                )
              : LazyLoadScrollView(
                  onEndOfPage: () async {
                    if (val >= 10) {
                      _getReloadedData();
                    }
                  },
                  child: RefreshIndicator(
                    onRefresh: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      _getData();
                    },
                    child: ListView.separated(
                        padding:
                            EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
                        itemBuilder: (ctx, index) {
                          if (modelList.length > index) {
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Badge(
                                  showBadge: modelList[index].seen == "0"
                                      ? true
                                      : false,
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey),
                                    child: Image.network(
                                      modelList[index].userPhoto.toString(),
                                      errorBuilder: (q, w, e) =>
                                          Icon(Icons.error),
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                              title: Text(
                                modelList[index].notification.toString(),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: kManRope_400_14_001314,
                              ),
                              trailing: Text(
                                _timeAgoFn(index),
                                style: kManRope_400_14_626A6A,
                              ),
                            );
                          } else {
                            if (val >= 10) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return SizedBox.shrink();
                            }
                          }
                        },
                        separatorBuilder: (ctx, ind) => Divider(),
                        itemCount: modelList.length + 1),
                  ),
                ),
    );
  }

  String _timeAgoFn(int index) {
    return DateTime.now()
                .difference(
                    DateTime.parse(modelList[index].createdAt.toString()))
                .inMinutes <=
            59
        ? "${DateTime.now().difference(DateTime.parse(modelList[index].createdAt.toString())).inMinutes} min "
        : DateTime.now()
                    .difference(
                        DateTime.parse(modelList[index].createdAt.toString()))
                    .inHours <=
                23
            ? "${DateTime.now().difference(DateTime.parse(modelList[index].createdAt.toString())).inHours} hour "
            : "${DateTime.now().difference(DateTime.parse(modelList[index].createdAt.toString())).inDays} day(s) ";
  }
}
