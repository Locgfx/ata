import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoader extends StatefulWidget {
  final double height;
  const ShimmerLoader({Key? key, required this.height}) : super(key: key);

  @override
  State<ShimmerLoader> createState() => _ShimmerLoaderState();
}

class _ShimmerLoaderState extends State<ShimmerLoader> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.9,
      child: Shimmer.fromColors(
        child: Column(
          children: [
            Container(
              width: 1.sw,
              height: widget.height,
              margin: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ],
        ),
        baseColor: Colors.black12,
        highlightColor: Colors.white,
      ),
    );
  }
}
