import 'package:flutter/material.dart';

class CstNetworkErrorScreen extends StatelessWidget {
  const CstNetworkErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Network Error'),
      ),
    );
  }
}
