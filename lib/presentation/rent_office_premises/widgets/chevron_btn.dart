import 'package:flutter/material.dart';

class CustomChevronBtn extends StatelessWidget {
  const CustomChevronBtn({
    super.key,
    this.icon = const Icon(Icons.close),
  });
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(
          color: const Color(0XFFE4E4E7),
        ),
      ),
      alignment: Alignment.center,
      child: icon,
    );
  }
}
