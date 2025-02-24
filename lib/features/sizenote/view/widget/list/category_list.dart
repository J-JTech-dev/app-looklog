import 'package:app_looklog/common/theme/colors.dart';
import 'package:app_looklog/core/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectIndexProvider = StateProvider<int>((ref) => 0); //카테고리 선택

class CategoryList extends ConsumerStatefulWidget {
  final int index;
  final String title;
  const CategoryList({super.key, required this.index, required this.title});

  @override
  ConsumerState<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends ConsumerState<CategoryList> {
  @override
  Widget build(BuildContext context) {
    final categoryIndex = ref.watch(selectIndexProvider);

    return GestureDetector(
      onTap: () {
        ref.read(selectIndexProvider.notifier).state = widget.index;
      },
      child: Container(
        width: AppConfig.w(54),
        height: AppConfig.h(33),
        margin: EdgeInsets.only(left: AppConfig.w(5), right: AppConfig.w(5)),
        decoration: BoxDecoration(
          color: categoryIndex == widget.index ? MAIN_COLOR : GRAY_4,
          borderRadius: BorderRadius.all(Radius.circular(AppConfig.r(30)))
        ),
        child: Center(
          child: Text(widget.title, style:
          Theme.of(context).textTheme.labelLarge?.copyWith(color: categoryIndex == widget.index ? WHITE : GRAY_6, fontWeight: categoryIndex == widget.index ? FontWeight.w700 : FontWeight.w400)
            ,),
        ),
      ),
    );
  }
}
