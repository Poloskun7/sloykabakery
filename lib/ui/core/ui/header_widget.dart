import 'package:flutter/material.dart';
import 'package:sloykabakery/ui/core/themes/theme.dart';

class HeaderWidget extends StatelessWidget {
  final String name;

  const HeaderWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name,
        style: AppTextStyles.heading_1,
      ),
    );
  }
}
