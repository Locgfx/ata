import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/constants/colors.dart';
import 'package:greymatter/constants/fonts.dart';
import 'package:greymatter/model/PModels/home_models/earning_models/counselor_bank_details_model.dart';

class AccountNumberBottomSheet extends StatefulWidget {
  final List<CounselorBankDetailsModel> modelList;
  final int index;
  final Function(CounselorBankDetailsModel, int) onPop;
  const AccountNumberBottomSheet(
      {Key? key,
      required this.modelList,
      required this.index,
      required this.onPop})
      : super(key: key);

  @override
  State<AccountNumberBottomSheet> createState() => _AccountNumberBottomSheet();
}

class _AccountNumberBottomSheet extends State<AccountNumberBottomSheet> {
  int _gIndex = -1;

  @override
  void initState() {
    _gIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 71.h,
          decoration: const BoxDecoration(
            color: k006D77,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Center(
            child: Text(
              'Select Account',
              style: kManRope_700_16_white,
            ),
          ),
        ),
        Container(
            constraints: BoxConstraints(
              maxHeight: 420.h,
            ),
            width: 220.w,
            padding: const EdgeInsets.only(top: 20.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // color: CupertinoColors.systemBackground.resolveFrom(context),
            child: ListView.separated(
              itemCount: widget.modelList.length,
              shrinkWrap: true,
              //physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => setState(() {
                    _gIndex = index;
                    Navigator.of(context).pop();
                    widget.onPop(widget.modelList[index], _gIndex);
                  }),
                  child: Container(
                    height: 44.h,
                    width: 215.w,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: _gIndex == index ? k006D77 : Colors.transparent,
                    ),
                    child: Center(
                        child: Text(
                      widget.modelList[index].accountNumber.toString(),
                      style: _gIndex == index
                          ? kManRope_500_16_white
                          : kManRope_500_16_626A6A,
                    )),
                  ),
                );
              },
              separatorBuilder: (ctx, ind) {
                return SizedBox(
                  height: 8.h,
                );
              },
            )
            /*Column(
            children: [
              ,
              SizedBox(height: 8.h),
              GestureDetector(
                onTap: () => setState(() {
                  _gIndex = 1;
                  Navigator.of(context).pop();
                }),
                child: Container(
                  height: 44.h,
                  width: 215.w,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    color: _gIndex == 1 ? k006D77 : Colors.transparent,
                  ),
                  child: Center(
                      child: Text(
                        '1 2 3 4 5 6 7 8 9 1 2 3 1 4',
                        style: _gIndex == 1
                            ? kManRope_500_16_white
                            : kManRope_500_16_626A6A,
                      )),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),*/
            ),
      ],
    );
  }
}
