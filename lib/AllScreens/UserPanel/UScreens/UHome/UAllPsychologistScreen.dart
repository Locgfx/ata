import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UScheduleAppointmentScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/primary_card_button.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/secondary_card_button.dart';

import '../../../../constants/decorations.dart';
import '../../../../widgets/buttons.dart';
import '../../UWidgets/Uwidgets.dart';

class UAllPsychologistScreen extends StatefulWidget {
  final String issue;
  final String issueId;
  final String bookingType;
  const UAllPsychologistScreen(
      {Key? key,
      required this.issue,
      required this.issueId,
      required this.bookingType})
      : super(key: key);

  @override
  State<UAllPsychologistScreen> createState() => _UAllPsychologistScreenState();
}

class _UAllPsychologistScreenState extends State<UAllPsychologistScreen> {
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
          appBar: AppBar(
            elevation: 0,
            leadingWidth: 60.w,
            backgroundColor: Colors.white,
            centerTitle: false,
            title: Text(
              'Available Counsellors',
              style: kManRope_500_16_006D77,
            ),
            titleSpacing: 0.w,
            leading: Padding(
              padding: EdgeInsets.all(10.0),
              child: InkWell(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      Container(
                        height: 56.h,
                        // margin: EdgeInsets.symmetric(horizontal: 24),
                        decoration:
                            CustomDecoration().outline5A72EDDecoration(),
                        child: TextField(
                          decoration: TextfieldDecoration(
                                  label: 'Search for Counsellors',
                                  hintstyle: kManRope_400_14_626A6A)
                              .whiteColorSearchField(),
                        ),
                      ),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (ctx, i) {
                            return Padding(
                              padding: EdgeInsets.only(
                                top: i == 0 ? 24 : 0,
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: CachedNetworkImage(
                                                  imageUrl: psychologists[i]
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
                                                      psychologists[i]
                                                          .name
                                                          .toString(),
                                                      style:
                                                          kManRope_600_16_Black),
                                                  SizedBox(height: 4.h),
                                                  Text(
                                                      psychologists[i]
                                                          .education
                                                          .toString(),
                                                      style:
                                                          kManRope_400_14_626A6A),
                                                  SizedBox(height: 8.h),
                                                  StarWidget(
                                                    rating: psychologists[i]
                                                        .rating
                                                        .toString(),
                                                    experience: psychologists[i]
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
                                              "Specializes in : ${psychologists[i].specialities!.map((e) => e.name).join(", ")}",
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
                                                                  bookingType:
                                                                      widget
                                                                          .bookingType,
                                                                  showBookSession:
                                                                      true,
                                                                  issue: widget
                                                                      .issue,
                                                                  issueId: widget
                                                                      .issueId,
                                                                  psychologistData:
                                                                      psychologists[
                                                                          i],
                                                                )));
                                                  },
                                                  child: Text(
                                                    "View Profile",
                                                    style:
                                                        kManRope_500_16_006D77,
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
                                                                  bookingType:
                                                                      widget
                                                                          .bookingType,
                                                                  psychologist:
                                                                      psychologists[
                                                                          i],
                                                                  issue: widget
                                                                      .issue,
                                                                  issueId: widget
                                                                      .issueId,
                                                                )));
                                                  },
                                                  child: Text(
                                                    "Book session",
                                                    style:
                                                        kManRope_500_16_white,
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
                            /*Container(
                              height: 180,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 24.h),
                              margin: EdgeInsets.only(top: i == 0 ? 40 : 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 64.w,
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 64.w,
                                          height: 64.w,
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(
                                              color: kEDF6F9,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: CachedNetworkImage(
                                            imageUrl: psychologists[i]
                                                .profilePhoto
                                                .toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (context, url) =>
                                                Opacity(
                                              opacity: 0.9,
                                              child: Container(
                                                color: Colors.white,
                                                width: 64.w,
                                                height: 64.w,
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                          ),
                                        ),
                                        SizedBox(width: 8.w),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                      psychologists[i]
                                                          .name
                                                          .toString(),
                                                      style:
                                                          kManRope_400_16_Black),
                                                  Text(
                                                      '₹' +
                                                          psychologists[i]
                                                              .price
                                                              .toString(),
                                                      style:
                                                          kManRope_400_12_001314),
                                                ],
                                              ),
                                              //SizedBox(width: 10,),
                                              Spacer(),
                                              Text(
                                                  psychologists[i]
                                                              .education
                                                              .toString() ==
                                                          ''
                                                      ? 'Verification Pending'
                                                      : psychologists[i]
                                                          .education
                                                          .toString(),
                                                  style:
                                                      kManRope_400_14_626A6A),
                                              Spacer(),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                      'assets/images/Star 1.png',
                                                      width: 15.w,
                                                      height: 15.w),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                      psychologists[i]
                                                          .rating
                                                          .toString(),
                                                      style:
                                                          kManRope_400_12_001314),
                                                  SizedBox(width: 4.w),
                                                  Text('.',
                                                      style:
                                                          kManRope_700_16_001314),
                                                  SizedBox(width: 4.w),
                                                  Text(
                                                      '${psychologists[i].totalExprience} Yrs. Exp',
                                                      style:
                                                          kManRope_400_12_001314),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.h),
                                  Row(
                                    children: [
                                      Expanded(
                                          child: GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            UDoctorProfileScreen(
                                                              showBookSession:
                                                                  true,
                                                              issue: widget
                                                                      .issue ??
                                                                  '',
                                                              psychologistData:
                                                                  psychologists[
                                                                      i],
                                                            )));
                                              },
                                              child: SecondaryCardButton())),
                                      SizedBox(width: 8.w),
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    UScheduleAppointmentScreen(
                                                  psychologist:
                                                      psychologists[i],
                                                  issue: widget.issue ?? '',
                                                ),
                                              ),
                                            );
                                          },
                                          child: PrimaryCardButton(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );*/
                          },
                          separatorBuilder: (ctx, index) {
                            return SizedBox(height: 40.h);
                          },
                          itemCount: psychologists.length),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isLoading) LoadingWidget(),
      ],
    );
  }
}
