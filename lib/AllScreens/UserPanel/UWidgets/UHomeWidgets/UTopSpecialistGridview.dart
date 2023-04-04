import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/USelectPsyChologistScreen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/UBookAppointmentScreen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/userspecialistapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';

import '../../UScreens/UHome/UAllPsychologistScreen.dart';

class TopSpecialistGridview extends StatefulWidget {
  final Widget? child;
  final String bookingType;
  TopSpecialistGridview({Key? key, this.child, required this.bookingType})
      : super(key: key);

  @override
  State<TopSpecialistGridview> createState() => _TopSpecialistGridviewState();
}

class _TopSpecialistGridviewState extends State<TopSpecialistGridview> {
  //
  @override
  void initState() {
    getData();
    super.initState();
  }

  UserSpecialistModel model = UserSpecialistModel();
  List<UserSpecialistModel> specialistModel = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserSpecialistApi().get();
    resp.then((value) {
      //print(value);
      if (mounted) {
        setState(() {
          for (var v in value) {
            specialistModel.add(UserSpecialistModel.fromJson(v));
          }
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? SizedBox()
        : GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 5),
            shrinkWrap: true,
            itemCount: specialistModel.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 1 / 1.5,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 5.0),
            itemBuilder: (ctx, index) {
              if (index >= 7) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => UBookAppointmentScreen(
                              bookingType: widget.bookingType,
                            )));
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 84.w,
                          height: 84.w,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              border: Border.all(color: kFFFFFF, width: 1),
                              borderRadius: BorderRadius.circular(24),
                              color: k006D77),
                          child: Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Image.asset(
                              'assets/images/iconrightarrow24white.png',
                              height: 24.w,
                              width: 24.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          'Show all',
                          style: kManRope_400_16_626A6A,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => UAllPsychologistScreen(
                              issue: specialistModel[index].name.toString(),
                              issueId: specialistModel[index].id.toString(),
                              bookingType: widget.bookingType,
                            )));
                  },
                  child: Container(
                    width: 84.w,
                    height: 84.w,
                    color: Colors.transparent,
                    child: Column(
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          height: 84.w,
                          width: 84.w,
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // image: DecorationImage(
                              //   image: AssetImage(_imgList[index],),fit: BoxFit.cover,
                              // ),
                              color: kFFFFFF.withOpacity(0.40),
                              borderRadius: BorderRadius.circular(24),
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CachedNetworkImage(
                              imageUrl: specialistModel[index].icon.toString(),
                              fit: BoxFit.fill,
                              placeholder: (context, url) => Center(
                                child: SpinKitThreeBounce(
                                  color: k006D77,
                                  size: 10,
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          specialistModel[index].name.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: kManRope_400_16_626A6A,
                        ),
                      ],
                    ),
                  ),
                );
              }
            },
          );
  }
}
