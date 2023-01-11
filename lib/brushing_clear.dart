import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BrushingClear extends StatefulWidget {
  const BrushingClear({
    super.key,
    this.time,
    this.goodCount,
    this.badCount,
  });

  final String? time;
  final int? goodCount;
  final int? badCount;

  @override
  State<BrushingClear> createState() => _BrushingClearState();
}

class _BrushingClearState extends State<BrushingClear> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        backgroundColor: const Color(0xfffffde7),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 234, 166, 117),
        ),
        body: Center(
            child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: const AssetImage('assets/images/BrushBunny.png'),
                width: 80.w,
              ),
            ),
            Column(
              children: [
                SizedBox(height: 5.h),
                Text(
                  '양치질 완료!',
                  style:
                      TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
                ),
                const Text('좌우로 드래그하여 기록을 확인하세요!'),
                SizedBox(height: 2.h),
                claerCard(),
                SizedBox(height: 3.h),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffFFC6A2),
                    ),
                  ),
                  onPressed: () async {},
                  child: const Text('양치질 내역 기록하기',
                      style: TextStyle(
                        fontSize: 15,
                      )),
                ),
              ],
            ),
          ],
        )),
      );
    });
  }

  Widget claerCard() {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        reverse: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.4,
      ),
      items: [
        Container(
          color: const Color(0xffA3CCC4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '총 양치질 시간',
                  style: TextStyle(fontSize: 20),
                ),
                Text('${widget.time}', style: const TextStyle(fontSize: 30)),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xffFFC6A2),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '칭찬포인트',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${widget.goodCount}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
        Container(
          color: const Color(0xffAEAC9A),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '패널티',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${widget.badCount}',
                  style: const TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}