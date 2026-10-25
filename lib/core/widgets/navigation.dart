import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routing/routes.dart';
import '../themes/colors.dart';
import '../themes/dimens.dart';
import '../themes/theme.dart';

class Navigation extends StatelessWidget {
  final Widget child;
  final String location;
  const Navigation({super.key, required this.child, required this.location});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.richPurplishRedColor,
    body: SafeArea(
      bottom: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: AppDimens.contentMaxWidth,
          ),
          child: ColoredBox(
            color: AppColors.background,
            child: Column(
              children: [
                ColoredBox(
                  color: AppColors.richPurplishRedColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.pagePadding,
                        ),
                        child: SizedBox(
                          height: AppDimens.headerHeight,
                          child: Row(
                            children: [
                              Expanded(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  alignment: Alignment.centerLeft,
                                  child: Semantics(
                                    label: 'Слойка — главная',
                                    button: true,
                                    child: InkWell(
                                      onTap: () => context.go(Routes.home),
                                      child: const ExcludeSemantics(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'сло́йка',
                                              style: AppTextStyles.logo,
                                            ),
                                            Text(
                                              '®',
                                              style: TextStyle(
                                                color: AppColors.onBrand,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton.outlined(
                                tooltip: 'Поиск по меню',
                                style: IconButton.styleFrom(
                                  foregroundColor: AppColors.onBrand,
                                  side: BorderSide(
                                    color: AppColors.onBrand.withValues(
                                      alpha: .4,
                                    ),
                                  ),
                                ),
                                onPressed: () =>
                                    context.go('${Routes.menu}?search=true'),
                                icon: const Icon(
                                  Icons.search,
                                  size: AppDimens.iconMd,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                          AppDimens.spaceXl,
                          AppDimens.spaceXs,
                          AppDimens.spaceXl,
                          AppDimens.spaceXl,
                        ),
                        child: Row(
                          children: [
                            _tab(context, 'Витрина', Routes.home),
                            const SizedBox(width: AppDimens.spaceXs),
                            _tab(context, 'Меню', Routes.menu),
                            const SizedBox(width: AppDimens.spaceXs),
                            _tab(context, 'Кофейни', Routes.cafes),
                            const SizedBox(width: AppDimens.spaceXs),
                            _tab(
                              context,
                              'Избранное',
                              Routes.favorites,
                              icon: Icons.favorite_border,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  Widget _tab(
    BuildContext context,
    String label,
    String path, {
    IconData? icon,
  }) {
    final selected = location == path;
    final button = Semantics(
      selected: selected,
      child: TextButton(
        onPressed: () {
          if (!selected) context.go(path);
        },
        style: TextButton.styleFrom(
          minimumSize: const Size(0, AppDimens.tapTarget),
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.spaceSm),
          foregroundColor: selected
              ? AppColors.richPurplishRedColor
              : AppColors.onBrand,
          backgroundColor: selected ? AppColors.surface : Colors.transparent,
          side: BorderSide(color: AppColors.onBrand.withValues(alpha: .4)),
          shape: const StadiumBorder(),
        ),
        child: icon == null
            ? Text(
                label,
                style: AppTextStyles.label.copyWith(
                  color: selected
                      ? AppColors.richPurplishRedColor
                      : AppColors.onBrand,
                ),
              )
            : Tooltip(
                message: label,
                child: Icon(icon, semanticLabel: label, size: AppDimens.iconMd),
              ),
      ),
    );
    return Expanded(flex: icon == null ? 2 : 1, child: button);
  }
}
