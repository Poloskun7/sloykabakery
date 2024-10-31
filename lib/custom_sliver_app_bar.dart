import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

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
            // backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 16, bottom: 10),
                title: Text('СЛОЙКА', style: AppTextStyles.logo),
                centerTitle: false,
              ),
              shadowColor: Colors.grey,
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
