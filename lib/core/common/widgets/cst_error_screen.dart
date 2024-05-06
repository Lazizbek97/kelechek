import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CstErrorScreen extends StatelessWidget {
  const CstErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text(
          'Something went wrong',
        ),
      ),
    );
  }
}
