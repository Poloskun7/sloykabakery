import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class CustomSliverAppBar extends StatelessWidget {
  final List<Widget> widgets;

  const CustomSliverAppBar({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return BackgroundColorWidget(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 75.0,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Color(0xFFFEFEFE),
                          Color(0xFFFDF7ED),
                          Color(0xFFFBEFDC),
                        ],
                        stops: [0.0, 0.3514, 1.0],
                      ),
                    ),
                  ),
                  const FlexibleSpaceBar(
                    titlePadding: EdgeInsets.only(left: 16, bottom: 10),
                    title: Text(
                      'СЛОЙКА',
                      style: AppTextStyles.logo,
                    ),
                    centerTitle: false,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                widgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}