import 'package:flutter/material.dart';

import '../../../../../common/theme/colors.dart';

class InsertTextFieldWidget extends StatefulWidget {
  const InsertTextFieldWidget({super.key});

  @override
  State<InsertTextFieldWidget> createState() => _InsertTextFieldWidgetState();
}

class _InsertTextFieldWidgetState extends State<InsertTextFieldWidget> {
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
          hintText: '등록하세요.',
          hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: GRAY_2,
            fontWeight: FontWeight.w500,
          ),
          border: InputBorder.none
      ),
    );
  }
}
