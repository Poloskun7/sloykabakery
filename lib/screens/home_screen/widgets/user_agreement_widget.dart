import 'package:flutter/material.dart';
import 'package:sloykabakery/themes/app_theme.dart';

class UserAgreementWidget extends StatelessWidget {
  const UserAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        SizedBox(height: 10),
        Text('Пользовательское соглашение', style: AppTextStyles.comment),
        Text('2024, Слойка. Сеть ресторанов в Санкт‑Петербурге',
            style: AppTextStyles.comment),
        SizedBox(height: 20),
        Text('Разработка приложения СЕТЕВЫЕ РЕШЕНИЯ 2.0 ',
            style: AppTextStyles.comment),
      ],
    );
  }
}
