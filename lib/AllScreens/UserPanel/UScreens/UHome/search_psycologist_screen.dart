import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/decorations.dart';
import '../../../../constants/fonts.dart';
import '../../../../model/UModels/user_psychologist_model.dart';
import '../../../../widgets/buttons.dart';
import '../../UWidgets/Uwidgets.dart';
import '../UBookingScreens/UScheduleAppointmentScreen.dart';
import '../UExploreScreens/UDoctorprofile.dart';
import '../UInstantScreens/UConfirmBookingScreen.dart';

class SearchPsychologistScreen extends StatefulWidget {
  final String issue;
  final String issueId;
  final String bookingType;
  const SearchPsychologistScreen(
      {Key? key,
      required this.issue,
      required this.bookingType,
      required this.issueId})
      : super(key: key);

  @override
  State<SearchPsychologistScreen> createState() =>
      _SearchPsychologistScreenState();
}

class _SearchPsychologistScreenState extends State<SearchPsychologistScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  final TextEditingController _controller = TextEditingController();
  UPsychologistModel model = UPsychologistModel();
  List<UPsychologistModel> psychologists = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserExploreApi().get(scroll: '0', search: _controller.text);
    resp.then((value) {
      log(value.toString());
      if (mounted) {
        psychologists.clear();
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
    return Scaffold(
      backgroundColor: kEDF6F9,
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 60.w,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          'Search Counsellors',
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
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            children: [
              Container(
                height: 56.h,
                // margin: EdgeInsets.symmetric(horizontal: 24),
                decoration: CustomDecoration().outline5A72EDDecoration(),
                child: TextField(
                  controller: _controller,
                  autofocus: true,
                  decoration: TextfieldDecoration(
                          label: 'Search for Counsellors',
                          hintstyle: kManRope_400_14_626A6A)
                      .whiteColorSearchField(() {
                    if (_controller.text.length > 1) {
                      print("object");
                      setState(() {
                        _isLoading = true;
                      });
                      getData();
                    }
                  }),
                ),
              ),
              _isLoading
                  ? Center(
                      child: SpinKitThreeBounce(
                        color: k006D77,
                        size: 30,
                      ),
                    )
                  : ListView.separated(
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
                                                    BorderRadius.circular(10)),
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
                                                  style: kManRope_600_16_Black),
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
                                                              bookingType: widget
                                                                  .bookingType,
                                                              showBookSession:
                                                                  true,
                                                              issue:
                                                                  widget.issue,
                                                              issueId: widget
                                                                  .issueId,
                                                              psychologistData:
                                                                  psychologists[
                                                                      i],
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
                                              onPressed:
                                                  widget.bookingType == 'i'
                                                      ? () {
                                                          Navigator.of(context).push(
                                                              MaterialPageRoute(
                                                                  builder: (ctx) =>
                                                                      UConfirmBookingScreen(
                                                                        bookingType:
                                                                            widget.bookingType,
                                                                        issue: widget
                                                                            .issue,
                                                                        issueId:
                                                                            widget.issueId,
                                                                        model:
                                                                            psychologists[i],
                                                                      )));
                                                        }
                                                      : () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          UScheduleAppointmentScreen(
                                                                            bookingType:
                                                                                widget.bookingType,
                                                                            psychologist:
                                                                                psychologists[i],
                                                                            issue:
                                                                                widget.issue,
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
                        return SizedBox(height: 40.h);
                      },
                      itemCount: psychologists.length),
            ],
          ),
        ),
      ),
    );
  }
}
