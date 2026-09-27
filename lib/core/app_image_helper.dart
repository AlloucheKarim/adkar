import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AppImageHelper {
  static ImageProvider getProvider(String path) {
    if (kIsWeb) {
      return NetworkImage(path);
    } else {
      return FileImage(File(path));
    }
  }

  static Widget buildWidget(
    String path, {
    double? width,
    double? height,
    BoxFit fit = BoxFit.cover,
    BorderRadius? borderRadius,
  }) {
    Widget imageWidget;
    if (kIsWeb) {
      imageWidget = Image.network(
        path,
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(width, height),
      );
    } else {
      imageWidget = Image.file(
        File(path),
        width: width,
        height: height,
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(width, height),
      );
    }

    if (borderRadius != null) {
      return ClipRRect(
        borderRadius: borderRadius,
        child: imageWidget,
      );
    }
    return imageWidget;
  }

  static Widget _buildErrorWidget(double? width, double? height) {
    return Container(
      width: width,
      height: height,
      color: const Color(0xFFE6C98A).withValues(alpha: 0.2),
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: Color(0xFFC09D63),
        size: 24,
      ),
    );
  }
}
