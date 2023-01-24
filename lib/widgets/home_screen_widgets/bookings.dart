import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UHome/book_appointment_screen.dart';
import 'package:greymatter/constants/fonts.dart';
// import 'package:greymatter/screens/UserPanel/UHome/book_appointment_screen.dart';
// import 'package:greymatter/screens/UserPanel/UScreens/UHome/book_appointment_screen.dart';
import 'package:greymatter/AllScreens/UserPanel/UScreens/UBookingScreens/instant_booking_screen.dart';

class Bookings extends StatelessWidget {
  const Bookings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const InstantBookingScreen()));
          },
          child: Container(
            height: 188.h,
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/instantbooking.png', width: 143.w,height: 96.h,),
                  SizedBox(height: 16.h),
                  Text('Instant Booking', style: kManRope_500_16_001314,),
                  SizedBox(height: 8.h),
                  Text('Connect within 60 s', style: kManRope_400_14_626A6A,),
                ],
              ),
            ),
          ),
        )),
        SizedBox(width: 16.w),
        Expanded(child: InkWell(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const BookAppointmentScreen()));
          },
          child: Container(
            height: 188.h,
            // padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white)
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/bookappointment.png', width: 143.w,height: 96.h,),
                  SizedBox(height: 16.h),
                  Text('Book Appointment', style: kManRope_500_16_001314,),
                  SizedBox(height: 8.h),
                  Text('Scheduled Booking', style: kManRope_400_14_626A6A,),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }
}
