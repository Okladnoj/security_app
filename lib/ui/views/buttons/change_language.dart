import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/app_controller/app_controller_cubit.dart';
import '../../../l10n/localization_helper.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    AppControllerCubit cubit() => context.read();

    final listPopups = AppLocalizations.supportedLocales.map((locale) {
      return PopupMenuItem<Locale>(
        value: locale,
        child: Row(
          children: [
            Text(locale.flag),
            const SizedBox(width: 4),
            Text(locale.name),
          ],
        ),
      );
    }).toList();

    final currentLocale = cubit().state.locale;

    return PopupMenuButton<Locale>(
      initialValue: currentLocale,
      icon: Icon(
        Icons.g_translate,
        size: 30,
        color: Theme.of(context).colorScheme.primary,
      ),
      onSelected: cubit().changeLanguage,
      itemBuilder: (BuildContext context) => listPopups,
    );
  }
}
