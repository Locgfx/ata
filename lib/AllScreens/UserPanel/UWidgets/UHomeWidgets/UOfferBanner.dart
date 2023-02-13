import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:greymatter/Apis/UserAPis/user_home_apis/user_offer_banner_api.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/model/UModels/user_home_models/user_offer_banner_model.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({Key? key}) : super(key: key);

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  @override
  void initState() {
    getOfferBannerData();
    super.initState();
  }

  bool isLoading = false;
  UserOfferBannerModel model = UserOfferBannerModel();
  List<UserOfferBannerModel> modelofferBanner = [];

  int _index = 0;

  //-----------------------offerbannerapi-----------------------------
  getOfferBannerData() {
    isLoading = true;
    final resp = UserOfferBannerApi().get();
    resp.then((value) {
      print(value);
      setState(() {
        for (var v in value) {
          modelofferBanner.add(UserOfferBannerModel.fromJson(v));
        }
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoading || modelofferBanner.isEmpty
            ? SizedBox()
            : SizedBox(
          height: 250.h,
          child: CarouselSlider.builder(
            itemCount: modelofferBanner.length,
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
                clipBehavior: Clip.hardEdge,
                /*padding: EdgeInsets.symmetric(
                                        horizontal: 24.w, vertical: 24.h),*/
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: CachedNetworkImage(
                  imageUrl: modelofferBanner[index].banner.toString(),
                  fit: BoxFit.cover,
                  progressIndicatorBuilder: (_, a, b) => Center(
                    child: SpinKitThreeBounce(
                      color: k006D77,
                      size: 30,
                    ),
                  ),
                  /*placeholder: (context, url) => Center(
                          child: SpinKitThreeBounce(
                            color: k006D77,
                            size: 30,
                          ),
                        ),*/
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            modelofferBanner.length,
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
