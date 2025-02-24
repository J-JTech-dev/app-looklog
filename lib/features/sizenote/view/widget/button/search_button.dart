import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/features/sizenote/view/page/item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/config/app_config.dart';

class SearchButton extends ConsumerStatefulWidget {
  final int index;
  final String text;
  const SearchButton({super.key, required this.index, required this.text});

  @override
  ConsumerState<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends ConsumerState<SearchButton> {
  @override
  Widget build(BuildContext context) {
    final searchIndex = ref.watch(searchFilterIndexProvider);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConfig.w(6)),
      child: GestureDetector(
        onTap: () {
          ref.read(searchFilterIndexProvider.notifier).state = widget.index;
        },
        child: Container(
          height: AppConfig.h(35),
          decoration: BoxDecoration(
              color: searchIndex == widget.index ? WHITE : MAIN_COLOR,
              borderRadius: BorderRadius.all(
                  Radius.circular(AppConfig.r(10))
              )
          ),
          child: Center(
            child: Text(widget.text, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: searchIndex == widget.index ? MAIN_COLOR : WHITE,
              fontWeight: searchIndex == widget.index ? FontWeight.w700 : FontWeight.w400
            ),),
          ),
        ),
      ),
    );
  }
}
