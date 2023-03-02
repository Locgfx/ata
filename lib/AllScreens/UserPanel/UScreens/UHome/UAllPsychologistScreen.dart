import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/UScheduleAppointmentScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UExploreScreens/UDoctorprofile.dart';
import 'package:greymatter/Apis/UserAPis/user_explore_apis/user_explore_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/UModels/user_psychologist_model.dart';
import 'package:greymatter/widgets/loadingWidget.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/primary_card_button.dart';
import 'package:greymatter/widgets/shared/buttons/card_buttons/secondary_card_button.dart';

class UAllPsychologistScreen extends StatefulWidget {
  final String? issue;
  const UAllPsychologistScreen({Key? key, this.issue}) : super(key: key);

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
              'Available Counselors',
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
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: ListView.separated(
                      itemBuilder: (ctx, i) {
                        return Container(
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
                                        placeholder: (context, url) => Opacity(
                                          opacity: 0.9,
                                          child: Container(
                                            color: Colors.white,
                                            width: 64.w,
                                            height: 64.w,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  psychologists[i]
                                                      .name
                                                      .toString(),
                                                  style: kManRope_400_16_Black),
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
                                              style: kManRope_400_14_626A6A),
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
                                                          showBookSession: true,
                                                          issue: widget.issue ??
                                                              '',
                                                          psychologistData:
                                                              psychologists[i],
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
                                              psychologist: psychologists[i],
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
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return SizedBox(height: 40.h);
                      },
                      itemCount: psychologists.length),
                ),
              ),
            ],
          ),
        ),
        if (_isLoading) LoadingWidget(),
      ],
    );
  }
}