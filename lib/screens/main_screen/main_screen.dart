import 'package:flutter/material.dart';
import 'package:sloykabakery/custom_sliver_app_bar.dart';
import 'package:sloykabakery/screens/main_screen/widgets/feedback_button_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/order_banquet_button_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/heading_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/info_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/menu_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/services_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/subscribe_widget.dart';
import 'package:sloykabakery/screens/main_screen/widgets/user_agreement_widget.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> widgets = const [
    HeadingWidget(),
    ServicesWidget(),
    OrderBanquetButtonWidget(),
    SubscribeWidget(),
    InfoWidget(),
    MenuWidget(),
    FeedbackButtonWidget(),
    UserAgreementWidget()
  ];

  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSliverAppBar(widgets: widgets);
  }
}
