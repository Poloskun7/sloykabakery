import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_colors.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<Widget> widgets;

  const CustomSliverAppBar({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            expandedHeight: 75.0,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.only(left: 16, bottom: 10),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'СЛОЙКА',
                    style: TextStyle(
                      color: AppColors.one,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              centerTitle: false,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              widgets,
            ),
          ),
        ],
      ),
    );
  }
}