import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CstLoadingScreen extends StatelessWidget {
  const CstLoadingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: CupertinoActivityIndicator(
          radius: 16,
        ),
      ),
    );
  }
}
