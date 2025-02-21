import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';

class WeatherTextWidget extends StatefulWidget {
  final String locationTxt;
  final String temperatureTxt;
  final String dressTxt;
  const WeatherTextWidget({super.key, required this.locationTxt,required this.temperatureTxt,required this.dressTxt});

  @override
  State<WeatherTextWidget> createState() => _WeatherTextWidgetState();
}

class _WeatherTextWidgetState extends State<WeatherTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppConfig.h(20)),
      child: Column(
        children: [
          Text(widget.locationTxt, style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: BRACK_2,
          ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.temperatureTxt, style: Theme.of(context).textTheme.titleLarge),
              SizedBox(width: AppConfig.w(6)),
              Image.asset('assets/images/celsius_img.png', width: AppConfig.w(42), height: AppConfig.h(42),)
            ],
          ),
          SizedBox(height: AppConfig.h(18)),
          Text('오늘의 옷차림은',style: Theme.of(context).textTheme.bodyMedium,),
          SizedBox(height: AppConfig.h(5)),
          Text('${widget.dressTxt} 추천드립니다.',
            style: Theme.of(context).textTheme.bodyMedium,),
        ],
      ),
    );
  }
}
