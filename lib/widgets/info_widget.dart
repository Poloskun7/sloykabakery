import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_themes.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarketingContactWidget(),
          SizedBox(height: 20),
          Divider(color: AppColors.dividerColor,),
          SizedBox(height: 20),
          ArendaContactWidget()
        ]);
  }
}

class MarketingContactWidget extends StatelessWidget {
  const MarketingContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('+7(921)440-25-05', style: AppTextStyles.heading_3),
        Text('пн-пт: 08:30 – 18:00', style: AppTextStyles.comment),
        SizedBox(height: 20),
        Text('marketing@sloykabakery.ru', style: AppTextStyles.heading_3),
        Text('по любым вопросам', style: AppTextStyles.comment)
      ],
    );
  }
}

class ArendaContactWidget extends StatelessWidget {
  const ArendaContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('+7(812)332-93-63', style: AppTextStyles.heading_3),
        Text('пн-пт: 08:30 – 18:00', style: AppTextStyles.comment),
        SizedBox(height: 20),
        Text('arenda@sloykabakery.ru', style: AppTextStyles.heading_3),
        Text('предложить помещение', style: AppTextStyles.comment)
      ],
    );
  }
}
