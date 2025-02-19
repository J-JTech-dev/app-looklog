import 'package:app_looklog/core/config/app_config.dart';
import 'package:app_looklog/features/home/view/widget/weather_image_widget.dart';
import 'package:app_looklog/features/home/view/widget/weather_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../../../../common/theme/colors.dart';
import '../widget/calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final sizeW = AppConfig.sizeW;
  final sizeH = AppConfig.sizeH;
  final w = AppConfig.w;
  final h = AppConfig.h;
  final r = AppConfig.r;

  String getFormattedDate() {
    DateTime now = DateTime.now();
    return DateFormat('yyyy년 MM월 dd일').format(now);
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Stack(
        children: [
          Container(
            width: sizeW,
            height: sizeH,
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: h(100)),
                  child: Column(
                    children: [
                      Container(
                        width: w(270),
                        height: h(280),
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.all(Radius.circular(r(15))),
                          color: WHITE,
                          boxShadow:  [
                            BoxShadow(
                              color: GRAY_9.withOpacity(r(0.4)),
                              blurRadius: r(20),
                              offset: Offset(
                                0.0,
                                h(3),
                              ),
                            ),
                          ]),
                        child: Column(
                          children: [
                            WeatherTextWidget(
                              //날씨 관련 텍스트
                              locationTxt: 'Seoul, Korea',
                              temperatureTxt: '23',
                              dressTxt: '반팔, 나시, 반바지',
                            ),
                            SizedBox(height: h(42),),
                            Padding(
                              padding: EdgeInsets.only(left: w(19)),
                              child: Column(
                                //풍량,강수량
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/wind_volume_img.png', width: w(23),height: h(23),),
                                      SizedBox(width: w(7),),
                                      Text('10 km/h',style: Theme.of(context).textTheme.bodySmall)
                                    ],
                                  ),
                                  SizedBox(height: h(21),),
                                  Row(
                                    children: [
                                      Image.asset('assets/images/precipitation_img.png', width: w(23),height: h(23),),
                                      SizedBox(width: w(7),),
                                      Text('60 %',style: Theme.of(context).textTheme.bodySmall)
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h(33)),
                Container(
                  //작년 오늘 입은 옷 확인
                  width: w(313),
                  height: h(62),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(r(10))),
                    color: BLUE_2,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h(13), horizontal: w(14)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getFormattedDate(), style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: WHITE,
                              fontWeight: FontWeight.w600
                            ),),
                            Text('작년 오늘, 어떤 옷을 입었을까요?', style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: WHITE,
                                fontWeight: FontWeight.w400
                            ),),
                          ],
                        ),
                        Image.asset('assets/icons/folder_icon.png', width: w(22),height: h(22),)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: w(25), right: w(25)),
                  child: const CalendarWidget(),
                ),
              ],
            ),
          ),
          Align(
            //날씨에 따른 이미지
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: w(20),bottom: h(130)),
              child: SizedBox(
                width: w(120),
                height: h(125),
                child: WeatherImageWidget(
                  fileUrl: 'assets/images/weather_sun_img.png',
                  // fileUrl: 'assets/images/weather_rain_img.png',
                  // fileUrl: 'assets/images/weather_snow_img.png',
                  // fileUrl: 'assets/images/weather_cloud_img.png',
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}
