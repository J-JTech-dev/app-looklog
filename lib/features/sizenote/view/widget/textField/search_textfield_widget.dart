import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';

class SearchTextFieldWidget extends StatefulWidget {
  const SearchTextFieldWidget({super.key});

  @override
  State<SearchTextFieldWidget> createState() => _SearchTextFieldWidgetState();
}

class _SearchTextFieldWidgetState extends State<SearchTextFieldWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
        color: BRACK_2,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
          hintText: '아이템을 검색해보세요.',
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: GRAY_6,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none
      ),
    );
  }
}
