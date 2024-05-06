import 'package:flash/flash.dart';
import 'package:flutter/material.dart';

enum AppInfoType {
  success,
  warning,
  info,
  danger,
  none,
}

class AppFlashController {
  static void showInfo(
    BuildContext context, {
    required String message,
    String? title,
    void Function(FlashController<dynamic> controller)? onClose,
    AppInfoType type = AppInfoType.info,
    bool showCloseBtn = false,
    Duration? duration,
    Duration? transitionDuration,
  }) {
    late Color color;
    Widget? body;
    switch (type) {
      case AppInfoType.success:
        color = Colors.green.shade500;
        body = const Icon(
          Icons.check_circle,
          size: 24,
          color: Colors.white,
        );
      case AppInfoType.warning:
        color = Colors.white;
        body = null;
      case AppInfoType.info:
        color = Colors.blue.shade500;
        body = Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: const Center(
            child: Text(
              'i',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      case AppInfoType.danger:
        color = Colors.red.shade500;
        body = const Icon(
          Icons.info,
          size: 24,
          color: Colors.white,
        );
      case AppInfoType.none:
        color = Colors.red.shade500;
    }

    showFlash(
      context: context,
      duration: duration ?? const Duration(milliseconds: 2000),
      transitionDuration:
          transitionDuration ?? const Duration(milliseconds: 500),
      builder: (BuildContext context, FlashController<dynamic> controller) {
        final isActive = title != null;
        return FlashBar(
          key: Key(message),
          shadowColor: Colors.transparent,
          elevation: 0,
          position: FlashPosition.top,
          controller: controller,
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          behavior: FlashBehavior.floating,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          icon: body != null
              ? Container(
                  width: 24,
                  height: 24,
                  margin: const EdgeInsets.only(left: 16, right: 12),
                  decoration:
                      BoxDecoration(color: color, shape: BoxShape.circle),
                  child: Center(child: body),
                )
              : null,
          shouldIconPulse: false,
          title: isActive
              ? Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                )
              : null,
          content: Text(
            message,
            style: isActive
                ? const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )
                : const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
            textAlign: TextAlign.left,
          ),
        );
      },
    );
  }
}
