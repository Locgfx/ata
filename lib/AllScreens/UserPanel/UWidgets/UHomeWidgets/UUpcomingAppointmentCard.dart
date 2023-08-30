import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_order_model/upcoming_orders.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class UUpcomingAppointmentCard extends StatefulWidget {
  final UpcomingOrders data;
  final bool loading;
  const UUpcomingAppointmentCard({
    Key? key,
    required this.data,
    required this.loading,
  }) : super(key: key);

  @override
  State<UUpcomingAppointmentCard> createState() =>
      _UUpcomingAppointmentCardState();
}

class _UUpcomingAppointmentCardState extends State<UUpcomingAppointmentCard> {
  @override
  void initState() {
    widget.data.image.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loading) {
      return Opacity(
        opacity: 0.9,
        child: Shimmer.fromColors(
          child: Container(
            width: 1.sw,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          baseColor: Colors.black12,
          highlightColor: Colors.white,
        ),
      );
    } else {
      return Stack(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [k82DDF0.withOpacity(0.56), kFFB1A5..withOpacity(0.56)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Upcoming Appointments',
                          style: kManRope_700_16_001314,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      DateFormat("EEE, d MMM, yyyy  h:mm a").format(
                          DateTime.parse(
                              "${widget.data.date} ${widget.data.timeSlot}")),
                      style: kManRope_400_14_001314,
                    )
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            print(widget.data.image.toString());
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            width: 48.w,
                            height: 48.w,
                            child: CachedNetworkImage(
                              imageUrl: widget.data.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => SpinKitThreeBounce(
                                color: k006D77,
                                size: 10,
                              ),
                              errorWidget: (a, b, c) {
                                return Container(
                                    width: 48.w,
                                    height: 48.w,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Icon(Icons.error));
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.data.name,
                                style: kManRope_400_14_001314),
                            SizedBox(height: 4.h),
                            Text(
                              widget.data.designation,
                              style: kManRope_400_12_626A64_07,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            top: 0,
            child: SizedBox(
              width: 156,
              height: 156,
              child: Image.asset(
                'assets/images/ua.png',
              ),
            ),
          ),
        ],
      );
    }
  }
}
