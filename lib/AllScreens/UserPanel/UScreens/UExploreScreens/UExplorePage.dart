import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/decorations.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/buttons.dart';
import 'package:greymatter/widgets/loadingWidget.dart';

import '../../UWidgets/Uwidgets.dart';
import '../UBookingScreens/UScheduleAppointmentScreen.dart';

class UExplorePage extends StatefulWidget {
  const UExplorePage({
    Key? key,
    required this.issue,
    required this.issueId,
    required this.bookingType,
  }) : super(key: key);
  final String issue;
  final String issueId;
  final String bookingType;
  @override
  State<UExplorePage> createState() => _UExplorePageState();
}

class _UExplorePageState extends State<UExplorePage> {
  String date = '';

  bool isLoading = false;

  @override
  void initState() {
    getData();
    super.initState();
  }

  UPsychologistModel model = UPsychologistModel();
  List<UPsychologistModel> psychologists = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserExploreApi().get();
    resp.then((value) {
      //print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            psychologists.add(UPsychologistModel.fromJson(v));
          }
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: kEDF6F9,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 24.w, top: 40.h, right: 24.h, bottom: 80.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${psychologists.length} Counsellors',
                        style: kManRope_500_16_001314,
                      ),
                      /*GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const UFilterScreen()));
                        },
                        child: Container(
                          color: Colors.transparent,
                          padding: const EdgeInsets.all(10.0),
                          child: SvgPicture.asset(
                            'assets/icons/filter.svg',
                            height: 20.w,
                            width: 18.w,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                  ListView.separated(
                    itemCount: psychologists.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (ctx, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 24 : 0,
                          //bottom: 16,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            //clipBehavior: Clip.hardEdge,
                            margin: EdgeInsets.all(5),
                            decoration:
                                CustomDecoration().card24Edf6Decoration(),
                            padding: EdgeInsets.only(
                              left: 20.w,
                              right: 20,
                              top: 24,
                              bottom: 24,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 64.w,
                                          height: 64.w,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              color: kFFFFFF,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: CachedNetworkImage(
                                            imageUrl: psychologists[index]
                                                .profilePhoto
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Center(
                                              child: SpinKitThreeBounce(
                                                color: k006D77,
                                                size: 10,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(width: 12.w),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                psychologists[index]
                                                    .name
                                                    .toString(),
                                                style: kManRope_600_16_Black),
                                            SizedBox(height: 4.h),
                                            Text(
                                                psychologists[index]
                                                    .education
                                                    .toString(),
                                                style: kManRope_400_14_626A6A),
                                            SizedBox(height: 8.h),
                                            StarWidget(
                                              rating: psychologists[index]
                                                  .rating
                                                  .toString(),
                                              experience: psychologists[index]
                                                  .totalExprience
                                                  .toString(),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    // Text('₹270', style: kManRope_400_12_001314),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Specializes in : ${psychologists[index].specialities!.first.name}",
                                        style: kManRope_400_12_001314,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 24.h),
                                Row(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 56.h,
                                        child: MainButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UDoctorProfileScreen(
                                                            bookingType: widget
                                                                .bookingType,
                                                            showBookSession:
                                                                true,
                                                            issue: widget.issue,
                                                            issueId:
                                                                widget.issueId,
                                                            psychologistData:
                                                                psychologists[
                                                                    index],
                                                          )));
                                            },
                                            child: Text(
                                              "View Profile",
                                              style: kManRope_500_16_006D77,
                                            ),
                                            color: kEDF6F9,
                                            shape: CustomDecoration()
                                                .button10outlineDecoration()),
                                      ),
                                    ),
                                    SizedBox(width: 8.w),
                                    Expanded(
                                      child: SizedBox(
                                        height: 56.h,
                                        child: MainButton(
                                            onPressed: () {
                                              /*Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UConfirmAppointmentBooking(
                                                            issue: widget.issue,
                                                            date: date,
                                                          )));*/
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          UScheduleAppointmentScreen(
                                                            bookingType: widget
                                                                .bookingType,
                                                            psychologist:
                                                                psychologists[
                                                                    index],
                                                            issue: widget.issue,
                                                            issueId:
                                                                widget.issueId,
                                                          )));
                                            },
                                            child: Text(
                                              "Book session",
                                              style: kManRope_500_16_white,
                                            ),
                                            color: k006D77,
                                            shape: CustomDecoration()
                                                .smallButton10Decoration()),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(height: 24.h);
                    },
                  ),
                  SizedBox(height: 130),
                ],
              ),
            ),
          ),
        ),
        if (_isLoading)
          Padding(
            padding: EdgeInsets.only(bottom: 190.h),
            child: LoadingWidget(),
          )
      ],
    );
  }
}
