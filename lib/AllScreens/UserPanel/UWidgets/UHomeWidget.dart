import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/book_appointment_screen.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_offer_banner_api.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_specialist_model.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/userspecialistapi.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/loader.dart';
import 'package:greymatter/model/UModels/user_home_models/user_offer_banner_model.dart';




//----------------------------------------
class OfferBanner extends StatefulWidget {
  const OfferBanner({Key? key}) : super(key: key);

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  int _index = 0;
  // int _index2 = 0;
  List _bgImageList = [
    'assets/images/offercard1.png',
    'assets/images/offercard2.png',
    'assets/images/offercard3.png',
  ];

  @override
  void initState() {
    getData();
    super.initState();
  }

  UserOfferBannerModel model = UserOfferBannerModel();
  List<UserOfferBannerModel> offerBanner = [];
  bool _isLoading = false;

  getData() {
    _isLoading = true;
    final resp = UserOfferBannerApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          offerBanner.add(UserOfferBannerModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      Column(
      children: [
        Container(
          height: 250.h,
          child: CarouselSlider.builder(
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _index = index;
                });
                //print(_index);
              },
              aspectRatio: 2,
              viewportFraction: 0.8,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
            ),
            itemBuilder:
                (BuildContext context, int index, int realIndex) {
              return Container(
                  width: 1.sw,
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: NetworkImage(offerBanner[index].banner.toString()),
                  fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  ),);
            },
            itemCount:offerBanner.length,
          ),
        ),
        SizedBox(height: 24.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            offerBanner.length,
                (index) {
              return Container(
                height: 4.h,
                decoration: BoxDecoration(
                  color: k5A72ED.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(2),
                ),
                child: AnimatedContainer(
                  alignment: Alignment.centerLeft,
                  // height: 4,
                  width: 24,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: _index == index ? k5A72ED : Colors.transparent,
                  ),
                  duration: Duration(milliseconds: 100),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}


//_--------------------------------------------
class TopSpecialistGridview extends StatefulWidget {
  const TopSpecialistGridview({Key? key}) : super(key: key);

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
      print(value);
      setState(() {
        for (var v in value) {
          specialistModel.add(UserSpecialistModel.fromJson(v));
        }
        _isLoading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 5),
        shrinkWrap: true,
        itemCount: specialistModel.length,
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 1 / 1.5,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 5.0),
        itemBuilder: (ctx, index) {
          if (index >= 7) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (ctx) =>
                        const BookAppointmentScreen()));
              },
              child: Container(
                color: Colors.transparent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 84.w,
                      height: 84.h,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        // image: DecorationImage(
                        //   image: AssetImage("assets/images/iconrightarrow24white.png"),
                        //   fit: BoxFit.cover
                        // ),
                          border: Border.all(
                              color: kFFFFFF, width: 1),
                          borderRadius:
                          BorderRadius.circular(24),
                          color: k006D77),
                      child: Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Image.asset(
                          'assets/images/iconrightarrow24white.png',
                          height: 24.h,
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
            return Container(
              width: 83.w,
              height: 118.h,
              // color: Colors.red,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 84.h,
                    width: 84.w,
                    // padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // image: DecorationImage(
                      //   image: AssetImage(_imgList[index],),fit: BoxFit.cover,
                      // ),
                        color: kFFFFFF.withOpacity(0.40),
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(color: Colors.white,width: 1)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(specialistModel[index].icon.toString(),
                        height: 62.h,width: 58.w,fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(specialistModel[index].name.toString(), style: kManRope_400_16_626A6A,),
                ],
              ),
            );
          }
        });
  }
}
class GridCard extends StatelessWidget {
  final int index;
  GridCard({Key? key, required this.index}) : super(key: key);

  final List<String> _imgList = [
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png',
    'assets/images/stress.png',
    'assets/images/anxiety.png','assets/images/stress.png',
    'assets/images/anxiety.png','assets/images/stress.png',
    'assets/images/anxiety.png','assets/images/stress.png',
  ];
  final List<String> _titleList = [
    'Anxiety',
    'Stress',
    'Addiction',
    'Anger',
    'Loneliness',
    'Stress',
    'Grief',
    'OCD',
    'Loneliness',
    'Addiction',
    'Anger',
    'Stress',
    'Grief',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 118.h,
      // color: Colors.red,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 84.h,
            width: 84.w,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              // image: DecorationImage(
              //   image: AssetImage(_imgList[index],),fit: BoxFit.cover,
              // ),
                color: kFFFFFF.withOpacity(0.40),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white,width: 1)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(_imgList[index],height: 62.h,width: 58.w,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(height: 8.h),
          Text(_titleList[index], style: kManRope_400_16_626A6A,),
        ],
      ),
    );
  }
}